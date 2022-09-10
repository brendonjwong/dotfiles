source ~/.vimrc

" Begin VimPlug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mzlogin/vim-markdown-toc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'

" Git/GitHub
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Clojure
Plug 'guns/vim-sexp', {'for': 'clojure'}

" Vim-iced and dependencies
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}
call plug#end()

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Vim-Iced Settings
" Enable vim-iced's default key mapping
let g:iced_enable_default_key_mappings = v:true
let g:iced_formatter = "cljstyle"
let g:iced_enable_clj_kondo_analysis = v:true

" vim-sexp Settings
let g:sexp_insert_after_wrap = v:false
let g:sexp_filetypes = 'clojure'
let g:sexp_mappings = { 'sexp_emit_head_element':    '(',
                      \ 'sexp_emit_tail_element':    '<',
                      \ 'sexp_capture_prev_element': ')',
                      \ 'sexp_capture_next_element': '>'}


" coc.nvim Settings
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ---------- SHORTCUTS ----------

" FZF-VIM settings
nmap <leader>F :FZF<CR>
nmap <leader>f :Rg<CR>
nmap <leader>G :GFiles<CR>
