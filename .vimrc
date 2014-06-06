" Basics {
	set nocompatible
	set background=dark
	syntax on
	" change map leader
	let mapleader = ","
	let g:mapleader = ","
	set nobackup
	filetype plugin on
	filetype indent on
	set history=700
	set nobackup
	set mouse=a
	set tabpagemax=128
" }

" Vim UI {
	set so=7
	set cursorline
	set incsearch
	set laststatus=2
	set linespace=0
	set matchtime=5
	set novisualbell
	set vb
	set scrolloff=10
	set showcmd
	set showmatch
	set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]	
	set guioptions-=m
	set guioptions-=T
	set guioptions-=L
	set guioptions-=r
	set guioptions-=b
	"set list listchars=tab:»·,trail:·
	set wildmenu
	set wildignore=*.o,*~,*.pyc
	set wildmode=list:longest
	set ruler
	set cmdheight=2
	set hid
	set backspace=indent,eol,start
	set whichwrap+=<,>,h,l	
	set ignorecase
	nnoremap / /\v
	vnoremap / /\v
	set smartcase
	set infercase
	set hlsearch
	set gdefault
	nnoremap <leader><space> :noh<cr>
	nnoremap <tab> %
	vnoremap <tab> %
	set magic
	set noerrorbells
	set novisualbell
	set t_vb=
	set tm=500
	set nobackup
	set nowb
	set noswapfile
	set guifont=Inconsolata\ for\ Powerline\ 10
" }

" Text Formatting/Layout {
	set shiftwidth=8
	set tabstop=8

	set t_Co=256
	colorscheme twilight
	set background=dark

	if has("gui_running")
		set guioptions-=T
		set guioptions+=e
		set guitablabel=%M\ %t
		colorscheme codeschool
	endif

	set encoding=utf8
	set ffs=unix,dos,mac
" }

" Folding {
	set foldenable
	set foldmarker={,}
	set foldmethod=marker
	set foldlevel=100
	set foldopen=block,hor,mark,percent,quickfix,tag
" }
"
" Configuration for C-like languages.
function! SetupForCLang()
    " Highlight lines longer than 80 characters.
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    " Alternately, uncomment these lines to wrap at 80 characters.
    " setlocal textwidth=80
    " setlocal wrap

    " Use 2 spaces for indentation.
    setlocal shiftwidth=2
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal expandtab

    " Configure auto-indentation formatting.
    setlocal cindent
    setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4
    setlocal indentexpr=GoogleCppIndent()
    let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"

    " Uncomment these lines to map F5 to the CEF style checker. Change the path to match your system.
    " map! <F5> <Esc>:!python ~/code/chromium/src/cef/tools/check_style.py %:p 2> lint.out<CR>:cfile lint.out<CR>:silent !rm lint.out<CR>:redraw!<CR>:cc<CR>
    " map  <F5> <Esc>:!python ~/code/chromium/src/cef/tools/check_style.py %:p 2> lint.out<CR>:cfile lint.out<CR>:silent !rm lint.out<CR>:redraw!<CR>:cc<CR>
endfunction

function! GoogleCppIndent()
    let l:cline_num = line('.')

    let l:orig_indent = cindent(l:cline_num)

    if l:orig_indent == 0 | return 0 | endif

    let l:pline_num = prevnonblank(l:cline_num - 1)
    let l:pline = getline(l:pline_num)
    if l:pline =~# '^\s*template' | return l:pline_indent | endif

    " TODO: I don't know to correct it:
    " namespace test {
    " void
    " ....<-- invalid cindent pos
    "
    " void test() {
    " }
    "
    " void
    " <-- cindent pos
    if l:orig_indent != &shiftwidth | return l:orig_indent | endif

    let l:in_comment = 0
    let l:pline_num = prevnonblank(l:cline_num - 1)
    while l:pline_num > -1
        let l:pline = getline(l:pline_num)
        let l:pline_indent = indent(l:pline_num)

        if l:in_comment == 0 && l:pline =~ '^.\{-}\(/\*.\{-}\)\@<!\*/'
            let l:in_comment = 1
        elseif l:in_comment == 1
            if l:pline =~ '/\*\(.\{-}\*/\)\@!'
                let l:in_comment = 0
            endif
        elseif l:pline_indent == 0
            if l:pline !~# '\(#define\)\|\(^\s*//\)\|\(^\s*{\)'
                if l:pline =~# '^\s*namespace.*'
                    return 0
                else
                    return l:orig_indent
                endif
            elseif l:pline =~# '\\$'
                return l:orig_indent
            endif
        else
            return l:orig_indent
        endif

        let l:pline_num = prevnonblank(l:pline_num - 1)
    endwhile

    return l:orig_indent
endfunction

" Formatting {
	set nowrap
	set autoindent
	set shiftwidth=8
	set tabstop=8
	set softtabstop=8
" }

" Bundles {
	filetype off
	set rtp+=~/.vim/bundle/Vundle.vim/
	call vundle#begin()
	Plugin 'gmarik/vundle'
	Plugin 'tpope/vim-fugitive'
	Plugin 'Lokaltog/vim-easymotion'
	Plugin 'Lokaltog/powerline'
	Plugin 'scrooloose/nerdtree'
	Plugin 'vim-scripts/CSApprox'
	Plugin 'altercation/vim-colors-solarized'
	Plugin 'MarcWeber/vim-addon-mw-utils'
	Plugin 'tomtom/tlib_vim'
	Plugin 'honza/vim-snippets'
	Plugin 'garbas/vim-snipmate'
	Plugin 'kien/ctrlp.vim'
	Plugin 'vim-scripts/A.vim'
	Plugin 'vim-scripts/glsl.vim'
	Plugin 'vim-scripts/tagbar'
	Plugin 'flazz/vim-colorschemes'
	Plugin 'mileszs/ack.vim'
	call vundle#end()
	filetype plugin indent on
" }

" CtrlP {
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'
" }

" Easymotion {
	let g:EasyMotion_leader_key = '<Leader>'
" }

" Powerline {
	set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
	let g:Powerline_symbols = 'fancy'
" }

" TagBar {
	map <leader>tt :TagbarToggle<CR>
" }

"" Cscope {
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

	"Window movement
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l
	
	" Switch CWD to the directory of the open buffer
	map <leader>cd :cd %:p:h<cr>:pwd<cr>

	" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
	nmap <M-j> mz:m+<cr>`z
	nmap <M-k> mz:m-2<cr>`z
	vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
	vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`zv

	" Pressing ,ss will toggle and untoggle spell checking
	map <leader>ss :setlocal spell!<cr>

	" Shortcuts using <leader>
	map <leader>sn ]s
	map <leader>sp [s
	map <leader>sa zg
	map <leader>s? z=

	" Disable arrow keys
	nnoremap <up> <nop>
	nnoremap <down> <nop>
	nnoremap <left> <nop>
	nnoremap <right> <nop>
	inoremap <up> <nop>
	inoremap <down> <nop>
	inoremap <left> <nop>
	inoremap <right> <nop>
	nnoremap j gj
	nnoremap k gk

	" No, I don't want help
	inoremap <F1> <ESC>
	nnoremap <F1> <ESC>
	vnoremap <F1> <ESC>

	nnoremap <leader>a :Ack
" }

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

