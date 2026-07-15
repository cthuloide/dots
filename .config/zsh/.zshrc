# ============================================================
# 1. NON-INTERACTIVE GUARD
# ============================================================
[[ $- != *i* ]] && return

# ============================================================
# 2. ZSH OPTIONS (setopt / unsetopt)
# ============================================================
setopt autocd
setopt interactive_comments

# ============================================================
# 3. ENVIRONMENT VARIABLES
# ============================================================
export EDITOR='nvim'
export TERMINAL='kitty'
export MANPAGER='nvim +Man!'

# ============================================================
# 4. PATH
# ============================================================
# (empty — add custom bin dirs here if you ever need them,
#  e.g. export PATH="$HOME/.local/bin:$PATH")

# ============================================================
# 5. HISTORY CONFIGURATION
# ============================================================
HISTFILE="$HOME/.config/zsh/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt inc_append_history

# ============================================================
# 6. PLUGIN MANAGER INIT
# ============================================================
# (none — vanilla zsh, plugins sourced manually in section 7)

# ============================================================
# 7. PLUGINS
# ============================================================
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# fast-syntax-highlighting is sourced at the very end of this file —
# see the note there for why.

# ============================================================
# 8. COMPLETION SYSTEM
# ============================================================
autoload -Uz compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

# ============================================================
# 9. KEY BINDINGS
# ============================================================
bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey '^?' backward-delete-char

# Cursor shape by vi mode (block in normal mode, beam in insert mode)
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;
        viins|main) echo -ne '\e[5 q';;
    esac
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins
    echo -ne '\e[5 q'
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M visual '^[[P' vi-delete

# ============================================================
# 10. ALIASES
# ============================================================
alias eza='eza --group-directories-first --color=always'
alias ls='eza'
alias la='eza --all'
alias ll='eza --long'
alias lla='eza --long --all'
alias h='$HOME/'
alias d='$HOME/Documents/'
alias D='$HOME/Downloads/'
alias m='$HOME/Music/'
alias pp='$HOME/Pictures/'
alias vv='$HOME/Videos/'
alias cf='$HOME/.config/'
alias v='$EDITOR'
alias cfz='$EDITOR $HOME/.config/zsh/.zshrc'
alias cfv='$EDITOR $HOME/.config/nvim/init.lua'

# ============================================================
# 11. FUNCTIONS
# ============================================================
# (reserved for general-purpose shell functions — the ZLE/keybinding
# widgets moved to section 9, next to the bindkey calls they pair with)

# ============================================================
# 12. PROMPT / THEME
# ============================================================
eval "$(starship init zsh)"

# ============================================================
# 13. LOCAL / MACHINE-SPECIFIC OVERRIDES
# ============================================================
[[ -f "$HOME/.config/zsh/.zshrc.local" ]] && source "$HOME/.config/zsh/.zshrc.local"

# ------------------------------------------------------------
# fast-syntax-highlighting must load after everything else that
# defines ZLE widgets (plugins, keybindings, local overrides) —
# it wraps existing widgets, so anything defined after it loads
# won't get wrapped correctly.
# ------------------------------------------------------------
source $HOME/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
