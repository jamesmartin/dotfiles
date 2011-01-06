" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" | Some highlights:                                                          |
" |   jj = <esc>  Very useful for keeping your hands on the home row          |
" |   ,n = toggle NERDTree off and on                                         |
" |                                                                           |
" |   ,f = fuzzy find all files                                               |
" |   ,b = fuzzy find in all buffers                                          |
" |                                                                           |
" |   hh = inserts '=>'                                                       |
" |   aa = inserts '@'                                                        |
" |                                                                           |
" |   ,h = new horizontal window                                              |
" |   ,v = new vertical window                                                |
" |                                                                           |
" |   ,i = toggle invisibles                                                  |
" |                                                                           |
" |   enter and shift-enter = adds a new line after/before the current line   |
" |                                                                           |
" |   :call Tabstyle_tabs = set tab to real tabs                              |
" |   :call Tabstyle_spaces = set tab to 2 spaces                             |
" |                                                                           |
" | Put machine/user specific settings in ~/.vimrc.local                      |
" -----------------------------------------------------------------------------  


set nocompatible


" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
  autocmd User Rails set softtabstop=4
  autocmd User Rails set shiftwidth=4
  autocmd User Rails set tabstop=4
  autocmd User Rails set noexpandtab
endfunction

function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

call Tabstyle_spaces()


" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent	(local to buffer)


" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitright

set wildchar=<Tab> wildmenu wildmode=full

"Vertical split then hop to new buffer
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>

"Moving around windows more easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l



" Cursor highlights ***********************************************************
set cursorline
hi CursorLine cterm=NONE ctermbg=black
"set cursorcolumn


" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase
set gdefault
" JM CTRL-n for toggling search hilighting
:map <silent> <C-N> :set invhlsearch<CR>
nnoremap / /\v
vnoremap / /\v
" Bracket jumping with TAB
nnoremap <tab> %
vnoremap <tab> %


" Colors **********************************************************************
"set t_Co=256 " 256 colors
set background=dark 
if &t_Co > 2 || has("gui_running")
  syntax on " syntax highlighting
endif

if has("gui_running")
  colorscheme ir_black
else
  :color grb4
endif


" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
"set ch=2 " Make command line two lines high
"match LongLineWarning '\%120v.*' " Error format when a line is longer than 120


" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word

" Folding ***************************************************************
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Mappings ********************************************************************
" Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
imap jj <Esc>
imap uu _
imap hh =>
imap aa @
" JM - useful to be able to toggle wrapping when writing prose
nnoremap <leader>w :set wrap<CR>
nnoremap <leader>W :set nowrap<CR>


" Directories *****************************************************************
" Setup backup location and enable
"set backupdir=~/backup/vim
"set backup

" Set Swap directory
"set directory=~/backup/vim/swap

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h


" File Stuff ******************************************************************
filetype plugin indent on
" To show current filetype use: set filetype

"autocmd FileType html :set filetype=xhtml 
autocmd FileType cpp :set filetype=cpp.cpputest
autocmd FileType hpp :set filetype=hpp.cpputest
autocmd FileType c :set filetype=c.cpputest
autocmd FileType h :set filetype=h.cpputest

"irb REstore cursor position
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

augroup mkd
  autocmd BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

" Inser New Line **************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)


" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize


" Misc ************************************************************************
set backspace=indent,eol,start
"set number " Show line numbers
set relativenumber " Show line numbers relative to each other (version > vim7.3)
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how


" Invisible characters *********************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap ,i :set list!<CR> " Toggle invisible chars

" Long line stuff 
set textwidth=79
set formatoptions=qrnl
set colorcolumn=85


" Mouse ***********************************************************************
"set mouse=a " Enable the mouse
"behave xterm
"set selectmode=mouse


" Cursor Movement *************************************************************
" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge


" Ruby stuff ******************************************************************
"compiler ruby         " Enable compiler support for ruby
"map <F5> :!ruby %<CR>


