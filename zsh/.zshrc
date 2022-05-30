##### PATHS
export PATH=$HOME/bin:/usr/local/bin:$PATH
#Emacs doom path
export PATH=$HOME/.emacs.d/bin:$PATH

export ANDROID_SDK=/home/glasseye/Android/Sdk

##### autoload vcs and colors
autoload -U colors && colors
autoload -Uz vcs_info

# with path
# PROMPT="%B%{$fg[white]%}-> %{$fg[blue]%}%n %{$fg[magenta]%}%~ %{$fg[white]%}<-%{$reset_color%}$%b "
#wihout path
# PROMPT="%B%{$fg[white]%}-> %{$fg[blue]%}%n %{$fg[white]%}<-%{$reset_color%}$%b "
# only path
# PROMPT="%B%{$fg[blue]%}-> %{$fg[magenta]%}%~ %{$fg[blue]%}$%b"

###### Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	

###### git with prompt
zstyle ':vcs_info:*' enable git 
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"

PROMPT="%(?:%{$fg_bold[blue]%}➜ :%{$fg_bold[blue]%}➜ )%{$fg[blue]%}%c%{$reset_color%}"
PROMPT+="\$vcs_info_msg_0_ "

####### vi mode
bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins 
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' 
preexec() { echo -ne '\e[5 q' ;} 


###### FZF
source /usr/share/fzf/completion.zsh && source /usr/share/fzf/key-bindings.zsh
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

###### aliases
alias v="nvim"
alias code="cd /mnt/Media/Code/"
alias work="cd /mnt/Media/Code/work"
alias dl="cd /mnt/Media/Downloads"
alias config="cd ~/.config"
alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -al"
alias ra=". ranger"
alias ranger=". ranger"
alias rnb="/mnt/Media/Downloads/react-native-debugger/react-native-debugger"
alias rm="gomi"
alias lv="lvim"

##### Plugins
# auto suggestions.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# to activate Node Version Manager, we have to run a node command first, this way we can lay load it without
# slowing down the shell
lazy_load_nvm() {
  unset -f node
  export NVM_DIR=~/.nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
}

node() {
  lazy_load_nvm
  node $@
}

### LF switch directory on quit

LFCD=$HOME/.config/lf/lfcd.sh


if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
