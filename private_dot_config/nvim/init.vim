""""""""""""""""
" Neovim 環境構築
""""""""""""""""

" Update:2021/04/29

""""""""""""""""
" 設定
""""""""""""""""

set fenc=utf-8              " 文字コードを UTF-8 に設定
set nobackup                " バックアップファイルを作らない
set noswapfile              " スワップファイルを作らない
set autoread                " 編集中のファイルが変更されたら自動で読み直す
set hidden                  " バッファが編集中でもその他のファイルを開けるように
set showcmd                 " 入力中のコマンドをステータスに表示する


"" 見た目系

set number                  " 行番号を表示
set relativenumber          " カーソルの縦移動とかを改善する
set cursorline              " 現在の行を強調表示
set cursorcolumn            " 現在の行を強調表示（縦）
set virtualedit=onemore     " 行末の 1 文字先までカーソルを移動できるように
set smartindent             " インデントはスマートインデント
set autoindent              " 改行時に前の行のインデントを継続する
set visualbell              " ビープ音を可視化
set showmatch               " 括弧入力時の対応する括弧を表示
set laststatus=2            " ステータスラインを常に表示
set wildmode=list:longest   " コマンドラインの補完
set background=dark         " 暗い背景色を設定
set termguicolors           " True Color（24bit color）用オプション

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
" NERDTree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-r> :NERDTreeToggle<CR>
" Coc
nnoremap <C-g> :call CocActionAsync('jumpDefinition')<CR>
" Tagbar
nmap <F8> :TagbarToggle<CR>


"" オペレーション系

set whichwrap=b,s,h,l,<,>,[,],~       " 行をまたいで移動
set mouse=a                           " マウスカーソルの反応
set history=10000                     " コマンドラインの履歴を 10000 件保存する


"" タブ系

set list listchars=tab:\▸\-           " 不可視文字を可視化（タブが「▸-」と表示される）
set expandtab                         " Tab 文字を半角スペースにする
set tabstop=2                         " 行頭以外のタブ文字の表示幅（スペースいくつ分）
set shiftwidth=2                      " 行頭でのタブ文字の表示幅
set smarttab                          " 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set softtabstop=2                     " tabstop に 2 文字分の空白をプラスし、タブの見た目を 4 文字分に変える


"" 検索系

set ignorecase                        " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase                         " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch                         " 検索文字列入力時に順次対象文字列にヒットさせる
set inccommand=split                  " 検索ワードの最初の文字を入力した時点で検索が開始される
set wrapscan                          " 検索時に最後まで行ったら最初に戻る
set hlsearch                          " 検索語をハイライト表示
nmap <Esc><Esc> :nohlsearch<CR><Esc>  " ESC 連打でハイライト解除



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

  call dein#add('tpope/vim-surround')
  call dein#add('preservim/nerdtree')
  call dein#add('tpope/vim-commentary')
  call dein#add('itchyny/lightline.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('lifepillar/pgsql.vim')
  call dein#add('ap/vim-css-color')
  call dein#add('rafi/awesome-vim-colorschemes')
  call dein#add('wadackel/vim-dogrun')
  call dein#add('whatyouhide/vim-gotham')
  call dein#add('neoclide/coc.nvim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tc50cal/vim-terminal')
  call dein#add('preservim/tagbar')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('tpope/vim-fugitive')
  call dein#add('evanleck/vim-svelte')
  call dein#add('pangloss/vim-javascript')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('cespare/vim-toml')
  call dein#add('posva/vim-vue')
  call dein#add('wavded/vim-stylus')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('kristijanhusak/defx-git')

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
"colorscheme dogrun
"colorscheme gotham256
colorscheme cyberpunk-neon


" lightline theme
let g:lightline = {
  \ 'colorscheme': 'cyberpunk-neon',
  \ }


" vim-clap theme
let g:clap_theme = 'cyberpunk-neon'


" NerdTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"


" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE


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

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"


" Vim PostgreSQL syntax plugin
let g:sql_type_default = 'pgsql'


"" deoplete.nvim（neovim 専用）

let g:deoplete#enable_at_startup = 1
