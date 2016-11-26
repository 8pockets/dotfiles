### zshプロンプト設定
# カラーの設定を$fg[red]のように人がわかるような書き方ができる
autoload -Uz colors
colors

#
# Color定義(あとで変更しやすいように)
#
DEFAULT=$'%{\e[0;0m%}'
RESET="%{${reset_color}%}"
GREEN="%{${fg[green]}%}"
BOLD_GREEN="%{${fg_bold[green]}%}"
BLUE="%{${fg[blue]}%}"
BOLD_BLUE="%{${fg_bold[blue]}%}"
RED="%{${fg[red]}%}"
BOLD_RED="%{${fg_bold[red]}%}"
CYAN="%{${fg[cyan]}%}"
BOLD_CYAN="%{${fg_bold[cyan]}%}"
YELLOW="%{${fg[yellow]}%}"
BOLD_YELLOW="%{${fg_bold[yellow]}%}"
MAGENTA="%{${fg[magenta]}%}"
BOLD_MAGENTA="%{${fg_bold[magenta]}%}"
WHITE="%{${fg[white]}%}"
PINK=$'%{\e[38;5;201m%}'
DARK_GREEN=$'%{\e[38;5;006m%}'



setopt prompt_subst
autoload -Uz add-zsh-hook

#
# Gitの状態表示
#
# 記号について
#   - : WorkingTreeに変更がある場合(Indexにaddしていない変更がある場合)
#   + : Indexに変更がある場合(commitしていない変更がIndexにある場合)
#   ? : Untrackedなファイルがある場合
#   * : remoteにpushしていない場合
#
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
    # zshが4.3.10以上の場合
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "+"
    zstyle ':vcs_info:git:*' unstagedstr "-"
    zstyle ':vcs_info:git:*' formats '%s,%u%c,%b'
    zstyle ':vcs_info:git:*' actionformats '%s,%u%c,%b|%a'
fi

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    local _vcs_name _status  _branch_action
    if [ -n "$vcs_info_msg_0_" ]; then
        _vcs_name=$(echo "$vcs_info_msg_0_" | cut -d , -f 1)
        _status=$(_git_untracked_or_not_pushed $(echo "$vcs_info_msg_0_" | cut -d , -f 2))
        _branch_action=$(echo "$vcs_info_msg_0_" | cut -d , -f 3)
        psvar[1]=" ${_status} ${_branch_action} "
    fi
    # 右側プロンプト
    RPROMPT="${RESET}STATUS${RESET}%1(v|${PINK}%1v|)${RESET}${BOLD_YELLOW}${VIRTUAL_ENV:+($(basename "$VIRTUAL_ENV"))}${RESET}[${DARK_GREEN}%D{%Y/%m/%d %H:%M:%S}${RESET}]${RESET}"
}
add-zsh-hook precmd _update_vcs_info_msg

#
# Untrackedなファイルが存在するか未PUSHなら記号を出力
#   Untracked: ?
#   未PUSH: *
#
function _git_untracked_or_not_pushed() {
    local git_status head remotes stagedstr
    local  staged_unstaged=$1 not_pushed="*" untracked="?"
    # カレントがgitレポジトリ下かどうか判定
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = "true" ]; then
        # statusをシンプル表示で取得
        git_status=$(git status -s 2> /dev/null)
        # git status -s の先頭が??で始まる行がない場合、Untrackedなファイルは存在しない
        if ! echo "$git_status" | grep "^??" > /dev/null 2>&1; then
            untracked=""
        fi

        # stagedstrを取得
        zstyle -s ":vcs_info:git:*" stagedstr stagedstr
        # git status -s の先頭がAで始まる行があればstagedと判断
        if [ -n "$stagedstr" ] && ! printf "$staged_unstaged" | grep "$stagedstr" > /dev/null 2>&1 \
            && echo "$git_status" | grep "^A" > /dev/null 2>&1; then
            staged_unstaged=${staged_unstaged}${stagedstr}
        fi

        # HEADのハッシュ値を取得
        #  --verify 有効なオブジェクト名として使用できるかを検証
        #  --quiet  --verifyと共に使用し、無効なオブジェクトが指定された場合でもエラーメッセージを出さない
        #           そのかわり終了ステータスを0以外にする
        head=$(git rev-parse --verify -q HEAD 2> /dev/null)
        if [ $? -eq 0 ]; then
            # HEADのハッシュ値取得に成功
            # リモートのハッシュ値を配列で取得
            remotes=($(git rev-parse --remotes 2> /dev/null))
            if [ "$remotes[*]" ]; then
                # リモートのハッシュ値取得に成功(リモートが存在する)
                for x in ${remotes[@]}; do
                    # リモートとHEADのハッシュ値が一致するか判定
                    if [ "$head" = "$x" ]; then
                        # 一致した場合はPUSH済み
                        not_pushed=""
                        break
                    fi
                done
            else
                # リモートが存在しない場合
                not_pushed=""
            fi
        else
            # HEADが存在しない場合(init直後など)
            not_pushed=""
        fi

        # Untrackedなファイルが存在するか未PUSHなら記号を出力
        if [ -n "$staged_unstaged" -o -n "$untracked" -o -n "$not_pushed" ]; then
            printf "${staged_unstaged}${untracked}${not_pushed}"
        fi
    fi
    return 0
}

