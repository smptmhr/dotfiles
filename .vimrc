set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
    "insert here your Neobundle plugins"
    NeoBundle 'scrooloose/nerdtree'
		NeoBundle 'airblade/vim-gitgutter'
    call neobundle#end()
endif

"tsxファイルを開いたときに
"`'redrawtime' exceeded, syntax highlighting disabled` エラーを出さないようにする
"https://qiita.com/kazuyaseo/items/4a5a41ef0cb824bc94fd
set re=0

"https://phantom37383.blog.fc2.com/blog-entry-1588.html
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

filetype plugin indent on

"yank先をクリップボードに保存
set clipboard+=unnamed

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeWinSize=26

"swpファイルを作らない
set noswapfile

"行数表示
set number

" vimの差分を左端に表示する
let g:gitgutter_highlight_lines = 1
let g:gitgutter_override_sign_column_highlight = 0

" gitgutterのハイライトを無効にする
let g:gitgutter_override_sign_column_highlight = 0
highlight GitGutterAdd    guibg=NONE ctermbg=NONE
highlight GitGutterChange guibg=NONE ctermbg=NONE
highlight GitGutterDelete guibg=NONE ctermbg=NONE
highlight GitGutterChangeDelete guibg=NONE ctermbg=NONE

" 0.1秒間隔で更新
set updatetime=100

"カーソルライン表示
set cursorline

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
