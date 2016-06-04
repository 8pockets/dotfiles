"
"
" 基本設定
"
"
" エンコーディング
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8

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
set novisualbell                 " ビープをならさない
set browsedir=buffer             " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,>,<,],[    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効
set history=10000                " コマンド・検索パターンの履歴
set notitle                      " vimを使ってくれてありがとう
let &titleold=getcwd()           " vimを使ってくれてありがとう

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
" vim-plug - Vimプラグイン管理
" https://github.com/junegunn/vim-plug
"
"
"
call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle'] }
Plug 'Xuyuanp/nerdtree-git-plugin'

" NerdTree Icon
"Plug 'ryanoasis/vim-devicons'

Plug 'tomasr/molokai'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'

" スニペット
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" JSONプラグイン
Plug 'leshill/vim-json'

" 入力補完
Plug 'shougo/neocomplete.vim'

"Plug 'Shougo/vimproc'
"Plug 'Shougo/vimfiler'
"Plug 'bling/vim-airline'

" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'

" シンタックスチェック
"Plug 'scrooloose/syntastic'

" phpcs
"Plug 'bpearson/vim-phpcs.git'

" ステータスライン・タブライン
Plug 'itchyny/lightline.vim'

" golang  plugin
Plug 'fatih/vim-go'

call plug#end()

" filetype設定
filetype plugin indent on    " required
filetype plugin on

" vim-devicons
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

"インデントの色設定
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey

"
" NERDTree設定
"
" いつでも<C-e>で開閉
map <C-e> :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('rb', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


" Nerdtreeの表示幅
let g:NERDTreeWinSize = 30
let g:NERDTreeWinPos = "right"
"隠しファイルを表示する。
let g:NERDTreeShowHidden = 1
"引数なしで実行したとき、NERDTreeを実行する
autocmd VimEnter * NERDTree
"ファイル上にカーソルを持ってくる
autocmd VimEnter * wincmd p
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTreeでファイルを開くとNerdtreeを閉じる
"let g:NERDTreeQuitOnOpen = 1
" Nerdtreeでファイルを削除したらデフォルトでバッファも削除
let g:NERDTreeAutoDeleteBuffer=1
"ブックマークや、ヘルプのショートカットをメニューに表示する。
"0 表示する
"1 表示しない
"Values: 0 or 1.
"Default: 1.
let g:NERDTreeMinimalUI=0

"マウス操作方法
"NERDTreeMouseMode
"Values: 1, 2 or 3.
"Default: 1.
"1 : ファイル、ディレクトリ両方共ダブルクリックで開く。
"2 : ディレクトリのみシングルクリックで開く。
"3 : ファイル、ディレクトリ両方共シングルクリックで開く。
"let g:NERDTreeMouseMode=1
let g:NERDTreeMouseMode=2
"let g:NERDTreeMouseMode=3

"NERDTreeを+|`などを使ってツリー表示をする。
"ディレクトリが閉じている場合には+を先頭につける。
"ディレクトリが開いている場合には~を先頭につける。
"ファイルには-を先頭につける。
"0 : 綺麗に見せる。
"1 : +|`などを使わない
"Values: 0 or 1
"Default: 1.
"let g:NERDTreeDirArrows=0
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'

"ブックマークリストの表示。
"0 : ブックマークリストを最初から表示しない。
"1 : ブックマークリストを最初から表示する。
"Values: 0 or 1.
"Default: 0.
"let g:NERDTreeShowBookmarks=0
let g:NERDTreeShowBookmarks=1

"NERDTreeIgnore 無視するファイルを設定する。
"'\.vim$'ならばfugitive.vimなどのファイル名が表示されない。
"\ エスケープ記号
"$ ファイル名の最後
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
"let g:NERDTreeIgnore=['\.vim$', '\.clean$']
"let g:NERDTreeIgnore=['\.vim$', '\~$']
"let g:NERDTreeIgnore=[]

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" vim-go plugin Setting
" https://github.com/fatih/vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1


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
set autoindent   " 自動でインデント
set paste        " ペースト時にautoindentを無効に(onにするとautocomplpop.vimが動かない)
set cindent      " Cプログラムファイルの自動インデントを始める
set expandtab    " タブ入力を複数の空白入力に置き換え
set smarttab     " 行頭の余白内で Tab を打ち込むとshiftwidthの数だけインデントする
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。

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
set title
set undolevels=300    " タイトルをウィンドウ枠に表示
set showmatch         " 括弧の対応をハイライト
set number            " 行番号表示
set list              " 不可視文字表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:% "不可視文字の表示形式
set display=uhex      " 印字不可能文字を16進数で表示
set ruler             " 右下に表示される行・列の番号を表示する

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
set infercase           " 補完の際の大文字小文字の区別しない
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト (2013-07-03 14:30 修正）

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" 検索後のハイライトをEsc２回入力でハイライト解除する。
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

set laststatus=2
"set rtp+=~/powerline/powerline/bindings/vim
"let g:Powerline_symbols = 'fancy'
set noshowmode

" itchyny/lightline.vim設定
" https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" ctag設定
" v → Ctrl + ]で垂直分割して開く
map v<C-]> :vsp <CR>:exec("tjump ".expand('<cword>'))<CR>

