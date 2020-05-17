" set up pathogen
source ~/dotivimrc/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect( '~/dotivimrc/{}' )

" keep everything here for VC purposes
set runtimepath+=~/dotivimrc
set packpath+=~/dotivimrc

" look and feel
" 
" this might be iVim-specific, and if it is, i should figure out how
" to make this a conditional in case i ever move to a different Vim
set guifont=iosevka-term-regular.ttf:h18
colorscheme alabaster

" global keybinds
let mapleader=','
inoremap kj <Esc>
vnoremap kj <Esc>
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l

" vim-lsc
let g:lsc_auto_map = v:true
let g:lsc_trace_level = "verbose"
let g:lsc_server_commands = {
			\ 'javascript': {
			\ 'name': 'js',
			\ 'command': 'ssh pi@raspberrypi.local "/home/pi/log-js-server"',
			\ 'enabled': v:false
			\ }
			\ }

