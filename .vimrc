set nocompatible              " Be iMproved, required
set encoding=utf-8
filetype plugin indent on
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

" Syntax
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'plasticboy/vim-markdown'
Bundle 'bingaman/vim-sparkup'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-endwise'
Bundle 'vim-scripts/tComment'
Bundle 'tpope/vim-surround'
Bundle 'Townk/vim-autoclose'
Bundle 'vim-ruby/vim-ruby'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'fatih/vim-go'
Bundle 'Prosumma/vim-pgsql'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'tclh123/vim-thrift'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'Shougo/neocomplcache'

" Browse
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/ShowMarks'
Bundle 'tpope/vim-unimpaired'
Bundle 'nelstrom/vim-visual-star-search'

" Display
Bundle 'tomasr/molokai'
Bundle 'bling/vim-airline'
Bundle 'Yggdroot/indentLine'
" Must be loaded after some other plugins
" like: NERDTree, vim-airline, nerdtree-git-plugin
Bundle 'ryanoasis/vim-devicons'

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'Xuyuanp/nerdtree-git-plugin'

" Other
Bundle 'https://github.com/majutsushi/tagbar'
Bundle 'tpope/vim-repeat'
Bundle 'tommcdo/vim-exchange'
Bundle 'vim-utils/vim-man'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" See :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

" Functions
    function ToggleDisplay()
        "Cursor line and column
        :set cursorline!
        :set cursorcolumn!

        "GitGutter
        :GitGutterToggle

        "Hidded characters
        :set list!

        "Hidded search highlighted
        set hlsearch!
    endfunction

    let g:quickfix_is_open = 0

    function QuickfixToggle()
        if g:quickfix_is_open
            cclose
            let g:quickfix_is_open = 0
        else
            copen
            let g:quickfix_is_open = 1
        endif
    endfunction

" Leader
    let mapleader=","
    noremap \ ,

" Indent
    " Conversion des tabulations en espaces
    set expandtab
    " Indentation toutes les n colonnes en fonction du type de fichier
    " Legend:
    " ts  tabstop
    " sts softtabstop
    " sw  shiftwidth

    " Settings by default
    set ts=4 sts=4 sw=4
    if has("autocmd")
        " Todo: make group auto
        autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
        autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
        autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
        autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
        autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
        autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
    endif
    " Indentation intelligente
    set smartindent
    " Conserve l'indentation courante sur les nouvelles lignes
    set autoindent
    " Retours arrière intelligents
    set backspace=indent,eol,start
    " Indentation à la marque de Tab la plus proche
    set shiftround

" Colors
    if filereadable(expand("$HOME/.vim/bundle/molokai/colors/molokai.vim"))
        colorscheme molokai
        let g:molokai_original = 1
        let g:rehash256 = 1
    endif

    " Colors of numbers
    highlight LineNr cterm=bold ctermfg=grey ctermbg=black

    " Synchronization of syntax
    syntax enable
    syntax sync fromstart

    " Colors of signs and fold column
    highlight foldcolumn ctermbg=236 ctermfg=darkgrey

    " Colors of tab
    " General colors tab
    highlight TabLine ctermbg=240 ctermfg=grey
    " Active tab
    highlight TabLineSel cterm=bold ctermbg=236 ctermfg=202
    " Tab bar
    highlight TabLineFill ctermfg=240

    " Marks colors
    highlight ShowMarksHLla ctermbg=236 ctermfg=darkgrey

" Search
    " Highlight all results
    set hlsearch
    " Preview the search results
    set incsearch
    nmap <Leader>p :cprev<cr>
    nmap <Leader>P :cfirst<cr>
    nmap <Leader>n :cnext<cr>
    nmap <Leader>N :clast<cr>

" Completion
    " Auto complete for all langages
    set omnifunc=syntaxcomplete#Complete

    " Source of completion, legend:
    " . current buffer
    " w buffer in other window
    " b other buffer loaded
    " u unloaded buffer
    " t tag
    " i included file
    " k ?
    set complete=.,w,b,u,t,i,k

    " Doesn't select the first completion item, but rather
    " just inserts the longest common text of all matches; and the menu will
    " come up even if there's only one match. (The longest setting is
    " responsible for the former effect and the menuone is responsible for the
    " latter.)
    set completeopt=longest,menuone

