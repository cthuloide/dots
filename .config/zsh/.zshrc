# ─── Options ──────────────────────────────────────────────────────────────────

setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP
setopt CORRECT

stty stop undef   # disable ctrl-s freeze


# ─── History ──────────────────────────────────────────────────────────────────

HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY


# ─── Completion ───────────────────────────────────────────────────────────────

autoload -Uz compinit

# only regenerate completion dump once per day
if [[ -n "$ZDOTDIR/.zcompdump"(#qN.mh+24) ]]; then
    compinit -d "$ZDOTDIR/.zcompdump"
else
    compinit -C -d "$ZDOTDIR/.zcompdump"
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

zmodload zsh/complist
_comp_options+=(globdots)


# ─── Vi Mode ──────────────────────────────────────────────────────────────────

bindkey -v
export KEYTIMEOUT=1

# vim keys in completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# cursor shape per mode
function zle-keymap-select() {
    case $KEYMAP in
        vicmd)      echo -ne '\e[1 q' ;;   # block
        viins|main) echo -ne '\e[5 q' ;;   # beam
    esac
}
zle -N zle-keymap-select

function zle-line-init() {
    zle -K viins
    echo -ne '\e[5 q'
}
zle -N zle-line-init

echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' }

# edit command in vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line


# ─── Keybindings ──────────────────────────────────────────────────────────────

bindkey '^[[P' delete-char
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M visual '^[[P' vi-delete


# ─── Functions ────────────────────────────────────────────────────────────────

# cd into a directory selected by fzf
function fzf-cd() {
    local dir
    dir="$(find . -type d 2>/dev/null | fzf)" || return
    builtin cd "$dir"
    zle reset-prompt
}
zle -N fzf-cd
bindkey '^f' fzf-cd

# lf directory changer
function lfcd() {
    local tmp
    tmp="$(mktemp -uq)"
    trap 'rm -f "$tmp" >/dev/null 2>&1' HUP INT QUIT TERM PWR EXIT
    lf -last-dir-path="$tmp" "$@"
    if [[ -f "$tmp" ]]; then
        local dir
        dir="$(cat "$tmp")"
        [[ -d "$dir" && "$dir" != "$(pwd)" ]] && builtin cd "$dir"
    fi
}
bindkey -s '^o' '^ulfcd\n'


# ─── Sources ──────────────────────────────────────────────────────────────────

[[ -f "$HOME/.config/shell/aliasrc" ]]    && source "$HOME.config/shell/aliasrc"
[[ -f "$HOME/.config/shell/shortcutrc" ]] && source "$HOME/.config/shell/shortcutrc"


# ─── Plugins ──────────────────────────────────────────────────────────────────

# configure before sourcing
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ─── Prompt ───────────────────────────────────────────────────────────────────

eval "$(starship init zsh)"
