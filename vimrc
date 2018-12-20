" Workspace Setup
" ----------------
function! DefaultWorkspace()
    " Rough num columns to decide between laptop and big monitor screens
    let numcol = 2
    if winwidth(0) >= 220
        let numcol = 3
    endif

    if numcol == 3
        e term://htop
        file Shell\ Two
        vnew
    endif

    vsp term://htop
    file Context
    sp term://htop
    file Shell\ One
    wincmd k
    resize 4
    wincmd h
endfunction
command! -register DefaultWorkspace call DefaultWorkspace()

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/lstenzel/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/lstenzel/.vim/bundle')
  call dein#begin('/home/lstenzel/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('/home/lstenzel/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-clang')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('5H3LL3H5/neomake')
  call dein#add('5H3LL3H5/syntastic')
  call dein#add('5H3LL3H5/tagbar')
  call dein#add('5H3LL3H5/vim-airline-themes')
  call dein#add('5H3LL3H5/vim-airline')
  call dein#add('5H3LL3H5/vim-eunuch')
  call dein#add('5H3LL3H5/vim-sensible')
  call dein#add('5H3LL3H5/vim-signify')
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('pdavydov108/vim-lsp-cquery')
  call dein#add('prabirshrestha/asyncomplete.vim')
  call dein#add('prabirshrestha/asyncomplete-lsp.vim')
  call dein#add('ludovicchabant/vim-gutentags')
  call dein#add('skywind3000/gutentags_plus')
  call dein#add('jeffkreeftmeijer/vim-numbertoggle')
  call dein#add('iCyMind/NeoSolarized')
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-scripts/a.vim')
  call dein#add('vim-scripts/svn-diff.vim')
  call dein#add('jordwalke/flatlandia')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set termguicolors
" :help python-provider (nvim)
"
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""
" Gutentags 
""""""""""""""""""""""""""""""""""
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

""""""""""""""""""""""""""""""""""
" CQUERY - Autocompletion
""""""""""""""""""""""""""""""""""
if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

""""""""""""""""""""""""""""""""""
" SNIPPETS STUFF
""""""""""""""""""""""""""""""""""

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

"
"  syntastic plugin conf
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"
"  airline plugin
"
" fancy tabs
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='papercolor'

" showup non-printable characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" enable hybrid line numbering
set nu relativenumber

" close vim if only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
" toogling
"
" disable hybrid line numbering (https://jeffkreeftmeijer.com/vim-number)
nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :set nu! rnu!<CR>	
nmap <F7> :set list!<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :SyntasticToggleMode<CR>

colorscheme NeoSolarized
"set background=light
set background=dark

" default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "high"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "high"

" I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
" style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized
" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

set tabstop=4
set autoindent
set nobackup
set showcmd
set showmatch
set scrolloff=5
set textwidth=80
set colorcolumn=80
set linebreak
set wrap
set nolist

" Enables cursor line position tracking:
set cursorline
" " Removes the underline causes by enabling cursorline:
highlight clear CursorLine
" " Sets the line numbering to red background:
highlight CursorLineNR ctermbg=Grey
"
" " These settings highlight a vertical cursor column:
"set cursorcolumn
"highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
"highlight CursorColumn ctermfg=Black ctermbg=Yellow cterm=bold guifg=Black guibg=yellow gui=NONE
