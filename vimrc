
"
" :help python-provider (nvim)
"
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3'

" disable python2 support
" let g:loaded_python_provider = 1 

"xecute plug#begin('~/.vim/plugged')


" Make sure you use single quotes
"
"lug 'junegunn/vim-easy-align'
"
" Any valid git URL is allowed
"lug 'https://github.com/junegunn/vim-github-dashboard.git'
"
" Multiple Plug commands can be written in a single line using |
" separators
"lug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" On-demand loading
"lug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"lug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
" Using a non-master branch
"lug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"lug 'fatih/vim-go', { 'tag': '*' }
"
" Plugin options
"lug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
" Plugin outside ~/.vim/plugged with post-update hook
"lug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"lug 'junegunn/fzf.vim'
"
"lug 'vim-airline/vim-airline'
"lug 'vim-airline/vim-airline'
"lug 'Shougo/denite.nvim'
"lug 'majutsushi/tagbar'

"
" Initialize plugin system
"xecute plug#end()

"
" use pathogen plugin manager
"
execute pathogen#infect()

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

" showup non-printable characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

"
" shortcuts / own key combos
"
"
" tagbar: toogle by pressing <F8>
nmap <F7> :set list!<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :SyntasticToggleMode<CR>
