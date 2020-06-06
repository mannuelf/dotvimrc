set encoding=utf-8
set nocompatible
set foldmethod=indent
set foldlevel=99
set scrolloff=10
set omnifunc=syntaxcomplete#Complete
set number
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80

function! MarkdownComposer(info)
  if a:info.status == 'installed' || a:info.forced
    if has('nvim')
      silent! !cargo build --release
    else
      silent! !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.vim/bundle')
call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

Plug 'euclio/vim-markdown-composer', {'do': function('MarkdownComposer'), 'on': 'MarkdownPreview'}
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
" Update closetag to also work on js and html files, don't want ts since <> is used for type args
let g:closetag_filenames='*.html,*.js,*.jsx,*.tsx'
let g:closetag_regions = {
    \ 'typescript': 'jsxRegion,tsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

Plug 'joshdick/onedark.vim'
Plug 'moll/vim-node'
Plug 'epmatsw/ag.vim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'mbbill/undotree'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'epilande/vim-es2015-snippets'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

let g:coc_global_extensions=[
      \ 'coc-css',
      \ 'coc-scssmodules',
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-yaml'
      \ ]

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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" quickly jump between diagnostics
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <silent> fr <Plug>(coc-rename)

" Formatting the file
nmap <silent> ff <Plug>(coc-format)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap keys for applying codeAction to the current line.
nmap <silent>fi <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
nmap <silent>fe :<C-u>CocCommand eslint.executeAutofix<cr>
" Organizing Imports
nmap <silent>fI :<C-u>CocCommand tsserver.organizeImports<cr>

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p :<C-u>CocListResume<CR>

" for snippets
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-space> <Plug>(coc-snippets-expand)
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-git', 'coc-highlight', 'coc-python']

Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
Plug 'jcherven/jummidark.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'wadackel/vim-dogrun'
Plug 'junegunn/vim-plug'

call plug#end()            " required

" ================================================================
" vim-markdown-composer
" ================================================================
" only start markdown previewer after :ComposerStart
let g:markdown_composer_autostart=0
let g:markdown_composer_refresh_rate=10000
let g:markdown_composer_external_renderer='pandoc -f gfm -t html'

function! MarkdownPreview()
  if !exists('*ComposerStart')
    " if vim-markdown-composer hasn't been added yet, add it and reload
    " the file before calling ComposerStart. Not sure why reloading the
    " file is required, but breaks if it isn't
    packadd vim-markdown-composer
    edit %
  endif

  ComposerStart
endfunction

command! MarkdownPreview call MarkdownPreview()
autocmd FileType markdown nnoremap <buffer> <F12> :MarkdownPreview<cr>

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
