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

" ctags setup
set tags=tags,tags;

function! s:save_ctags( cur ) 
	let l:found_root = ''
	let l:proj_root = ''

	try
		let l:found_root = findfile( '.gitignore', fnamemodify( a:cur, ':p:h' ) . ';' )
		if empty( l:found_root )
			let l:found_root = finddir( '.git', fnamemodify( a:cur, ':p:h' ) . ';' )
		endif
		if empty( l:found_root )
			throw 'no root'
		endif
	catch /^no\ root/
		echoerr 'No valid project root found'
	finally
		try
			let l:proj_root = fnamemodify( found_root, ':p:h' )
			if ( proj_root =~ 'dotivimrc$' )
				throw 'ignored project'
			endif
		catch /^ignored/
			return
		endtry
	endtry

	execute( 'silent! ictags -R -f ' . proj_root . '/tags ' . proj_root )
endfunction

augroup ivim-ctags
	autocmd!
	au BufWritePost * call s:save_ctags( expand( '%' ) )
augroup END
