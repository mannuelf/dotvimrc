set encoding=UTF-8

syntax on
filetype on
filetype plugin on

set cmdheight=2
set colorcolumn=120
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
set guifont=Hack

call plug#begin()

Plug '907th/vim-auto-save'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'SirVer/ultisnips'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'dart-lang/dart-vim-plugin'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'editorconfig/editorconfig-vim'
Plug 'epmatsw/ag.vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'joshdick/onedark.vim'
Plug 'jparise/vim-graphql'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mileszs/ack.vim'
Plug 'mlaursen/vim-react-snippets'
Plug 'natebosch/dartlang-snippets'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'pangloss/vim-javascript' 
Plug 'pantharshit00/vim-prisma'
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'ryanoasis/vim-devicons'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'stephpy/vim-yaml'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tellijo/vim-react-native-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wakatime/vim-wakatime'

call plug#end()

let mapleader=","

" silver_searcher Ack to ag 
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Prettierpath
let g:prettier#exec_cmd_path = "~/.nvm/versions/node/v16.17.0/lib/node_modules/npm"

" Color scheme
if (has("termguicolors"))
 set termguicolors
endif

colorscheme shades_of_purple 
set background=dark
"let g:airline_theme = 'shades_of_purple'
"let g:airline_theme = 'purify'
"let g:purify_lightline = 1
let g:shades_of_purple_lightline = 1
let g:lightline = { 'colorscheme': 'shades_of_purple' }
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_nerdtree = 1

" Coc Spell checker
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

"termguicolors

" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

" Indent
set tabstop=2
set shiftwidth=2
"set expandtab  
"set smartindent

" Ultisnips
let g:UltiSnipsExpandTrigger="<shift>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
nmap <CR> :NERDTreeToggle<CR>

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

" Prettier
let g:prettier#autoformat = 1 
let g:prettier#quickfix_enabled = 0
autocmd InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.mdx,*.vue,*.yaml,*.html PrettierAsync

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
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

inoremap <silent><expr> <TAB>                                                 
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>"
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>' 

" ================================================================
" => Spell checking
" ================================================================
" always enforce spell checking in text files
autocmd BufRead,BufNewFile *.txt,*.md,COMMIT_EDITMSG setlocal spell

" toggle spell checking for current file only
map <leader>ss :setlocal spell!<cr>

" linux doesn't do this by default, so enable it just to be safe
hi SpellBad cterm=underline

" for snippets
let g:coc_snippet_next = '<c-j>' " Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>' " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
imap <C-space> <Plug>(coc-snippets-expand) " Use <C-j> for both expand and jump (make expand higher priority.)

let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-emmet',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-markdown-preview-enhanced',
      \ 'coc-pairs',
      \ 'coc-prettier',
      \ 'coc-python',
      \ 'coc-snippets',
      \ 'coc-spell-checker',
      \ 'coc-tailwindcss',
      \ 'coc-tslint-plugin',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ 'coc-flutter']

let g:lsc_auto_map = v:true

