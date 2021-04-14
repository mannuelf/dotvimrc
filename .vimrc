syntax on
filetype on
filetype plugin on

set cmdheight=2
set colorcolumn=80
set encoding=utf-8
set expandtab
set foldlevel=99
set foldmethod=indent
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
set signcolumn=yes
set smartcase
set tabstop=2 softtabstop=2
set termguicolors
set undodir=~/.vim/undodir
set undofile
set updatetime=500

call plug#begin()

Plug '907th/vim-auto-save'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
Plug 'editorconfig/editorconfig-vim'
Plug 'joshdick/onedark.vim'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'pangloss/vim-javascript' 
Plug 'pantharshit00/vim-prisma'
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'sbdchd/neoformat'
Plug 'stephpy/vim-yaml'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'wakatime/vim-wakatime'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tellijo/vim-react-native-snippets'
Plug 'SirVer/ultisnips'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

" Color scheme
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
"let g:shades_of_purple_airline = 1
"let g:airline_theme='shades_of_purple'

" Neoformat
autocmd BufWritePre, *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Neoformat

" Utilsnips
let g:UltiSnipsExpandTrigger="<shift>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
nmap <F12> :NERDTreeToggle<CR>

let g:NERDTreeGitStatusIndicatorMapCustom= {
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

" Gitgutter
map ]h <Plug>(GitGutterNextHunk) "same as default
nmap [h <Plug>(GitGutterPrevHunk) "same as default
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" Airline
let g:airline_powerline_fonts = 1

" Telescope - Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Autosave
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave"]
let g:auto_save_no_updatetime = 0

" Pretteir
let g:prettier#autoformat = 0 
let g:prettier#quickfix_enabled = 0
autocmd InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
"autocmd BufWritePre *.py,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Coc - Use tab for trigger completion with characters ahead and navigate.
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

inoremap <silent><expr> <c-space> coc#refresh() " Use <c-space> to trigger completion.

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
if exists('*complete_info') " position. Coc only does snippet and additional edit on confirm.
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
nmap <silent> fr <Plug>(coc-rename) " Symbol renaming.
nmap <silent> ff <Plug>(coc-format) " Formatting the file
nnoremap <silent> K :call <SID>show_documentation()<CR> " Use K to show documentation in preview window.

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent>fi <Plug>(coc-codeaction) " Remap keys for applying codeAction to the current line.
nmap <leader>qf <Plug>(coc-fix-current) " Apply AutoFix to problem on the current line.
nmap <silent>fe :<C-u>CocCommand eslint.executeAutofix<cr>
nmap <silent>fI :<C-u>CocCommand tsserver.organizeImports<cr> " Organizing Imports

" Mappings using CoCList:
nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr> " Show all diagnostics.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>  " Manage extensions.
nnoremap <silent> <space>c :<C-u>CocList commands<cr>    " Show commands.
nnoremap <silent> <space>o :<C-u>CocList outline<cr>     " Find symbol of current document.
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>  " Search workspace symbols.
nnoremap <silent> <space>j :<C-u>CocNext<CR>             " Do default action for next item.
nnoremap <silent> <space>k :<C-u>CocPrev<CR>             " Do default action for previous item.
nnoremap <silent> <space>p :<C-u>CocListResume<CR>       " Resume latest coc list.

" for snippets
let g:coc_snippet_next = '<c-j>' " Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>' " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
imap <C-space> <Plug>(coc-snippets-expand) " Use <C-j> for both expand and jump (make expand higher priority.)
let g:coc_global_extensions = ['coc-eslint', 'coc-json', 'coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-git', 'coc-highlight', 'coc-python', 'coc-yaml']
