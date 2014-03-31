set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Keep as documentation
"" The following are examples of different formats supported.
"" Keep bundle commands between here and filetype plugin indent on.
"" scripts on GitHub repos
"Bundle 'tpope/vim-fugitive'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"
"" scripts not on GitHub
"Bundle 'git://git.wincent.com/command-t.git'

Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'othree/html5.vim'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'Yggdroot/indentLine'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/tComment'
Bundle 'https://github.com/majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'bingaman/vim-sparkup'
Bundle 'plasticboy/vim-markdown'
Bundle 'evanmiller/nginx-vim-syntax'
Bundle "pangloss/vim-javascript"
Bundle "terryma/vim-multiple-cursors"
Bundle 'bling/vim-airline'

filetype plugin indent on     " required
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

"For pathogen"
    execute pathogen#infect()

"Leader"
    let mapleader=","

"Indent"
    "Indentation toutes les quatre colonnes"
    set tabstop=4
    "Conversion des tabulations en espaces"
    set expandtab
    "Indentation de quatre colonnes "
    set shiftwidth=4
    "Indentation intelligents "
    set smartindent
    " Conserve l'indentation courante sur les nouvelles lignes "
    set autoindent
    "retours arriere intelligents "
    set backspace=indent,eol,start
    "Indentation a la marque de Tab la plus proche "
    set shiftround

"Colors"
    set background=dark
    colorscheme solarized
    let g:solarized_termcolors=256

    if has('gui_running')
        set background=light
    else
        set background=dark
    endif

    highlight LineNr ctermfg=grey ctermbg=black
    syntax enable
    syntax sync fromstart
    set hlsearch

"Completion"
    "To turn on omnicompletion"
    filetype plugin on
    set ofu=syntaxcomplete#Complete
    "Suggest command"
    set wildmode=longest,full
    set wildmenu
    "Html
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    "Css
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    "Javascript
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    "Php
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"Tags"
    set tags=~/.tags;
    "open in page"
    "<C-]>"
    "open in vsplit"
    map <C-@> :vsplit<CR>:exec("tag ".expand("<cword>"))<CR>
    "open in tab"
    map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
    "open in split"
    map <C-^> :split<CR>:exec("tag ".expand("<cword>"))<CR>

"Other"
    "Affiche les numeros de lignes"
    set number
    "Ignore la casse lors de recherche"
    set ignorecase
    "Modifie la casse"
    set smartcase
    "affiche le mode d'edition"
    set showmode
    "affiche la position du curseur"
    set ruler
    " affiche les commandes incompletes"
    set showcmd
    "Si vim ne se souvient pas de la position precedente du curseur"
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    "support de la souris"
    set mouse=a
    set ttymouse=xterm2
    "80 characters"
    highlight ColorColumn ctermbg=235 guibg=#262626
    if exists('&colorcolumn')
        let &colorcolumn=join(range(81,999),",")
        let &colorcolumn="80,".join(range(120,999),",")
    endif

"Split"
    set splitbelow
    set splitright

"Show hidden character, show space as dot and tab as 't.'"
    set list
    set lcs=tab:t.
    set lcs+=trail:.
    map <c-l> :set list!<CR>

"Folding"
    let javaScript_fold=1       "Javascript
    let php_folding=1           "PHP
    let r_syntax_foldin=1       "R
    let sh_fold_enabled=1       "sh
    let vimsyn_folding='af'     "Vim script
    let xml_syntax_folding=1    "XML
    set foldmethod=manual
    set foldnestmax=1
    vmap <Space> zf<enter>

"Gvim"
    :set guioptions-=m  "remove menu bar
    :set guioptions-=T  "remove toolbar
    :set guioptions-=r  "remove right-hand scroll bar
    :set guioptions-=L  "remove left-hand scroll bar

"Indentline"
    let g:indentLine_color_term = 0

"CtrlP"
    let g:ctrlp_show_hidden = 1
    nnoremap <leader>p :CtrlPTag<cr>

"NERDTree
    silent! nmap <Leader>e :NERDTreeTabsToggle<CR>
    let g:NERDTreeDirArrows=0

"Sparkup"
    let g:sparkupExecuteMapping = '<c-e>'
    "Find a better settings, aspecially in php files
    let g:sparkupMappingInsertModeOnly = 1

"Syntastic"
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=0

"Statline"
    let g:statline_filename_relative = 1

"Fugitive"
    let g:statline_fugitive = 1

"NeoComplCache"
"Disable AutoComplPop."
    let g:acp_enableAtStartup = 0
"Use neocomplcache."
    let g:neocomplcache_enable_at_startup = 1

"Tagbar"
    nnoremap <silent> <Leader>t :TagbarToggle<CR>

"Airline"
    set laststatus=2
    let g:airline#extensions#tabline#enabled = 1

"Snippet"
    au BufRead *.php set ft=php.html
    au BufNewFile *.php set ft=php.html

"Specific local config"
    if filereadable(glob("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