" Omni Completion *************************************************************
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" May require ruby compiled in
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 

" JM running tests
" All credit to Gary Bernhardt for this technique:
" http://bitbucket.org/garybernhardt

function! MakeClean()
  silent ! echo
  exec '!scons -c'
endfunction

autocmd FileType c set makeprg=scons\ \check
autocmd FileType ruby set makeprg=rake

function! RunTests()
  silent ! echo
  exec 'silent ! echo -e "\033 [1,36mRunning tests \033[0m"'
  "set makeprg=scons\ \check
  silent w
  exec "make "
endfunction

function! TestQfList()
  if getqflist() != []
    for error in getqflist()
      echo bufname(error.bufnr) ':' error.lnum '=' error.text 
      echo 'type: ' error.type
      if error['valid']
        echo 'VALID!'
      endif
      if error.text =~ '^OK '
        echo 'Hooray!'
      endif
    endfor
  endif
endfunction

function! JumpToError()
  if getqflist() != []
    for error in getqflist()
      if error['valid']
        break
      endif
      if error.text =~ '.*up to date\.'
        call GreenBar()
        echo "Up to date"
        return
      endif
      if error.text =~ '^OK '
        call GreenBar()
        echo "All tests passed"
        return
      endif
    endfor
    let error_message = substitute(error['text'], '^ *', '', 'g')
    silent cc!
    exec ":sbuffer " . error['bufnr']
    call RedBar()
    echo error_message
  else
    call GreenBar()
    echo "All tests passed"
  endif
endfunction

function! RedBar()
  hi RedBar ctermfg=white ctermbg=red guibg=red
  echohl RedBar
  echon repeat(" ",&columns - 1)
  echohl
endfunction

function! GreenBar()
  hi GreenBar ctermfg=white ctermbg=green guibg=green
  echohl GreenBar
  echon repeat(" ",&columns - 1)
  echohl
endfunction

nnoremap <leader>m :call RunTests()<cr>:redraw<cr>:call JumpToError()<cr>
nnoremap <leader>c :call MakeClean()<cr>
nnoremap <leader>r :exec '!rake'<cr>

" JM the JumpToError function acts weird without this
set switchbuf=useopen

" -----------------------------------------------------------------------------  
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------  

" NERDTree ********************************************************************
:noremap ,n :NERDTreeToggle<CR>

" User instead of Netrw when doing an edit /foobar
let NERDTreeHijackNetrw=1

" Single click for everything
let NERDTreeMouseMode=1


" SnippetsEmu *****************************************************************
"imap <unique> <C-j> <Plug>Jumper
"let g:snip_start_tag = "_\."
"let g:snip_end_tag = "\._"
"let g:snip_elem_delim = ":"
"let g:snip_set_textmate_cp = '1'  " Tab to expand snippets, not automatically.


" fuzzyfinder_textmate ********************************************************
map ,f :FuzzyFinderTextMate<CR>
map ,b :FuzzyFinderBuffer<CR>
"let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.pyc;.pyo;.DS_Store;.db'

" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2

" rubytest *******************************************************************
let g:rubytest_cmd_spec = "spec --color -f specdoc %p"
let g:rubytest_cmd_example = "spec --color -f specdoc %p -e '%c'"


" -----------------------------------------------------------------------------  
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------  

" Mac *************************************************************************
"if has("mac") 
  "" 
"endif
 
" Windows *********************************************************************
"if has("gui_win32")
  "" 
"endif



" -----------------------------------------------------------------------------  
" |                               Startup                                     |
" -----------------------------------------------------------------------------  
" Open NERDTree on start
"autocmd VimEnter * exe 'NERDTree' | wincmd l 



" -----------------------------------------------------------------------------  
" |                               Host specific                               |
" -----------------------------------------------------------------------------  
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"if hostname() == "foo"
  " do something
"endif