" Navigation
    "…

" Bubbling text
    " Note: not perfect when move to the first line
    vmap <C-k> xkP`[v`]
    vmap <C-j> xp`[v`]
    vmap <C-h> xbP`[v`]
    vmap <C-l> xep`[v`]

" Split
    set splitbelow
    set splitright

" Path
    " Todo: find dynamically root of repo and
    " define the path dynamically and recursively
    " set path+=repo/**
    set path+=.

" Tags
    let myPath = join([substitute(system("findRepo.sh"), '\n', '', ''), '.git', '.tags' ], '/')
    let &tags=myPath
    " Open in page
    " be sure F1 not opening help, and back to normal mode
    imap <F1> <Esc>
    map <F1> :exec("tag ".expand("<cword>"))<CR>
    " Open in vsplit
    map <F2> :vsplit<CR>:exec("tag ".expand("<cword>"))<CR>
    " Open in split
    map <F3> :split<CR>:exec("tag ".expand("<cword>"))<CR>
    " Open in tab
    map <F4> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Show hidden characters
    highlight NonText ctermfg=238
    highlight SpecialKey ctermfg=238
    " Use the same symbols as TextMate for tabstops and EOLs
    set listchars=tab:▸\.
    set listchars+=trail:.
    set listchars+=eol:¬
    set list
    nmap <c-l> :set list!<CR>

" Folding
    set foldcolumn=3
    set foldmethod=marker
    let javaScript_fold=1       "JavaScript
    " For now disable folding on php because vim is very slow on large file
    " let php_folding=1           "PHP
    let sh_fold_enabled=1       "sh
    let vimsyn_folding='af'     "Vim script
    let xml_syntax_folding=1    "XML
    set foldmethod=manual
    set foldnestmax=1
    vmap <Space> zf<enter>

" Gvim
    :set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Book\ 10
    :set guioptions-=m  "remove menu bar
    :set guioptions-=T  "remove tool bar
    :set guioptions-=r  "remove right-hand scroll bar
    :set guioptions-=L  "remove left-hand scroll bar

" Indentline
    let g:indentLine_color_term = 59
    let g:indentLine_char = "┆"

" CtrlP
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_max_files = 0
    let g:ctrlp_custom_ignore = {
        \ 'dir' : '\v\.(sass-cache|git)',
        \ 'file': '\v\.(exe|so|dll|tags|sw*)$'
        \ }
    nnoremap <space>p :CtrlPTag<cr>

" NERDTree
    let NERDTreeShowHidden=1
    let NERDTreeIgnore=['.*.sw.*$', '.git']
    autocmd FileType nerdtree setlocal nolist
    autocmd FileType nerdtree setlocal nocursorline
    autocmd FileType nerdtree setlocal nocursorcolumn

    silent! nmap <Leader>e :NERDTreeTabsToggle<CR>
    highlight Directory cterm=bold ctermfg=darkgrey gui=bold guifg=darkgrey

" Sparkup
    let g:sparkupExecuteMapping = '<c-e>'
    " Todo: Find a better settings, especially in php files
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

" Tagbar
    nnoremap <silent> <Leader>t :TagbarToggle<CR>
    let g:tagbar_sort = 0

" Airline
    " Always show statusline
    set laststatus=2
    let g:airline_theme='simple'
    let g:airline_powerline_fonts = 1

" Html5
    let g:html5_rdfa_attributes_complete = 0
    let g:html5_microdata_attributes_complete = 0
    let g:html5_aria_attributes_complete = 0

" phpcomplete
    let g:phpcomplete_parse_docblock_comments = 1

" Snippet
    " Todo: move this with tabulation
    au BufNewFile,BufRead *.php setf php.html
    au BufNewFile,BufRead *.scss setf css
    au BufNewFile,BufRead *.pgsql setf pgsql
                                                    "No way to use setf
                                                    "instead set ft=
    au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
    au BufNewFile,BufRead *.thrift setf thrift

" Specific local config
    if filereadable(glob("~/.vimrc.local"))
        source ~/.vimrc.local
    endif

" Bépo
    source ~/.vim/.vimrc.bepo

" Cursor
    set cursorline
    set cursorcolumn

