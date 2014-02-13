"indent"
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

"colors"
    set background=dark
    highlight LineNr ctermfg=grey ctermbg=black
	syntax enable
    "some option for performance ?
    set nocursorcolumn
    set nocursorline
    syntax sync fromstart
    set synmaxcol=120
    set scrolljump=10
    set hlsearch

"completion"
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


"other"
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
    set mouse=n

"Split"
    set splitbelow
    set splitright

"Show hidden character, show space as dot and tab as 't.'"
    set list
    set lcs=tab:t.
    set lcs+=trail:.

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

"For pathogen
    execute pathogen#infect()

"Indentline
    let g:indentLine_color_term = 0

"CtrlP
    let g:ctrlp_show_hidden = 1

"NERDTree
    silent! nmap <C-n> :NERDTreeTabsToggle<CR>

"Sparkup
    let g:sparkupExecuteMapping = '<s-e>'

"Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=0

"Statline
    let g:statline_filename_relative = 1

"NeoComplCache
" Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
" Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
