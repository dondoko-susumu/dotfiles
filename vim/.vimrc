" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible

" スワップファイルを作らない
set noswapfile

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
filetype indent plugin on

" Enable syntax highlighting
" 色づけをオン
syntax on

" カラースキーマ
" colorscheme koehler
" colorscheme jellybeans

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
" 強く推奨するオプション

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" Better command-line completion
" コマンドライン補完を便利に
set wildmenu

" Show partial commands in the last line of the screen
" タイプ途中のコマンドを画面最下行に表示
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" 歴史的にモードラインはセキュリティ上の脆弱性になっていたので、
" オフにして代わりに上記のsecuremodelinesスクリプトを使うとよい。
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
"インクリメンタルサーチ
set incsearch

" Allow backspacing over autoindent, line breaks and start of insert action
" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
" オートインデント
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
" 画面最下行にルーラーを表示する
set ruler

" Always display the status line, even if only one window is displayed
" ステータスラインを常に表示する
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" Use visual bell instead of beeping when doing something wrong
" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
" そしてビジュアルベルも無効化する
set t_vb=

" Enable use of the mouse for all modes
" 全モードでマウスを有効化
set mouse=a

" ターミナルでマウスを使用できるようにする
set guioptions+=a
set ttymouse=xterm2

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
" コマンドラインの高さを2行に
set cmdheight=2

" Display line numbers on the left
" 行番号を表示
set number

" Quickly time out on keycodes, but never time out on mappings
" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
" <F11>キーで'paste'と'nopaste'を切り替える
set pastetoggle=<F11>

" スクロールするときにいちいち画面の一番上とかに行かなくても
" スクロールが開始されるので source reading しやすい。
set scrolloff=10

"カーソルキーで行末／行頭の移動可能に設定
" ※しかし:verbos set whichwrap で確認すると以下の設定無効に。。
" プラグインで書き換えられている可能性あり
set whichwrap=b,s,[,],<,>,~

" ※などの記号文字がずれる対応
set ambiwidth=double

"------------------------------------------------------------
" Indentation options {{{1
" インデント関連のオプション {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
" タブ文字の代わりにスペース2個を使う場合の設定。
" この場合、'tabstop'はデフォルトの8から変えない。
set shiftwidth=2
set softtabstop=2
set expandtab
" default 8 -> 4
set tabstop=2

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
" インデントにハードタブを使う場合の設定。
" タブ文字を2文字分の幅で表示する。
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
" マッピング
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
" Yの動作をDやCと同じにする
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
" <C-L>で検索後の強調表示を解除する
nnoremap <C-L> :nohl<CR><C-L>

" 入力モード時 Emacs風
"----------------------------------------------------
" コマンド入力中断
imap <silent> <C-g> <ESC><ESC><ESC><CR>i

" 消去、編集
imap <C-k> <ESC>d$i
imap <C-y> <ESC>pi
imap <C-d> <ESC>xi

" 移動
imap <C-a>  <Home>
imap <C-e>  <End>
imap <C-b>  <Left>
imap <C-f>  <Right>
imap <C-n>  <Down>
" 入力補完とかぶる
" imap <C-p>  <UP>

"------------------------------------------------------------
" ビジュアルモードで選択したテキストが、クリップボードに入るようにする。
" GUI版でない場合は、こちらの設定を追加する。
set clipboard=unnamed,autoselect

