" ============================================================================
" Vundle initialization
" Avoid modify this section, unless you are very sure of what you are doing

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
set spell
set ai
set ic
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smarttab
set history=1000             " keep 1000 lines of command line history
set number                   " enable line numbers
set autoindent               " enable autoindent
set smartindent
syntax on                    " enable syntax highlighting
set autoread                 " auto read when file is changed from outside
set history=50               " keep 50 lines of command line history
set mouse=a                  " mouse support
set cursorline               " highlight current line
set clipboard=unnamed        " yank to the system register (*) by default
set pastetoggle=<F10>
set showmatch                " Cursor shows matching ) and }
set showmode                 " Show current mode
set backspace=2              " make backspace work like most other apps
set hlsearch
set wildmenu
set wildmode=longest,list,full
set incsearch
set ignorecase
set showcmd
set nowrap
set enc=utf8                 " add utf-8
set ls=2                     " always show status bar
set laststatus=2
set t_Co=256
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
Bundle 'ervandew/supertab'
Bundle 'easymotion/vim-easymotion'
Bundle 'edsono/vim-matchit'
Bundle 'thinca/vim-quickrun'
" autocomplete
Bundle 'Valloric/YouCompleteMe'
Bundle 'sirver/ultisnips'
Bundle 'honza/vim-snippets'
" Manage projecons
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'airblade/vim-gitgutter'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
" Bundle 'mhinz/vim-signify' "turn on if you don't use git with your control system
" code reading
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'othree/yajs.vim'
" code writing==========================
Bundle 'terryma/vim-multiple-cursors'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/syntastic'
" python
Bundle 'klen/python-mode'
" latex
Bundle 'gerw/vim-latex-suite'
Bundle 'xuhdev/vim-latex-live-preview'
" web
Bundle 'mattn/emmet-vim'
Bundle 'alvan/vim-closetag'
Bundle 'mattn/webapi-vim'
" php
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'm2mdas/phpcomplete-extended'
" nodejs
Bundle 'moll/vim-node'
Bundle 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'ahayman/vim-nodejs-complete'
Bundle 'ternjs/tern_for_vim'
Bundle 'mileszs/ack.vim'
set dictionary+=$VIM.‘~\.vim\bundle\vim-node\dict\node.dict‘

"User interface
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'evanmiller/nginx-vim-syntax'
Bundle 'lilydjwg/colorizer'

" plugin settings===========

" Supertab----------
" let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2

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

" YouCompleteMe------
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'gitcommit' : 1,
      \ 'nerdtree' : 1,
      \}
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter = '/Users/ysya/.pyenv/shims/python'
" set completeopt=longest,menu
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_collect_identifiers_from_comments_and_strings = 0
" let g:ycm_path_to_python_interpreter='/Users/ysya/.pyenv/shims/python'
" nnoremap <leader>lo :lopen<CR> "open locationlist
" nnoremap <leader>lc :lclose<CR>    "close locationlist
let g:ycm_key_invoke_completion = '<C-q>'


" Ultisnips--------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Nerdtree ----------------

map <leader>tr :NERDTreeToggle<CR>
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeCaseSensitiveSort=1
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=1
let NERDTreeShowBookmarks=1
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

" Vim-gitgutter'----------

" Tagbar-----------
let tagbar_left=1
nnoremap <Leader>tl :TagbarToggle<CR>
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

" vim-multiple-cursors------

" Tcomment------------------
let g:tc_option = ' col=1'
noremap <silent> <expr> <LocalLeader>cc ":TComment       " . (exists('b:tc_option') ? b:tc_option : g:tc_option) . "<CR>"
noremap <silent> <expr> <LocalLeader>cb ":TCommentBlock  " . (exists('b:tc_option') ? b:tc_option : g:tc_option) . "<CR>"
noremap <silent> <expr> <LocalLeader>ci ":TCommentInline " . (exists('b:tc_option') ? b:tc_option : g:tc_option) . "<CR>"
noremap <silent> <expr> <LocalLeader>c$ ":TCommentRight  " . (exists('b:tc_option') ? b:tc_option : g:tc_option) . "<CR>"

" Vim-surround-----------

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

" Syntastic ------------------------
let g:syntastic_ignore_files=[".*.py$"]
" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
let g:syntastic_error_symbol = '✗'  "set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
"let g:syntastic_python_checkers=['pyflakes']
"highlight SyntasticErrorSign guifg=white guibg=black
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1
" use jshint
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }

"Python-mode ------------------------------
let g:pymode_run = 1
let g:pymode_run_bind = "<C-S-e>"
let python_highlight_all = 1
let g:pymode_rope = 1
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_bind = "<C-S-d>"
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_write = 1
let g:pymode_lint_unmodified = 0
let g:pymode_lint_message = 1
let g:pymode_lint_cwindow = 1
let g:pymode_virtualenv = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_indent = 1
let g:pymode_rope_goto_definition_bind = ',d'
let g:pymode_rope_goto_definition_cmd = 'e'

" Vim-latex--------------
autocmd Filetype tex setl updatetime=1  " latex live
let g:livepreview_previewer = 'evince'  " latex live
nmap <F12> :LLPStartPreview<cr>
let g:tex_indent_items=0
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set iskeyword+=:
autocmd BufEnter *.tex set sw=2

" javascript-libraries-syntax.vim---------
"let g:used_javascript_libs = 'underscore,backbone,angularjs'

" vim-node---------
autocmd User Node if &filetype == "js" | setlocal expandtab | endif
let javascript_enable_domhtmlcss = 1

" closetag
let g:closetag_filenames = "*.html,*.htm,*.xhtml,*.phtml,*php"

" Airline ------------------------------
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" Signify ------------------------------(if you use)
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
" let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
" nmap <leader>sn <plug>(signify-next-hunk)
" nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
" highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
" highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
" highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
" highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
" highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
" highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

