"
"
" 基本設定
"
"
let mapleader = ','              " キーマップリーダー
set scrolloff=5                  " スクロール時の余白確保
set textwidth=0                  " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
"set noswapfile                   " スワップファイル作らない
set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                     " ビープをならさない
set browsedir=buffer             " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,>,<,],[    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効
set notitle                      " vimを使ってくれてありがとう

"ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

"ヤンクした文字は、システムのクリップボードに入れる"
set clipboard=unnamed,autoselect
"挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする "
imap <C-p>  <ESC>"*pa

" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

set helpfile=$VIMRUNTIME/doc/help.txt

" vimのタブ移動をCtrl + n(ext)とCtrl + p(review)でできるようにする。
nnoremap <C-n> gt
nnoremap <C-p> gT

" ファイルタイプ判定をon
filetype plugin on

" NeoBundle - Vimプラグイン管理
" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('vim_starting')
   if &compatible
    set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 "NeoBundle 'Shougo/unite.vim'
 "NeoBundle 'Shougo/vimproc'
 "NeoBundle 'Shougo/vimfiler'
 NeoBundle 'scrooloose/nerdtree'
 "NeoBundle 'bling/vim-airline'
 NeoBundle 'tomasr/molokai'
" コメントON/OFFを手軽に実行
 NeoBundle 'tomtom/tcomment_vim'
" インデントに色を付けて見やすくする
"NeoBundle 'nathanaelkane/vim-indent-guides'
" シンタックスチェック
" NeoBundle 'scrooloose/syntastic'
" phpcs
" NeoBundle 'bpearson/vim-phpcs.git'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"vimprocを適切に読み込む
"let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
"インデントの色設定
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=black
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
"let g:indent_guides_enable_on_vim_startup = 1

" NERDTree設定
" いつでも<C-e>で開閉
  nmap <silent> <C-e>      :NERDTreeToggle<CR>
  vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
  omap <silent> <C-e>      :NERDTreeToggle<CR>
  imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
  cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
"隠しファイルを表示する。
let NERDTreeShowHidden = 1
let NERDTreeWinSize = 40
"引数なしで実行したとき、NERDTreeを実行する
let file_name = expand("")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * execute 'NERDTree ./'
endif

" syntastic設定
" https://github.com/scrooloose/syntastic/blob/master/doc/syntastic.txt
"let g:syntastic_mode_map = {
"  \ 'mode': 'active',
"  \ 'active_filetypes': ['php']
"  \}
"let g:syntastic_php_checkers = ["phpcs"]
"let g:syntastic_php_phpcs_args='--standard=psr2'
"let g:syntastic_check_on_open = 0
"let g:syntastic_enable_signs = 1
"let g:syntastic_echo_current_error = 1
"let g:syntastic_auto_loc_list = 2
"let g:syntastic_enable_highlighting = 1
"let g:syntastic_enable_signs = 1
"let g:syntastic_php_error_symbol = '✗'
"let g:syntastic_php_warning_symbol = '⚠'
"" :wqで実行をしない
"let g:syntastic_check_on_wq = 0
"hi SyntasticErrorSign ctermfg=160
"hi SyntasticWarningSign ctermfg=220
"" php コマンドのオプションを上書かないと動かなかった
"let g:syntastic_php_php_args = '-l'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"" vim-phpcs設定
"let Vimphpcs_Standard = 'PSR2'
"let Vimphpcs_Phpcscmd = 'php -d open_basedir= /home/y/bin/phpcs'

"
"
"
"
"インデント設定
"
"
"
"
"
"
"
"-------------------------------------------------------------------------------
" インデント Indent
"-------------------------------------------------------------------------------
set autoindent   " 自動でインデント
set paste        " ペースト時にautoindentを無効に(onにするとautocomplpop.vimが動かない)
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set cindent      " Cプログラムファイルの自動インデントを始める

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
endif

"
"
"
"
"カラー設定
"
"
"
"
"
"

" colorscheme
syntax on
colorscheme molokai
highlight Normal ctermbg=none

set syn=php

" ターミナルタイプによるカラー設定
if &term =~ "xterm-256color" || "screen-256color"
  " 256色
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

"ポップアップメニューのカラーを設定
"hi Pmenu guibg=#666666
"hi PmenuSel guibg=#8cd0d3 guifg=#666666
"hi PmenuSbar guibg=#333333

" ハイライト on
syntax enable
" 補完候補の色づけ for vim7
" hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
" hi PmenuSel ctermbg=blue ctermfg=black
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
" hi PmenuSbar ctermbg=0 ctermfg=9
" hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF

"
"
"
"
"表示サポート
"
"
"
"

set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
set list              " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex      " 印字不可能文字を16進数で表示

" 全角スペースの表示
highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
match ZenkakuSpace /　/


" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" 検索後のハイライトをEsc２回入力でハイライト解除する。
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

"
"
"
"
"検索
"
"
"
"
"
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト (2013-07-03 14:30 修正）

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

set laststatus=2
set rtp+=~/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set noshowmode

" ctag設定
" v → Ctrl + ]で垂直分割して開く
map v<C-]> :vsp <CR>:exec("tjump ".expand('<cword>'))<CR>
