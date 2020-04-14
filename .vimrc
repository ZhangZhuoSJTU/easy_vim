"===============================================================================
" General
"===============================================================================

" Enable mouse
" set mouse=a

" Set UTF-8 encoding
set encoding=utf-8

" Show line number
set number

" Auto read when a file is changed from the outside
set autoread

" Hieght of command bar
"set cmdheight=2

" Allow regular expressions when searching
set magic

" Show matching brackets
set showmatch

" Set tab to 4 spaces. 'ts' means tabstop.
set tabstop=4
set expandtab

" Set shiftwidth to 4 spaces
set shiftwidth=4

" Hightlight the 80th column
"high ColorColumn ctermbg=236 guibg=#FFFFFF
set colorcolumn=80

" Hightlight current line
set cursorline

" Remap leader key
let mapleader = ","
let g:mapleader = ","

"===============================================================================
" Search
"===============================================================================

" Hightlight search results
set hlsearch

" Show matches when typing searching pattern
set incsearch

" When searching try to be smart about cases
set ignorecase
set smartcase

"===============================================================================
" Self-Designed Functions
"===============================================================================

" Set relative line number
augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Open file at last known cursor position
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Remove trailing whitespace when saving (only for specific file type)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.sh :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.rs :call DeleteTrailingWS()

" Maintain undo history between sessions
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.vim/undodir
endif

" :W saves the file too (useful for mistyping)
command W w
" :O refreshes the file too (useful for mistyping)
command O o


"===============================================================================
" Vundle Plugins
"===============================================================================

set nocompatible	" required
filetype off		" required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'	" required

" Plugin begins here.

" Color themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tomasr/molokai'
Plugin 'fmoralesc/molokayo'
Plugin 'rakr/vim-one'

" Airline and its color themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/powerline-fonts'

Plugin 'scrooloose/nerdtree'

" Auto complete
Plugin 'ycm-core/YouCompleteMe'
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'davidhalter/jedi-vim'

" Indent line
Plugin 'Yggdroot/indentLine'

" Necessary auto-format tools
Plugin 'rust-lang/rust.vim'
"Plugin 'psf/black'
"Plugin 'rhysd/vim-clang-format'
"Plugin 'maksimr/vim-jsbeautify'

" TagbarToggle
"Plugin 'majutsushi/tagbar'

" All of Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required
" To ignore plugin indent changes, instead use:
"filetype plugin on


" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ

"===============================================================================
" Colorscheme
"===============================================================================

syntax enable
set t_Co=256
set background=dark


" solarized
"let g:solarized_termcolors=256
"let g:solarized_termtrans = 1
"colorscheme solarized

" PaperColor
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1,
  \       'allow_bold': 1,
  \       'allow_italic': 0
  \     }
  \   },
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
colorscheme PaperColor

" Molokaic
"let g:molokai_original = 1
"colorscheme molokai

" One
"set termguicolors
"let g:one_allow_italics = 1 " Enable italic for comments
"colorscheme one

"set background=dark
"colorscheme evening

"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

" Set searching match color
highlight Search ctermbg=227


"===============================================================================
" Airline
"===============================================================================

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable smarter tab line
"let g:airline#extensions#tabline#enable = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = "|"

" Set airline color theme
" light, one, wombat
let g:airline_theme='powerlineish'


"===============================================================================
" NERDTree
"===============================================================================

" Open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Exit NERDTree if there is only one window opened in vim
"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show hideen files
let NETDTreeShowHidden=1

" Open/close NERDTree by <Enter>
":nnoremap <Enter> :NERDTreeToggle<CR><C-w><C-w>

" Open/close NERDTree by <leader>l
:nnoremap <leader>l :NERDTreeToggle<CR><C-w><C-w>


"===============================================================================
" JavaComplete2
"===============================================================================
" Required
"autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Disable default mappings
"let g:JavaComplete_EnableDefaultMappings = 0


"===============================================================================
" RustFmt
"===============================================================================
" RustFmt with <leader>r
:nnoremap <leader>r :RustFmt<CR>


"===============================================================================
" JSBeautifier 
"===============================================================================
" JSBeautifier with <leader>j
":nnoremap <leader>j :call JsBeautify()<CR>
":nnoremap <leader>h :call HtmlBeautify()<CR>
":nnoremap <leader>C :call CSSBeautify()<CR>


"===============================================================================
" ClangFormat
"===============================================================================
" ClangFormat with <leader>c
":nnoremap <leader>c :ClangFormat<CR>


"===============================================================================
" Tagbar
"===============================================================================
":nnoremap <leader>t :TagbarToggle<CR>


"===============================================================================
" Black
"===============================================================================
":nnoremap <leader>b :Black<CR>
