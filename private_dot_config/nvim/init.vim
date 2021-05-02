""""""""""""""""
" Neovim 環境構築
""""""""""""""""

" Update:2021/04/29

""""""""""""""""
" 設定
""""""""""""""""

"文字コードを UFT-8 に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


"" 見た目系

" 行番号を表示
set number
" カーソルの縦移動とかを改善する
set relativenumber
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の 1 文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 改行時に前の行のインデントを継続する
set autoindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" ウィンドウ移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" 20 行ずつ移動
nnoremap <C-n> 20j
vnoremap <C-n> 20j
nnoremap <C-p> 20k
vnoremap <C-p> 20k
" insert モードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k
" ノーマルモード移行と保存
inoremap <silent> jj <ESC>:<C-u>w<CR>


"" オペレーション系

" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" マウスカーソルの反応
set mouse=a
" コマンドラインの履歴を 10000 件保存する
set history=10000


"" タブ系

" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab 文字を半角スペースにする
set expandtab
" 行頭以外のタブ文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのタブ文字の表示幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" tabstop に 2 文字分の空白をプラスし、タブの見た目を 4 文字分に変える
set softtabstop=2


"" 検索系

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索ワードの最初の文字を入力した時点で検索が開始される
set inccommand=split
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC 連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>



""""""""""""""""
" プラグイン管理
""""""""""""""""

if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  call dein#add('preservim/nerdtree')
  call dein#add('vim-airline/vim-airline')
  call dein#add('ap/vim-css-color')
  call dein#add('wadackel/vim-dogrun')
  call dein#add('whatyouhide/vim-gotham')
  call dein#add('neoclide/coc.nvim')

  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable



""""""""""""""""
" プラグイン設定
""""""""""""""""

" colorscheme
colorscheme dogrun
"colorscheme gotham


" lightline theme
let g:lightline = {
  \ 'colorscheme': 'dogrun',
  \ }


" vim-clap theme
let g:clap_theme = 'dogrun'


" NerdTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"


" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" Vim PostgreSQL syntax plugin
let g:sql_type_default = 'pgsql'
