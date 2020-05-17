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

" vim-gutentags
let g:gutentags_trace = 1
let g:gutentags_modules = ['ctags']
let g:gutentags_ctags_executable = ':ictags'
let g:gutentags_define_advanced_commands = 1
" Working Copy doesn't clone the `.git` folder over, so
" we want to use `.gitignore` as a marker instead
let g:gutentags_project_root = ['.gitignore']
let g:gutentags_enabled = 1
