""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ...省略

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" デフォルトでツリーを表示させる
autocmd VimEnter * execute 'NERDTree'

" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'
"
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'

" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""

" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile

" カーソルが何行目の何列目に置かれているかを表示する
set ruler

" コマンドラインに使われる画面上の行数
set cmdheight=1

" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2

" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline+=%{fugitive#statusline()}
set statusline+=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title

" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu

" 入力中のコマンドを表示する
set showcmd

" 小文字のみで検索したときに大文字小文字を無視する
set smartcase

" 検索結果をハイライト表示する
set hlsearch

" 暗い背景色に合わせた配色にする
set background=dark

" タブ入力を複数の空白入力に置き換える
set expandtab

" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch

" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden

" 不可視文字を表示する
set list

" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<

" 行番号を表示する
set number

" 対応する括弧やブレースを表示する
set showmatch

" 改行時に前の行のインデントを継続する
set autoindent

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" タブ文字の表示幅
set tabstop=2

" Vimが挿入するインデントの幅
set shiftwidth=2

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 構文毎に文字色を変化させる
syntax on

" カラースキーマの指定
let g:hybrid_reduced_contrast = 1
colorscheme hybrid

" 行番号の色
highlight LineNr ctermfg=darkyellow

" """"""""""""""""""""""""""""""
"
" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
" """"""""""""""""""""""""""""""
" " Unit.vimの設定
" """"""""""""""""""""""""""""""
" " 入力モードで開始する
let g:unite_enable_start_insert=1
" " バッファ一覧
noremap <C-P> :Unite buffer<CR>
" " ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" " 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" " sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" " ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" " ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" """"""""""""""""""""""""""""""
