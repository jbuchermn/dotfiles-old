
" Dein.vim {{{
if &compatible
  set nocompatible
endif
set runtimepath+=~/.dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.dein')
    call dein#begin('~/.dein')

    call dein#add('Shougo/dein.vim')

    " Denite
    call dein#add('Shougo/denite.nvim')
    call dein#add('mhartington/denite-neomake')

    " Neomake
    call dein#add('neomake/neomake')

    " Deoplete
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('carlitux/deoplete-ternjs')
    call dein#add('zchee/deoplete-jedi')

    " Symbols
    call dein#add('~/Daten/nvim/nvimbols')

    " Util
    call dein#add('tpope/vim-eunuch')
    call dein#add('tpope/vim-projectionist')
    call dein#add('scrooloose/nerdtree') 
    call dein#add('junegunn/fzf') " Install binary extra using Homebrew
    call dein#add('rking/ag.vim') 
    call dein#add('tomtom/tcomment_vim')
    call dein#add('jiangmiao/auto-pairs')

    " Git
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('Xuyuanp/nerdtree-git-plugin')

    " Styling
    call dein#add('mhartington/oceanic-next')
    call dein#add('bling/vim-airline') 

    " CPP
    call dein#add('~/Daten/nvim/rtags-nvim')

    " JavaScript
    call dein#add('pangloss/vim-javascript')
    call dein#add('moll/vim-node')
    call dein#add('mxw/vim-jsx')

    " LaTeX
    call dein#add('vim-latex/vim-latex')



    if dein#check_install()
        call dein#install()
    endif

    call dein#end()
    call dein#save_state()
endif
" }}}

" Global {{{
language en_US " Language is ENGLISH!
set encoding=utf8
set mouse=a " Mouse scrolling
set exrc " Use local .vimrc
set so=999 " Keep cursor centered vertically
syntax enable
set number

set path=$PWD/**

" Indentation
set autoindent
set smartindent
set cinoptions+=:0 " Indentation of switch-case

filetype plugin indent on

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set wildignore+=*/tmp/*,*.so,*.swp,*.o,*.a,*.d " Ignores
set wildmenu " Command completion
set wildmode=longest,full

let mapleader = ',' " Comma is leader

" Remember cursor position between sessions
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif

" Use ag over grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Save undos
set undodir=~/.config/nvim/undodir
set undofile

" }}}

" Key Mappings - Needs to be cleaned up{{{

" Clear highlights
nmap <silent> <ESC> :noh<CR>

" Highlight without jumping
nnoremap * *`` 

" Map arrow keys
nmap <Up> <Nop>
vmap <Up> <Nop>
nmap <Down> <Nop>
vmap <Down> <Nop>
nmap <Left> <<
vmap <Left> <gv
nmap <Right> >>
vmap <Right> >gv

" Toggle comments
let g:tcommentMaps = 0
nnoremap <silent> <leader>cc :TComment<CR>
vnoremap <silent> <leader>cc :TComment<CR>
vnoremap <silent> <leader>ci :TCommentInline<CR>

" Vim-Projectionist
noremap  <silent> <leader>ph :A<CR>
noremap  <silent> <leader>pv :AV<CR>

" Neomake
noremap           <leader>mm :Neomake<CR>

" NERDTree
let NERDTreeShowHidden=1
nnoremap - :NERDTreeToggle<CR>
vnoremap - :NERDTreeToggle<CR>

nnoremap _ :NVimbolsToggle<CR>
vnoremap _ :NVimbolsToggle<CR>

" FuzzyFinder
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " Use ag, which uses .gitignore
map <C-p> :FZF<CR>

" Frequent Typos
command! Q :q
command! WQ :wq
command! Wq :wq
command! W :w
" }}}

" VimScript {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup end
"  }}}

" JavaScript {{{
let g:jsx_ext_required = 0
" }}}

" NVimbols {{{
let g:nvimbols_enabled = 1
" }}}

"  Deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:tern_request_timeout = 1
set completeopt-=preview
" }}}

" Neomake {{{
let g:neomake_cpp_enabled_makers =  ['rtags']
let g:neomake_c_enabled_makers =  ['rtags']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = ['flake8']

function! ConfigureNeomake()
    if(&filetype == 'cpp' || &filetype == 'c')
        call neomake#configure#automake('r', 750)
    else
        call neomake#configure#automake('rnw', 750)
    endif
endfunction

augroup Neomake_Filetype
    autocmd!
    autocmd Filetype * :call ConfigureNeomake()
augroup end
" }}}

" LaTeX {{{
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'open -a Skim'

noremap <leader>lc :!pdflatex %:h/main.tex<CR>
noremap <leader>lC :!pdflatex %:p<CR>

" Looks great, but extremely unpractical
let g:tex_conceal = ""

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" }}}

" Vim-Projectionist {{{
let g:projectionist_heuristics = {
            \     "*": {
            \         "*.cpp": { "alternate": ["{}.h"] },
            \         "*.c":   { "alternate": ["{}.h"] },
            \         "*.h":   { "alternate": ["{}.cpp", "{}.c"] }
            \     }
            \ }
" }}}

" Styling {{{
if (has("termguicolors"))
	set termguicolors
endif

colorscheme OceanicNext
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1

let g:airline#extensions#neomake#error_symbol='✖ '
let g:airline#extensions#neomake#warning_symbol='⚠️  '

" guibg matches OceanicNext
hi NeomakeErrorMsg guifg=#ff0000 guibg=#343d46
hi NeomakeWarningMsg guifg=#ffff00 guibg=#343d46
let g:neomake_error_sign = {'text': '•', 'texthl': 'NeomakeErrorMsg'}
let g:neomake_warning_sign = {'text': '•', 'texthl': 'NeomakeWarningMsg'}

hi CursorLineNR guifg=#ffffff
" }}}

