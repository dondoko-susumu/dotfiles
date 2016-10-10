#環境変数を日本語に
export LANG=ja_JP.UTF-8

#vim
export EDITOR=vim

#prompt
# PROMPT="%n@%m%# "
PROMPT="%# "
RPROMPT="[%~]"

#日本語ファイル名を表示可能にする
setopt print_eight_bit

#beepを無効に
setopt no_beep

#同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

#ヒストリに保存する時、すでに重複したコマンドがあったら古い方を削除
setopt hist_save_nodups

#スペースから始まるコマンドはヒストリに残さない
setopt hist_ignore_space

#ヒストリに保存する時余分なスペースを削除
setopt hist_reduce_blanks

# zsh-completions 補完を強化
fpath=($HOME/src/github.com/zsh-users/zsh-completions/src(N-/) $fpath)

#補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu

#補完候補をカーソルキーで選択(2つ候補があった時)
zstyle ':completion:*:default' menu select=2

#補完候補を大文字と小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#高機能なワイルドカード展開を使用する
setopt extended_glob

#auto cd
setopt auto_cd
setopt auto_pushd

#誤り訂正
setopt correct

#aliasも展開して補完
setopt complete_aliases

#Ctrl+rで履歴から補完
bindkey -e

#コマンドのオプションも補完
autoload -Uz compinit
compinit

#コマンド履歴を永続保存
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Ctrl+rでコマンド履歴をインクリメンタル検索する
bindkey '^r' history-incremental-pattern-search-backward
# Ctrl+sで巻き戻す
bindkey '^s' history-incremental-pattern-search-forward

#コマンド入力途中でCtrl+pでコマンド履歴検索
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^p" history-beginning-search-backward-end

# cdr cdr-lでcd履歴表示,cdr+tabで補完
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# cdrのMAX件数
zstyle ':chpwd:*' recent-dirs-max 200

# cdrでcdできる
zstyle ":chpwd:*" recent-dirs-default true

# Ctrl+wで単語の区切りを削除
# なぜか/区切りのオプションが効かない
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars ' _-./=;@:{},|'
zstyle ':zle:*' word-style unspecified

# zmv 複数のファイルを一括でリネーム
autoload -Uz zmv

# go path
export GOPATH=$HOME

# Antigen zshプラグイン管理
if [[ -f $HOME/src/github.com/zsh-users/antigen/antigen.zsh ]]; then
  source $HOME/src/github.com/zsh-users/antigen/antigen.zsh
  antigen bundle mollifier/anyframe
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen apply
fi

# anyframe bindkey

# 過去に移動したことのあるディレクトリに移動する(cdrが必要)
bindkey '^xb' anyframe-widget-cdr
# Gitブランチを切り替える
bindkey '^x^b' anyframe-widget-checkout-git-branch

# コマンドライン履歴から選んで実行する
bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history

# コマンドライン履歴から選んでコマンドラインに挿入する
bindkey '^xp' anyframe-widget-put-history
bindkey '^x^p' anyframe-widget-put-history

# ghqコマンドで管理しているリポジトリに移動する(ghqが必要)
bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^x^g' anyframe-widget-cd-ghq-repository

# プロセスをkillする
bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill

# Gitブランチ名をコマンドラインに挿入する
bindkey '^xi' anyframe-widget-insert-git-branch
bindkey '^x^i' anyframe-widget-insert-git-branch

# ファイル名をコマンドラインに挿入する
bindkey '^xf' anyframe-widget-insert-filename
bindkey '^x^f' anyframe-widget-insert-filename

# vcs_info 設定

autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
autoload -Uz colors

# 以下の3つのメッセージをエクスポートする
#   $vcs_info_msg_0_ : 通常メッセージ用 (緑)
#   $vcs_info_msg_1_ : 警告メッセージ用 (黄色)
#   $vcs_info_msg_2_ : エラーメッセージ用 (赤)
zstyle ':vcs_info:*' max-exports 3

zstyle ':vcs_info:*' enable git svn hg bzr
# 標準のフォーマット(git 以外で使用)
# misc(%m) は通常は空文字列に置き換えられる
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b]' '%m' '<!%a>'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true


if is-at-least 4.3.10; then
    # git 用のフォーマット
    # git のときはステージしているかどうかを表示
    zstyle ':vcs_info:git:*' formats '(%s)-[%b]' '%c%u %m'
    zstyle ':vcs_info:git:*' actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "+"    # %c で表示する文字列
    zstyle ':vcs_info:git:*' unstagedstr "-"  # %u で表示する文字列
