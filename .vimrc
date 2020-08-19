
"colour
colorscheme desert " awesome colorscheme
syntax enable           " enable syntax processing


"tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces


"ui
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
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
nnoremap <space> za
set foldmethod=syntax " set the way it folds to be syntax defined


" move vertically by visual line
nnoremap j gj
nnoremap k gk


