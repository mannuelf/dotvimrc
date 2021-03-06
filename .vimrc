syntax on
filetype on
filetype plugin on
filetype indent on

set cmdheight=2
set colorcolumn=80
set encoding=utf-8
set expandtab
set foldlevel=99
set foldmethod=indent
set guicursor=
set hidden
set incsearch
set laststatus=1
set nobackup
set nocompatible
set noerrorbells
set nohlsearch
set noshowmatch
set noswapfile
set number
set omnifunc=syntaxcomplete#Complete
set relativenumber
set scrolloff=10
set scrolloff=8
set shortmess+=c
set smartcase
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set tabstop=2 softtabstop=2
set termguicolors
set undodir=~/.vim/undodir
set undofile
set updatetime=300

call plug#begin('~/.vim/bundle')
call plug#begin()

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug '907th/vim-auto-save'
Plug 'editorconfig/editorconfig-vim'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/vim-plug'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mbbill/undotree'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
Plug 'moll/vim-node'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'Rigellute/shades-of-purple.vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'Galooshi/vim-import-js'
Plug 'wakatime/vim-wakatime'

call plug#end()

" ⚙️  VIM Autosave
let g:auto_save = 0
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_no_updatetime=1

" ⚙️  NERDTree
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable='⇒'
let g:NERDTreeDirArrowCollapsible='⇓'
"let g:NERDTreeQuitOnOpen=1
nmap <F12> :NERDTreeToggle<CR>
" git indicators
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ⚙️  Pretteir
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" ⚙️  Coc
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
let g:coc_global_extensions = ['coc-eslint', 'coc-json', 'coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-git', 'coc-highlight', 'coc-python', 'coc-yaml']

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" ⚙️  Util Snips settings
let g:UltiSnipsExpandTrigger='<C-l>'

" ⚙️  Color Scheme settings
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

" ⚙️  Editor config settings
au BufNewFile, BufRead *.php,*.py,*.html,*.js,*.ts,*.tsx,*.jsx,*.md,*.vue,*.css,*.scss
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
    \ set shiftwidth=2
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" ⚙️  flag white space
au BufRead, BufNewFile *.ts,*.js,*.tsx,*.tsx,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" ⚙️  VIM TypeScript
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.ts,*.tsx,*.jsx set filetype=typescript.tsx
" VIM TypeScipt Colours
hi tsxTypeBraces guifg=#999999
hi tsxTypes guifg=#666666
hi tsxTagName guifg=#E06C75
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
hi tsxAttrib guifg=#F8BD7F cterm=italic
hi ReactState guifg=#EF476F
hi ReactProps guifg=#EF476F
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

" ⚙️  Kite
let g:kite_auto_complete=1
let g:kite_snippets=1
"let g:kite_log=0
let g:kite_tab_complete=1
let g:kite_supported_languages = ['css', 'html', 'python', 'javascript', 'go']
let g:kite_previous_placeholder = '<C-H>'
let g:kite_next_placeholder = '<C-L>'
autocmd CompleteDone * if !pumvisible() | pclose | endif

if executable('rg')
    let g:rg_derive_root='true'
endif

" ⚙️  Ctrl-P 
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard', './node_modules']
