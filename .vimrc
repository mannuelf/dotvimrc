set encoding=utf-8
set nocompatible              " be iMproved, required
set foldmethod=indent
set foldlevel=99
set scrolloff=10
set omnifunc=syntaxcomplete#Complete
set number
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
"set smartindent
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80

call plug#begin('~/.vim/bundle')
call plug#begin()

Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
"Plug 'L9'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug '907th/vim-auto-save'
let g:auto_save = 0
let g:auto_save_events = ["InsertLeave", "TextChanged"]

Plug 'psliwka/vim-smoothie'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable='⇒'
let g:NERDTreeDirArrowCollapsible='⇓'
"let g:NERDTreeQuitOnOpen=1
nmap <F12> :NERDTreeToggle<CR>

Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'dracula/dracula-theme'
Plug 'wakatime/vim-wakatime'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
Plug 'editorconfig/editorconfig-vim'
Plug 'tmhedberg/SimpylFold'
Plug 'mlaursen/vim-react-snippets'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
let g:closetag_filenames = "*.html"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.tsx,*.ts'
let g:closetag_filetypes = 'html,xhtml,phtml,.ts,.js,.tsx,jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js,tsx'
let g:closetag_shortcut = '>'

Plug 'joshdick/onedark.vim'
Plug 'moll/vim-node'
Plug 'epmatsw/ag.vim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'mbbill/undotree'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'epilande/vim-es2015-snippets'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-git', 'coc-highlight', 'coc-python']
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
Plug 'jcherven/jummidark.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'wadackel/vim-dogrun'
Plug 'junegunn/vim-plug'

call plug#end()            " required

let g:UltiSnipsExpandTrigger='<C-l>'

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
syntax on 
" colorscheme dracula
" colorscheme onedark
" colorscheme dogrun 
colorscheme shades_of_purple
let g:shades_of_purple_airline = 1
let g:airline_theme='shades_of_purple'

" Shades of purple settings
if (has("termguicolors"))
  set termguicolors
endif

" Python settings
let g:pymode_python='python3' 
if has('python3')
endif	

" Enable folding with the spacebar
nnoremap <space> za

" Pro Tip #5: Try this if you want to see the docstrings for folded code:
let g:SimpylFold_docstring_preview=1

" editor config
au BufNewFile, BufRead *.php,*.rb,*.html,*.js,*.ts,*.md,*.vue,*.jsx,*.tsx
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" flag white space
au BufRead, BufNewFile *.ts,*.js,*.tsx,*.tsx,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Kite
"let g:kite_auto_complete=0
"let g:kite_snippets=0
"set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
"set laststatus=1

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard', './node_modules']
