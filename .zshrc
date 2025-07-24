# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
#set history size
export HISTSIZE=100000
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zhistory
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY   

alias rm='rm -i'
alias ccd='cd ..'
alias ll='ls -las'
alias gd='git diff'
alias gc='git checkout'
alias gdc='git diff --color-words --cached'
alias gs='git status'
alias gb='git branch'
alias ggrep='git grep'
alias gcom='git commit -m"fix"'
alias gpush='git push origin HEAD'
alias k='kubectl'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="/home/shin/.nodebrew/current/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/go/bin:/home/shin/bin:/usr/local/go/bin:/home/shin/bin:/usr/sbin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH

[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# JAVA
#export JAVA_HOME=$(/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8")
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH="$JAVA_HOME/bin:$PATH"


# git
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit -u

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/lab/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/lab/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/lab/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/lab/google-cloud-sdk/completion.zsh.inc"; fi

export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/gcloud/application_default_credentials.json
export CRED=$HOME/.config/gcloud/application_default_credentials.json

# goenv
export GOENV_ROOT="$HOME/.goenv"
export GOPATH="$HOME/go"
export PATH="$GOENV_ROOT/bin:$GOPATH/bin:$PATH"
export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"
export MallocNanoZone=0

# flutter
export PATH="$HOME/lab/flutter/bin:$PATH"
# Android tools
export PATH="$HOME/Library/Android/sdk:$PATH"

eval "$(direnv hook zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function fzf-history-widget() {
    local tac=${commands[tac]:-"tail -r"}
    BUFFER=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | sed 's/ *[0-9]* *//' | eval $tac | awk '!a[$0]++' | fzf +s)
    CURSOR=$#BUFFER
    zle clear-screen
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


