set nocompatible              " Be iMproved, required
filetype plugin on
runtime macros/matchit.vim

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" Scripts on GitHub repos
" Bundle 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"
" Scripts not on GitHub
" Bundle 'git://git.wincent.com/command-t.git'

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
Bundle 'pangloss/vim-javascript'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'bling/vim-airline'
Bundle 'kien/tabman.vim'
Bundle 'sjl/gundo.vim'
Bundle 'godlygeek/tabular'
Bundle 'benmills/vimux'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" See :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

" Leader
    let mapleader=","
    noremap \ ,

" Indent
    "Conversion des tabulations en espaces
    set expandtab
    "Indentation toutes les n colonnes en fonction du type de fichier
    "legend:
    "ts  tabstop
    "sts softtabstop
    "sw  shiftwidth
    set ts=4 sts=4 sw=4 "settings by default
    if has("autocmd")
        " Todo: make group auto
        autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
        autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
        autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
        autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
        autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
    endif
    "Indentation intelligents
    set smartindent
    " Conserve l'indentation courante sur les nouvelles lignes
    set autoindent
    "retours arriere intelligents
    set backspace=indent,eol,start
    "Indentation a la marque de Tab la plus proche
    set shiftround

" Colors
    " Cannot use togglebg with this option,
    " Use solarized colors in terminal and toggle is ok
    " Or use this option but togglebg will not working properly
    " let g:solarized_termcolors=256

    colorscheme solarized

    if has('gui_running')
        set background=light
    else
        set background=dark
    endif
    call togglebg#map("<c-b>")

    highlight LineNr ctermfg=grey ctermbg=black
    syntax enable
    syntax sync fromstart

" Search
    "Hightlight all result
    set hlsearch
    set incsearch
    nmap <leader>p :cprev<cr>
    nmap <leader>P :cfirst<cr>
    nmap <leader>n :cnext<cr>
    nmap <leader>N :clast<cr>

" Completion
    "To turn on omnicompletion
    filetype plugin on

    "Auto complete for all langages
    set omnifunc=syntaxcomplete#Complete

    "Source of completion, Todo: to verify
    set complete=.,b,u,]

    "Doesn't select the first completion item, but rather
    "just inserts the longest common text of all matches; and the menu will
    "come up even if there's only one match. (The longest setting is
    "responsible for the former effect and the menuone is responsible for the
    "latter.)
    set completeopt=longest,menuone

" Navigation
    "…

" Bubbling text
    "Note: not perfect when move to the first line
    vmap <C-k> xkP`[v`]
    vmap <C-j> xp`[v`]
    vmap <C-h> xbP`[v`]
    vmap <C-l> xep`[v`]

" Split
    set splitbelow
    set splitright

" Tab
    "…

" Path
    "Todo: find dynamically root of repo and
    "define the path dynamically and recursively
    "set path+=repo/**

" Tags
    "Todo: find dynamically root of repo and source the tag here
    set tags=~/.tags;
    "open in page
    map <F1> :exec("tag ".expand("<cword>"))<CR>
    "open in vsplit
    map <F2> :vsplit<CR>:exec("tag ".expand("<cword>"))<CR>
    "open in split
    map <F3> :split<CR>:exec("tag ".expand("<cword>"))<CR>
    "open in tab
    map <F4> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
    "Generate tags of the first repo upper find
    "Todo: close it when finish
    map <F6> :VimuxRunCommand("generateTags.sh $(findRepo.sh)")<CR>

" Show hidden character, show space as dot and tab as 't.'
    highlight NonText ctermfg=238
    highlight SpecialKey ctermfg=238
    " Use the same symbols as TextMate for tabstops and EOLs
    set listchars=tab:t.
    set listchars+=trail:.
    set listchars+=eol:f
    nmap <c-l> :set list!<CR>

" Folding
    set foldcolumn=3
    set foldmethod=marker
    let javaScript_fold=1       "Javascript
    let php_folding=1           "PHP
    let r_syntax_foldin=1       "R ???
    let sh_fold_enabled=1       "sh
    let vimsyn_folding='af'     "Vim script
    let xml_syntax_folding=1    "XML
    set foldmethod=manual
    set foldnestmax=1
    vmap <Space> zf<enter>