""""""""""""""""""""""""""""""
"全角スペースを表示
"""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので scriptencodingと、
""このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
""scriptencoding cp932

"デフォルトのZenkakuSpaceを定義
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

"------------------------------------------------------------
"文字コードの自動判別
" set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

"------------------------------------------------------------
" Neobundleの記述
set nocompatible               " be iMproved
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'kmnk/vim-unite-giti.git'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'tpope/vim-surround'

" statuslineをかっこよく
NeoBundle 'bling/vim-airline'
" uniteやvimfilerでairlineを優先する
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0

" MarkDown記法のプレビュー
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'

let g:previm_open_cmd = ''
nnoremap [previm] <Nop>
nmap <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>

" カラースキーム
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'git://gist.github.com/187578.git', {'directory': 'h2u_white'}
NeoBundle 'vim-scripts/newspaper.vim'

" カラースキームを一覧/プレビュー
NeoBundle 'ujihisa/unite-colorscheme'

" colorscheme newspaper
" colorscheme molokai
colorscheme jellybeans
" colorscheme hybrid-light
" colorscheme hybrid
" colorscheme h2u_white
" colorscheme louver
" colorscheme summerfruit256
" colorscheme simpleandfriendly
" colorscheme wombat

" set background=light
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized

""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on

"------------------------------------------------------------
" タブの可視化の記述
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

"------------------------------------------------------------
" vimgrepでQuickFixを使用
autocmd QuickFixCmdPost *grep* cwindow

"------------------------------------------------------------
" uniteの設定
"unite {{{

"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>

augroup vimrc
  autocmd FileType unite call s:unite_my_settings()
augroup END
function! s:unite_my_settings()
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "sでsplit
  nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  "vでvsplit
  nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  "fでvimfiler
  nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
endfunction

"}}}

"------------------------------------------------------------
" vimfilerの設定
"vimfiler {{{

"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
"現在開いているバッファのディレクトリを開く
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
"現在開いているバッファをIDE風に開く
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

"デフォルトのキーマッピングを変更
augroup vimrc
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END

function! s:vimfiler_my_settings()
  nmap <buffer> q <Plug>(vimfiler_exit)
  nmap <buffer> Q <Plug>(vimfiler_hide)
endfunction

"}}}

"------------------------------------------------------------
" .vimrcを開く
nnoremap <Space>.  :<C-u>edit $MYVIMRC<CR>
" source ~/.vimrc を実行する。
nnoremap <Space>,  :<C-u>source $MYVIMRC<CR> 


"------------------------------------------------------------
" giti
nmap <Space>gd <SID>(git-diff-cached)
nmap <Space>gD <SID>(git-diff)
nmap <Space>gf <SID>(git-fetch-now)
nmap <Space>gF <SID>(git-fetch)
nmap <Space>gp <SID>(git-push-now)
nmap <Space>gP <SID>(git-pull-now)
nmap <Space>gl <SID>(git-log-line)
nmap <Space>gL <SID>(git-log)


"unite prefix key.
" nnoremap [unite] <Nop>
" nmap <Space>f [unite]

nmap [unite]gg    <SID>(giti-sources)
nmap [unite]gst   <SID>(git-status)
nmap [unite]gb    <SID>(git-branch)
nmap [unite]gB    <SID>(git-branch_all)
nmap [unite]gc    <SID>(git-config)
nmap [unite]gl    <SID>(git-log)
nmap [unite]gL    <SID>(git-log-this-file)

" giti {{{
if globpath(&rtp, 'plugin/giti.vim') != ''
	let g:giti_log_default_line_count = 100
	nnoremap <expr><silent> <SID>(git-diff)        ':<C-u>GitiDiff ' . expand('%:p') . '<CR>'
	nnoremap <expr><silent> <SID>(git-diff-cached) ':<C-u>GitiDiffCached ' . expand('%:p') .  '<CR>'
	nnoremap       <silent> <SID>(git-fetch-now)    :<C-u>GitiFetch<CR>
	nnoremap       <silent> <SID>(git-fetch)        :<C-u>GitiFetch 
	nnoremap <expr><silent> <SID>(git-push-now)    ':<C-u>GitiPushWithSettingUpstream origin ' . giti#branch#current_name() . '<CR>'
	nnoremap       <silent> <SID>(git-push)         :<C-u>GitiPush 
	nnoremap       <silent> <SID>(git-pull-now)     :<C-u>GitiPull<CR>
	nnoremap       <silent> <SID>(git-pull)         :<C-u>GitiPull 
	nnoremap       <silent> <SID>(git-log-line)     :<C-u>GitiLogLine ' . expand('%:p') . '<CR>'
	nnoremap       <silent> <SID>(git-log)          :<C-u>GitiLog ' . expand('%:p') . '<CR>'

	nnoremap <silent> <SID>(giti-sources)   :<C-u>Unite giti<CR>
	nnoremap <silent> <SID>(git-status)     :<C-u>Unite giti/status<CR>
	nnoremap <silent> <SID>(git-branch)     :<C-u>Unite giti/branch<CR>
	nnoremap <silent> <SID>(git-branch_all) :<C-u>Unite giti/branch_all<CR>
	nnoremap <silent> <SID>(git-config)     :<C-u>Unite giti/config<CR>
	nnoremap <silent> <SID>(git-log)        :<C-u>Unite giti/log<CR>

	nnoremap <silent><expr> <SID>(git-log-this-file) ':<C-u>Unite giti/log:' . expand('%:p') . '<CR>'
endif
" }}}

"--- <F5>  タイムスタンプを挿入してinsertモードへ移行 ----
nmap <F5> <ESC>i<C-R>=strftime("%Y/%m/%d")<CR>

" URL を開く設定
function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction

" URL を開くキーバインドの設定
nmap <Space>op :call HandleURI()<CR>

"括弧を入力したあと左に移動する
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

