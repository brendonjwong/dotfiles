source ~/.vimrc

" Begin VimPlug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/paredit.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" Paredit settings
let g:paredit_matchlines=500

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
