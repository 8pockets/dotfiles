# ログイン時にzshが起動するようにする
if [ -f  /usr/local/bin/zsh ]; then
    exec /usr/local/bin/zsh
fi

#コマンドライン設定
#if [ -n "$SSH_CLIENT" ]; then text=" ssh-session"
#fi

if [ -f ~/dotfiles/.git-completion.bash ]; then
    source ~/dotfiles/.git-completion.bash
fi

if [ -f ~/dotfiles/.git-prompt.sh ]; then
    source ~/dotfiles/.git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true
#add されていない変更の存在を「＊」で示す
#commit されていない変更の存在を「＋」で示す
GIT_PS1_SHOWUNTRACKEDFILES=true
#add されていない新規ファイルの存在を「％」で示す
GIT_PS1_SHOWSTASHSTATE=true
#stash がある場合は「＄」で示す
GIT_PS1_SHOWUPSTREAM=auto
#upstream と同期している場合は「＝」で示す
#upstream より進んでいる場合は「＞」で示す
#upstream より遅れている場合は「＜」で示す

#一番左に時間が表示されるパターン
#export PS1='\[\[\e[1;32m\]\t \[\e[1;33m\]\u@\[\e[0;34m\]\h:\w\$\[\e[1;37m\] '
export PS1='\[\e[0;35m\]$(__git_ps1 [%s]) \[\e[1;33m\]\u@\[\e[0;34m\]\h:\w\$\[\e[1;37m\] '

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

#cdで移動した後に、lsを自動出力
function ls_after_cd(){
  [[ $JUST_BEFORE_PWD != $PWD ]] && ls -la
  JUST_BEFORE_PWD=$PWD
}
export PROMPT_COMMAND="ls_after_cd"

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

#エイリアス設定
#alias ls='ls -la --color=auto'
alias rm='rm -i'
alias sudo='sudo -E'