" Gvim
    :set guioptions-=m  "remove menu bar
    :set guioptions-=T  "remove toolbar
    :set guioptions-=r  "remove right-hand scroll bar
    :set guioptions-=L  "remove left-hand scroll bar

" Indentline
    let g:indentLine_color_term = 0

" CtrlP
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_max_files = 0
    nnoremap <space>p :CtrlPTag<cr>

" NERDTree
    silent! nmap <Leader>e :NERDTreeTabsToggle<CR>
    let g:NERDTreeDirArrows=0

" Sparkup
    let g:sparkupExecuteMapping = '<c-e>'
    "Todo: Find a better settings, aspecially in php files
    let g:sparkupMappingInsertModeOnly = 1

" Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=0

" Statline
    let g:statline_filename_relative = 1

" Fugitive
    let g:statline_fugitive = 1

" NeoComplCache
    "Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    "Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    "Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3

" Tagbar
    nnoremap <silent> <Leader>t :TagbarToggle<CR>
    let g:tagbar_sort = 0

" Airline
    set laststatus=2
    let g:airline#extensions#tabline#enabled = 1

" Html5
    let g:html5_rdfa_attributes_complete = 0
    let g:html5_microdata_attributes_complete = 0
    let g:html5_aria_attributes_complete = 0

" Gundo
    map <Leader>z :GundoToggle<CR>

" Snippet
" Todo: move this with tabulation
    au BufRead *.php set ft=php.html
    au BufNewFile *.php set ft=php.html

" Specific local config
    if filereadable(glob("~/.vimrc.local"))
        source ~/.vimrc.local
    endif

" Bépo
    if !empty(system("setxkbmap -print|grep bepo"))
        source ~/.vim/.vimrc.bepo
    endif
    map <F7> :source ~/.vim/.vimrc.bepo<CR>

" Cursor
    " Default Colors for CursorLine
    highlight  CursorLine ctermbg=black ctermfg=none
    highlight  CursorColumn ctermbg=black ctermfg=none
    " Todo: make auto group
    " Change Color when entering Insert Mode
    autocmd InsertEnter * highlight  CursorLine ctermbg=234 ctermfg=none
    " Revert Color to default when leaving Insert Mode
    autocmd InsertLeave * highlight  CursorLine ctermbg=black ctermfg=none
    set cursorline
    set cursorcolumn
    set cursorbind

" Other
    "Command line
    set wildmode=longest,list
    set wildmenu
    "Linebreak
    set wrap linebreak nolist
    "Affiche les numeros de lignes
    set number
    "Ignore la casse lors de recherche
    set ignorecase

    " Si dans le motif il n'y a pas de majuscules,
    " alors la recheche sera en casse insensible
    set smartcase

    "affiche le mode d'edition
    set showmode
    "affiche la position du curseur
    set ruler
    " Affiche les commandes incompletes
    set showcmd
    "Si vim ne se souvient pas de la position precedente du curseur
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    "support de la souris
    set mouse=a
    set ttymouse=xterm2
    "80 characters
    highlight ColorColumn ctermbg=235 guibg=#262626
    if exists('&colorcolumn')
        let &colorcolumn=join(range(81,999),",")
        let &colorcolumn="80,".join(range(120,999),",")
    endif

    " Lang and corrector
    set spelllang=en,fr
    set spell

    " Source vimrc après l'avoir sauvegarder
    " Todo: Trouver une solution pour que airline reste correct après rafraichissement
    " if has("autocmd")
    "   autocmd bufwritepost .vimrc source $MYVIMRC
    " endif

    map <F5> :e!<CR>
    " Set no octal increment number but decimal
    set nrformats=
    " For trainning
    noremap <Up> <Nop>
    noremap <Down> <Nop>
    noremap <Left> <Nop>
    noremap <Right> <Nop>
    set nrformats=