" Nerdtree-git-plugin
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified" : "⚡",
        \ "Staged"   : "+",
        \ "Untracked": "✭",
        \ "Renamed"  : "➜",
        \ "Unmerged" : "=",
        \ "Deleted"  : "✖",
        \ "Dirty"    : "✗",
        \ "Clean"    : "✔︎",
        \ "Unknown"  : "?"
    \}

" Airblade
    highlight clear SignColumn
    let g:gitgutter_sign_added = '+'
    let g:gitgutter_sign_modified = '⚡'
    let g:gitgutter_sign_removed = '✗'
    let g:gitgutter_sign_removed_first_line = '✗1'
    let g:gitgutter_sign_modified_removed = '✗⚡'

    " Update signs
    " Event: Stop typing
    let g:gitgutter_realtime = 1
    " Event: Switch buffer & Switch tab
    let g:gitgutter_eager = 1

    " Highlight line modified
    map <Leader>l :GitGutterLineHighlightsToggle<CR>

" neocomplcache
    " Disable AutoComplPop
    let g:acp_enableAtStartup = 0

    " Use neocomplcache
    let g:neocomplcache_enable_at_startup = 1

    " Use smartcase
    let g:neocomplcache_enable_smart_case = 1

    " Set minimum syntax keyword length
    let g:neocomplcache_min_syncax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" EasyMotion
    let g:EasyMotion_smartcase = 1
    map  <Leader>/ <Plug>(easymotion-sn)
    omap <Leader>/ <Plug>(easymotion-tn)

" AutoCloseTag
    au FileType xhtml, xml ~/.vim/ftplugin/html_autoclosetag.vim

" ShowMarks
    " Disable by default
    let showmarks_enable = 0
    " Include only my markers
    let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" Devicons
    " Need to install font patched
    " https://github.com/ryanoasis/nerd-fonts
    " Todo: do something for ctrlp not showing glyph

" Neovim
    " Terminal
    if exists(':tnoremap')
        " Map for escaping from terminal inside neovim
        :tnoremap <Esc> <C-\><C-n>
        nmap ts :sp term://zsh<CR>i
        nmap tv :vsp term://zsh<CR>i
        nmap tt :tabe term://zsh<CR>i
    endif

" Other
    " Command line completion
    " ex
    "   =full         -> complete with the first match, tab to change suggestion
    "   =longest:full -> no completion, tab no effect, ctrl-p and ctrl-n to change suggestion
    "   =list:full    -> complete with the first match, tab and ctrl-p and ctrl-n to change suggestion *
    "   =list,full    -> not complete the first time tab, tab again or ctrl-p and ctrl-n to change suggestion
    set wildmenu
    set wildmode=list,full

    " Line break
    set wrap linebreak
    " Affiche les numéros de lignes
    hi CursorLineNR cterm=bold ctermfg=black ctermbg=yellow
    if v:version > 703
        set relativenumber
    endif
    set number

    " Ignore la casse lors de recherche
    set ignorecase

    " Si dans le motif il n'y a pas de majuscules,
    " alors la recherche sera en casse insensible
    set smartcase

    " Affiche le mode d'édition
    set showmode
    " Affiche la position du curseur
    set ruler
    " Affiche les commandes incomplètes
    set showcmd
    " Si vim ne se souvient pas de la position précédente du curseur
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    " Support de la souris
    set mouse=a
    if exists('ttymouse')
        set ttymouse=xterm2
    endif

    " 80 characters
    highlight OverLength ctermbg=235
    match OverLength /\%81v.\+/

    " Lang and corrector
    set spelllang=en,fr
    map <Leader>z :set spell!<CR>

    " Source vimrc après l'avoir sauvegarder
    " Todo: Trouver une solution pour que airline reste correct après rafraichissement
    " if has("autocmd")
    "   autocmd bufwritepost .vimrc source $MYVIMRC
    " endif

    map <F5> :e!<CR>

    nnoremap <leader>c :call QuickfixToggle()<CR>
    " Set no octal increment number but decimal
    set nrformats=

    "Toggle NerdTree relative and tagbar
    noremap <Leader><Space> :NERDTreeToggle % <Bar> TagbarToggle<CR>

    "Especially for gstatus
    set previewheight=25

    noremap <Space>x :call ToggleDisplay()<CR>

    " undo
    set undofile
    set undodir="$HOME/.vim.undo"
