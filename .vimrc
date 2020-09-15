"""
" TODO: COC config
" maybe setup whichvim
" separate things out into multiple files because this is getting messy
"
"""


"plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'preservim/nerdtree'
Plugin 'neoclide/coc.nvim'
Plugin 'ajmwagar/vim-deus'
"Plugin 'liuchengxu/vim-which-key'       

call vundle#end()            " required
filetype plugin indent on    " required
"end plugins

"other
set nocompatible

"colour
"colorscheme desert " awesome colorscheme
syntax enable           " enable syntax processing


"tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

"encoding
set encoding=utf-8

"ui
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
"filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]


"searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"turn off highglihgting once done
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>


"folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space open/closes folds
"nnoremap <space> za
set foldmethod=syntax " set the way it folds to be syntax defined


" experimental
"
" sync with system clipboard instead
set clipboard=unnamedplus



" remap esc
inoremap jk <ESC>
" set leader key
nnoremap <SPACE> <Nop>
"let mapleader = "\<Space>" 
map <SPACE> <leader>


" move vertically by visual line
nnoremap j gj
nnoremap k gk

"--------------plugin configs--------"
"make nerdtree autoopen on empty vim 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"make nerdtree toggle on Space+F
nnoremap <Leader>f :NERDTreeToggle<Enter>
"prettify nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"


"-----------coc completion-------------
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
"coc completion, use tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
"dispaly docs in floating window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"allow coc to show in statusline
set statusline^=%{coc#status()}

let g:coc_global_extensions = [
                        \ 'coc-python',
                        \ ]
