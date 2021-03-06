" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

autocmd BufWritePost .vimrc source %

let mapleader = ","

" Allow project specific .vimrc
set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

" set font
if has('gui_running')
  set guifont=Sauce\ Code\ Powerline:h14
endif

" Color Theme
set background=dark

syntax on
set iminsert=0    " Disable capslock"
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set term=xterm-256color
set mouse=a       " Enable mouse use in all modes
set number        " Show line numbers
set showmode      " Show the current mode
set tabstop=2     " Softtabs, 2 spaces
set shiftwidth=2
set shiftround
set expandtab
set nowrap
set splitbelow " pen new split panes to right and bottom, which feels more natural
set splitright
set nocursorcolumn   " speed up syntax highlighting
set nocursorline
syntax sync minlines=256
set synmaxcol=150
set re=1
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ttyfast
set timeoutlen=1000 ttimeoutlen=0
set completeopt=menu

" ----------------------------------------- "
" File Type settings              "
" ----------------------------------------- "
"
" Hard code tabs in Makefiles
au FileType make setlocal noexpandtab

" Spell checking
au FileType markdown,gitcommit set spell

au BufNewFile,BufRead *.vim setlocal noet ts=2 sw=2 sts=2
au BufNewFile,BufRead *.txt setlocal noet ts=2 sw=2
au BufNewFile,BufRead *.md setlocal noet ts=2 sw=2

augroup filetypedetect
    au BufNewFile,BufRead *.swift setf swift
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
    au BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
augroup END

" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest
set wildmode=list:full

set wildignore+=*.hg,*.git,*.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                       " Go static files
set wildignore+=go/bin                       " Go bin files
set wildignore+=go/bin-vagrant               " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files


" This trigger takes advantage of the fact that the quickfix window can be
" easily distinguished by its file-type, qf. The wincmd J command is
" equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
" the very bottom (see :help :wincmd and :help ^WJ).
autocmd FileType qf wincmd J

" Strip Trailing Whitespace
nnoremap <Leader>kw :%s/\s\+$//e<CR>

"Dont show me any output when I build something
"Because I am using quickfix for errors
nmap <leader>m :make<CR><enter>

" Some useful quickfix shortcuts
":cc      see the current error
":cn      next error
":cp      previous error
":clist   list all errors
map <C-n> :cn<CR>
map <C-m> :cp<CR>

" Close quickfix easily
nnoremap <leader>a :cclose<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Center the screen
nnoremap <space> zz

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Quick ESC
" Disabled for now due to project with jj in the name
" imap jj <ESC>

" Tab between buffers
noremap <tab> <c-w><c-w>
nnoremap <leader>h :bprev<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>b :b

" Prettify json
com! JSONFormat %!python -m json.tool

" Load plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

