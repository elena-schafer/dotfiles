# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/edgaralenpoe/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
setopt appendhistory

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '[%b]%m%u%c '
# This line should cause a sign when in the middle of a merge or rebase
zstyle ':vcs_info:git:*' actionformats '[%b|%a]%m%u%c '

setopt PROMPT_SUBST
PROMPT='%(?.%F{blue}✓%f.💩) %F{green}%*%f %F{blue}%/%f %F{red}${vcs_info_msg_0_}%f$ '

bindkey -v
bindkey '^R' history-incremental-search-backward

source $HOME/antigen.zsh
    
# Load the oh-my-zsh's library
antigen use oh-my-zsh

# Load plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle colored-man-pages
# This one should always be last
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done
antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
