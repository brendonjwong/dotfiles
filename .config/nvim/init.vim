source ~/.vimrc

" Begin VimPlug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ervandew/supertab'
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

" Change to the directory the file in your current buffer is in
" au BufEnter * if &buftype != "nofile" && isdirectory(expand("%:p:h"))
"     \ | lcd %:p:h | endif

" SuperTab completion for Clojure
let g:SuperTabDefaultCompletionType="context"
au FileType clojure let b:SuperTabCompletionContexts =
  \ ['ClojureContext'] + g:SuperTabCompletionContexts
function! ClojureContext()
  let curline = getline('.')
  let cnum = col('.')
  let synname = synIDattr(synID(line('.'), cnum - 1, 1), 'name')
  if curline =~ '(\S\+\%' . cnum . 'c' && synname !~ '\(String\|Comment\)'
    return "\<c-x>\<c-o>"
  endif
endfunction
