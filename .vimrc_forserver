" ==========================================
" ProjectLink: https://github.com/ysya/.vim
" Author:  ysya
" ReadMe: README.md
" Last_modify: 20180126
" ==========================================
" ============================================================================
" Vundle initialization
" no vi-compatible
set nocompatible

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" --------------------------------------
" Vim settings and mappings-------------
set background=dark
colorscheme molokai
" syntax highlighting
filetype plugin indent on    " enable filetype-specific plugins
syntax on                    " enable syntax highlighting
set ai
set autoindent               " enable autoindent
set autoread                 " auto read when file is changed from outside
set backspace=2              " make backspace work like most other apps
set clipboard=unnamed        " yank to the system register (*) by default
set cursorline               " highlight current line
set enc=utf8                 " add utf-8
set expandtab
set history=2000             " keep 2000 lines of command line history
set hlsearch
set ic
set ignorecase
set incsearch
set t_Co=256
set laststatus=2
set ls=2                     " always show status bar
set mouse=a                  " mouse support
set nobackup
set nowrap
set nu
set number                   " enable line numbers
set pastetoggle=<F10>
set ruler                    " show the current row and column
set shiftwidth=4
set showcmd
set showmatch                " Cursor shows matching ) and }
set showmode                 " Show current mode
set smartindent
set smarttab
set softtabstop=4
set spell
set title
set tabstop=4
set wildmenu
set wildmode=longest,list,full
" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =
" show big letters
let g:choosewin_overlay_enable = 1
" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" save as sudo
ca w!! w !sudo tee "%"

"folding settings
set foldmethod=marker "fold based on marker
set foldnestmax=10 "deepest fold is 10 levels
set foldenable "disable folding by default
set foldlevel=1
set foldcolumn=0
let php_folding = 1
set foldmarker={{{,}}}
nnoremap @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" when scrolling, keep cursor 3 lines away from screen border
"set scrolloff=3
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" Jump to the last place when you left
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

nmap <leader><left> gT
nmap <leader><right> gt
inoremap <C-x>x <C-x><C-o>

" -------------------------
" Install plugins the first time vim runs
Bundle 'easymotion/vim-easymotion'
Bundle 'edsono/vim-matchit'
Bundle 'thinca/vim-quickrun'
" Manage projecons
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'airblade/vim-gitgutter'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
" code reading
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'elzr/vim-json'
Bundle 'othree/yajs.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'othree/html5.vim'
" code writing==========================
Bundle 'terryma/vim-multiple-cursors'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/syntastic'
" web
Bundle 'mattn/emmet-vim'
Bundle 'alvan/vim-closetag'
"User interface
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'evanmiller/nginx-vim-syntax'
Bundle 'lilydjwg/colorizer'

" plugin settings===========

" Vim-easymotion----
map  / <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" search with 2 letters, you can change it to (easymotion-s) if you want to
" use 1 letter
nmap s <Plug>(easymotion-s2)
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1

" Vim-quickrun-------
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}

let g:quickrun_no_default_key_mappings = 1
" nmap <Leader>r <Plug>(quickrun)
map <Leader>r :QuickRun<CR>

" Vim-instant-markdown
" let g:instant_markdown_autostart = 0

" Nerdtree ----------------

map <C-d> :NERDTreeToggle<CR>
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeCaseSensitiveSort=1
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=1
let NERDTreeShowBookmarks=1
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" Tagbar-----------
let tagbar_right=1
nnoremap <C-t> :TagbarToggle<CR>
let tagbar_width=32
let g:tagbar_compact=1

"vim-indent-guides--------
let g:indent_guides_start_level = 2
let g:indent_guides_space_guides = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

" Tcomment------------------
let g:tc_option = ' col=1'
noremap <silent> <expr> <LocalLeader>cc ":TComment       " . (exists('b:tc_option') ? b:tc_option : g:tc_option) . "<CR>"
noremap <silent> <expr> <LocalLeader>cb ":TCommentBlock  " . (exists('b:tc_option') ? b:tc_option : g:tc_option) . "<CR>"
noremap <silent> <expr> <LocalLeader>ci ":TCommentInline " . (exists('b:tc_option') ? b:tc_option : g:tc_option) . "<CR>"
noremap <silent> <expr> <LocalLeader>c$ ":TCommentRight  " . (exists('b:tc_option') ? b:tc_option : g:tc_option) . "<CR>"

" Tabular---------------
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(su bstitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

" closetag
let g:closetag_filenames = "*.html,*.htm,*.xhtml,*.phtml,*php"

" Airline ------------------------------
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