fi

# hooks 設定
if is-at-least 4.3.11; then
    # git のときはフック関数を設定する

    # formats '(%s)-[%b]' '%c%u %m' , actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
    # のメッセージを設定する直前のフック関数
    # 今回の設定の場合はformat の時は2つ, actionformats の時は3つメッセージがあるので
    # 各関数が最大3回呼び出される。
    zstyle ':vcs_info:git+set-message:*' hooks \
                                            git-hook-begin \
                                            git-untracked \
                                            git-push-status \
                                            git-nomerge-branch \
                                            git-stash-count

    # フックの最初の関数
    # git の作業コピーのあるディレクトリのみフック関数を呼び出すようにする
    # (.git ディレクトリ内にいるときは呼び出さない)
    # .git ディレクトリ内では git status --porcelain などがエラーになるため
    function +vi-git-hook-begin() {
        if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
            # 0以外を返すとそれ以降のフック関数は呼び出されない
            return 1
        fi

        return 0
    }

    # untracked ファイル表示
    #
    # untracked ファイル(バージョン管理されていないファイル)がある場合は
    # unstaged (%u) に ? を表示
    function +vi-git-untracked() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if command git status --porcelain 2> /dev/null \
            | awk '{print $1}' \
            | command grep -F '??' > /dev/null 2>&1 ; then

            # unstaged (%u) に追加
            hook_com[unstaged]+='?'
        fi
    }

    # push していないコミットの件数表示
    #
    # リモートリポジトリに push していないコミットの件数を
    # pN という形式で misc (%m) に表示する
    function +vi-git-push-status() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if [[ "${hook_com[branch]}" != "master" ]]; then
            # master ブランチでない場合は何もしない
            return 0
        fi

        # push していないコミット数を取得する
        local ahead
        ahead=$(command git rev-list origin/master..master 2>/dev/null \
            | wc -l \
            | tr -d ' ')

        if [[ "$ahead" -gt 0 ]]; then
            # misc (%m) に追加
            hook_com[misc]+="(p${ahead})"
        fi
    }

    # マージしていない件数表示
    #
    # master 以外のブランチにいる場合に、
    # 現在のブランチ上でまだ master にマージしていないコミットの件数を
    # (mN) という形式で misc (%m) に表示
    function +vi-git-nomerge-branch() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if [[ "${hook_com[branch]}" == "master" ]]; then
            # master ブランチの場合は何もしない
            return 0
        fi

        local nomerged
        nomerged=$(command git rev-list master..${hook_com[branch]} 2>/dev/null | wc -l | tr -d ' ')

        if [[ "$nomerged" -gt 0 ]] ; then
            # misc (%m) に追加
            hook_com[misc]+="(m${nomerged})"
        fi
    }


    # stash 件数表示
    #
    # stash している場合は :SN という形式で misc (%m) に表示
    function +vi-git-stash-count() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        local stash
        stash=$(command git stash list 2>/dev/null | wc -l | tr -d ' ')
        if [[ "${stash}" -gt 0 ]]; then
            # misc (%m) に追加
            hook_com[misc]+=":S${stash}"
        fi
    }

fi

function _update_vcs_info_msg() {
    local -a messages
    local prompt

    LANG=en_US.UTF-8 vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
        # vcs_info で何も取得していない場合はプロンプトを表示しない
        prompt="[%~]"
    else
        # vcs_info で情報を取得した場合
        # $vcs_info_msg_0_ , $vcs_info_msg_1_ , $vcs_info_msg_2_ を
        # それぞれ緑、黄色、赤で表示する
        [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
        [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
        [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%F{red}${vcs_info_msg_2_}%f" )

        # 間にスペースを入れて連結する
        prompt="${(j: :)messages}"
    fi

    RPROMPT="$prompt"
}
add-zsh-hook precmd _update_vcs_info_msg

#alias

#ls
alias ls='ls -FG'
alias la='ls -alGh'
alias ll='ls -lGh'

#git
alias g='git'
function git_current_branch_name()
{
  git branch | grep '^\*' | sed 's/^\* *//'
}
alias -g B='"$(git_current_branch_name)"'

#vim
alias vi='vim'

#zmv
alias zmv='noglob zmv -W'

#global alias
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g N='> /dev/null'
alias -g V='| vim -R -'
alias -g P=' --help | less'
