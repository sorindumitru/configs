"
" Stolen from http://www.vi-improved.org/vimrc.php
"

" Basics {
	set nocompatible
	set background=dark
	syntax on
	call pathogen#infect()
" }

" General {
	set nobackup
	filetype plugin indent on
	set backspace=indent,eol,start
	set nobackup
	set mouse=a
	set noerrorbells
	set wildmenu
	set wildignore=*.o
	set wildmode=list:longest
" }

" Vim UI {
	set cursorline
	set incsearch
	set laststatus=2
	set linespace=0
	set matchtime=5
	set novisualbell
	set number
	set scrolloff=10
	set showcmd
	set showmatch
	set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]	
	set t_Co=256
	:colorscheme darkspectrum
	:set guioptions-=m
	:set guioptions-=T
	:set guioptions-=L
	:set guioptions-=r
	:set guioptions-=b
" }

" Text Formatting/Layout {
	set ignorecase
	set infercase
	set nowrap
	set smartcase
	set shiftwidth=8
	set tabstop=8
" }

" Folding {
	set foldenable
	set foldmarker={,}
	set foldmethod=marker
	set foldlevel=100
	set foldopen=block,hor,mark,percent,quickfix,tag
" }

" Plugins {
	let Tlist_Auto_Open=0 " let the tag list open automagically
	let Tlist_Compact_Format = 1 " show small menu
	let Tlist_Ctags_Cmd = 'ctags' " location of ctags
	let Tlist_Enable_Fold_Column = 0 " do show folding tree
	let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill 
				       " yourself
	let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
	let Tlist_Sort_Type = "name" " order by 
	let Tlist_Use_Right_Window = 1 " split to the right side
                                       " of the screen
	let Tlist_WinWidth = 40 " 40 cols wide, so i can (almost always)
                                " read my functions
" }

" Cscope {
if has("cscope")
	" Look for a 'cscope.out' file starting from the current directory,
	" going up to the root directory.

	if (filereadable("cscope.out"))
		execute "cs add cscope.out"
	else
		let s:dirs = split(getcwd(), "/")
		while s:dirs != []
			let s:path = "/" . join(s:dirs, "/")
			if (filereadable(s:path . "/cscope.out"))
				execute "cs add " . s:path . "/cscope.out " . s:path
				break
			endif
			let s:dirs = s:dirs[:-2]
		endwhile
	endif

	set csto=0
	set cst
	set csverb

	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	map <F10> :copen<CR>
	map <F11> :cprevious<CR>
	map <F12> :cnext<CR>

	" Open a quicfix window for the following queries.
	set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
endif

" }

" Mappings {
	nnoremap <F5> :GundoToggle<CR>
	nnoremap <F6> :NERDTreeToggle<CR>
	nnoremap <F7> :TlistToggle<CR>
	map <F9>e :!p4 edit '%'<CR>
" }
