source ~/.vimrc

" Begin VimPlug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ervandew/supertab'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/paredit.vim'

" Git/GitHub
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" FZF
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Vim-iced and dependency
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}
call plug#end()

" Paredit settings
let g:paredit_matchlines=500

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Vim-Iced Settings
" Enable vim-iced's default key mapping
let g:iced_enable_default_key_mappings = v:true
let g:iced_formatter = "cljstyle"

" ---------- SHORTCUTS ----------

" FZF-VIM settings
nmap <leader>F :FZF<CR>
nmap <leader>f :Rg<CR>