# PROMPT：左側に表示されるの通常のプロンプト
PROMPT="%{${fg[yellow]}%}%n@%m %{${fg[green]}%}%~ %{${fg[cyan]}%}
%# %{${reset_color}%}"
# PROMPT2：2行以上のコマンドを入力する際に表示されるプロンプト
PROMPT2="%{${fg[yellow]}%} %_ > %{${reset_color}%}"
# SPROMPT：コマンドを打ち間違えたときの「もしかして」プロンプト
SPROMPT="%{${fg[white]}%}correct: %R -> %{${fg[red]}%}%r %{${fg[white]}%}? [n,y,a,e] %{${reset_color}%}"

setopt transient_rprompt # 右側まで入力がきたら時間表示を消す
setopt prompt_subst # 変数展開など便利なプロント
bindkey -e # emacsライクなキーバインド
#bindkey -v # viライクなキーバインド
export LANG=ja_JP.UTF-8 # 日本語環境
export EDITOR=vim # エディタはvi

# 補完
autoload -U compinit # 補完機能
compinit -u # 補完を賢くする
setopt autopushd # cdの履歴表示、cd - で一つ前のディレクトリへ
setopt pushd_ignore_dups # 同ディレクトリを履歴に追加しない
setopt auto_cd # ディレクトリ名のみでcd
setopt list_packed # リストを詰めて表示
setopt list_types # 補完一覧をファイル種別に表示
setopt correct # コマンドのスペルチェックを有効に
setopt no_beep # ビープ音を鳴らさない
setopt nolistbeep # 補完候補表示時にビープ音を鳴らさない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 大文字小文字を区別しない（大文字を入力した場合は区別する）
setopt nonomatch #*や#などの特殊文字の使用しない

# 履歴
HISTFILE=~/.zsh_history # historyファイル
HISTFILESIZE=1000000
HISTSIZE=1000000 # ファイルサイズ
SAVEHIST=1000000 # saveする量
setopt hist_ignore_dups # 直前と同じコマンドの場合は履歴に追加しない
setopt hist_reduce_blanks # スペース排除
setopt share_history # 履歴ファイルを共有
setopt extended_history # zshの開始終了を記録

# history 操作
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# add ls color
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'
case "${OSTYPE}" in
darwin*)
  # Mac
  alias ls="ls -GF"
  ;;
linux*)
  # Linux
  alias ls='ls -F --color'
  ;;
esac

# 補完候補もLS_COLORSに合わせて色が付くようにする
zstyle ':completion:*' list-colors "${LS_COLORS}"

# alias
alias vi='vim' # vi で vim 起動
alias rm='rm -i'
alias gd='git diff --color'
alias gdc='git diff --cached'
alias gs='git status'
alias gb='git branch'

export LC_CTYPE="utf-8"
export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/go/bin:/usr/local/sbin:/usr/sbin:/sbin

export GOPATH=$HOME/go

