set nocompatible
filetype off

" 新しくpluginを追加した後には :PlugInstall を実行
call plug#begin('~/.vim/plugged')
  " NerdTree関連
  Plug 'preservim/nerdtree'
  Plug 'airblade/vim-gitgutter'
  
  " fzf関連
  Plug 'rking/ag.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'ryanoasis/vim-devicons'
  
call plug#end()

"yank先をクリップボードに保存
set clipboard+=unnamed

"swpファイルを作らない
set noswapfile

"行数表示
set number

" vimの差分を左端に表示する
let g:gitgutter_highlight_lines = 1
let g:gitgutter_override_sign_column_highlight = 0

"カーソルライン表示
set cursorline

" Ctrl+e でツリー表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>
