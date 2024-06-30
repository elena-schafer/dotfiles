# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename "$HOME/.zshrc"

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

# add miniconda to path
export PATH="$PATH:$HOME/miniconda3/condabin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/edgaralenpoe/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/edgaralenpoe/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/edgaralenpoe/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export VISUAL=nvim
export EDITOR=nvim

# Avoid nesting tmux sessions
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	if ! tmux list-sessions >/dev/null 2>&1; then
		exec tmux new -s term0 && exit;
	else
		COUNT=$(tmux list-sessions 2>/dev/null | wc -l)
		COUNT=$((COUNT - 1))
		echo $COUNT
		for i in $(seq 0 $COUNT); do
			if ! tmux list-clients 2>/dev/null | grep -q "term$i"; then
				tmux a -t term$i
			else
				exec tmux new -s term$((i + 1)) && exit;
			fi
		done
	fi
fi
