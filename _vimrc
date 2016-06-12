"--------------------
"" 基本的な設定
"--------------------
""新しい行のインデントを現在行と同じにする
set autoindent
"カラースキーマを設定
colorscheme hybrid 
syntax on
let g:hybrid_original = 1
let g:rehash256 = 1
set background=dark
set nobackup

"バックアップファイルのディレクトリを指定する
"set backupdir=$HOME/vimbackup
" 
"クリップボードをWindowsと連携する
"set clipboard=unnamed
"  
"vi互換をオフする
"set nocompatible
"   
"スワップファイル用のディレクトリを指定する
"set directory=$HOME/vimbackup
"    
"タブの代わりに空白文字を指定する
"set expandtab
"     
"変更中のファイルでも、保存しないで他のファイルを表示する
"set hidden
"      
"インクリメンタルサーチを行う
"set incsearch
"       
"行番号を表示する
set number
"        
"閉括弧が入力された時、対応する括弧を強調する
"set showmatch
"         
"新しい行を作った時に高度な自動インデントを行う
set smarttab
"          
"grep検索を設定する
"set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
"set grepprg=grep\ -nh
"           
"検索結果のハイライトをEsc連打でクリアする
"nnoremap <ESC><ESC> :nohlsearch<CR>
"


"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/home/vagrant/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/vagrant/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
