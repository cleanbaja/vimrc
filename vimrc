" quick and small vimrc
" Author: Yusuf V. Hirsi (@cleanbaja)
" License: GPLv3 <https://www.gnu.org/licenses/gpl>

call plug#begin('~/.vim/plugged')
" Essential Plugins
Plug 'junegunn/fzf', #{ do:{ -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'

" UI based Plugins
Plug 'itchyny/lightline.vim'
Plug 'cleanbaja/ayu-vim'

" Programming Languages
Plug 'https://git.sr.ht/~sircmpwn/hare.vim'
Plug 'ziglang/zig.vim'
Plug 'rust-lang/rust.vim'
call plug#end()

" vim basics
filetype plugin indent on | syntax enable
set modeline modelines=5  hlsearch    laststatus=2
set wildmenu lazyredraw   showcmd     scrolloff=1
set autoread smarttab     scrolloff=1 complete-=i
set ruler    incsearch    autoindent  noshowmode
set list     listchars=tab:\>\ ,lead:.,trail:^,nbsp:#
set display+=lastline backspace=indent,eol,start

" colorscheme stuff
if (has('termguicolors'))
  set t_Co=256
  set termguicolors
endif
let ayucolor="mirage"
colo ayu

" helper function to switch color scheme
function ToggleColorScheme()
    if g:ayucolor ==# "mirage"
        let g:ayucolor="light"
    elseif g:ayucolor ==# "light"
        let g:ayucolor="dark"
    else
        let g:ayucolor="mirage"
    endif

    colorscheme ayu
endfunction

" vimrc related commands
command VV  <mods>  new $MYVIMRC
command VL  <mods>  new $MYVIMRCLOCAL
command VR  <mods>  source $MYVIMRC
command VimrcLocal  let $MYVIMRCLOCAL = expand('<sfile>:p:~')

" Useful keybindings
let mapleader="\<space>"
noremap <leader>c      :tabnew<CR>
noremap <leader>f      :Files<CR>
noremap <leader>b      :Buffers<CR>
noremap <leader>t      :call ToggleColorScheme()<CR>
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Folding
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10
set foldenable
nnoremap <space><space> za

" Load matchit and man plugins
runtime! ftplugin/man.vim
runtime! macros/matchit.vim

" Add custom command to open help fullscreen
command! -nargs=1 -complete=help H help <args> | silent only
