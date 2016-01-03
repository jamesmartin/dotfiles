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

" Wildmenu stuff 
set wildchar=<Tab> wildmenu wildmode=full

"Vertical split then hop to new buffer
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>

" Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
let mapleader = ","
imap jj <Esc>
imap uu _
imap hh =>
imap aa @
" JM - useful to be able to toggle wrapping when writing prose
nnoremap <leader>w :set wrap<CR>
nnoremap <leader>W :set nowrap<CR>
" Open file under cursor in quicklist
nnoremap ,o :.cc<CR>
" Toggle spell checking with <leader>s
nmap <silent> <leader>s :set spell!<CR>
" Set region to British English
set spelllang=en_us

"Moving around windows more easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resizing windows
nmap <s-l>  :3wincmd <<cr>
nmap <s-h> :3wincmd ><cr>
nmap <s-k>    :3wincmd +<cr>
"nmap <s-j>  :3wincmd -<cr>

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

call pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto commit to git - inspired by https://github.com/tlvince/vim-auto-commit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! AutoGitCommit()
  let oldworkingdir = getcwd()
  :lcd %:p:h

  call system('git rev-parse --git-dir > /dev/null 2>&1')
  if v:shell_error
    return " file can't be under version control
  end

  call system('git add ' . expand('%:p'))
  let message = 'Updated (auto-commit) ' . expand('%')
  call system('git commit -m ' . shellescape(message, 1))

  exe ':lcd ' . oldworkingdir
endfunction
map <leader>c :w\|:call AutoGitCommit()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY - courtesy of Gary Bernhardt
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE - courtesy of Gary Bernhardt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>m :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET - courtesy of Gary Bernhardt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

map <leader>r :call RunTestFile()<cr>
map <leader>R :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>
map <leader>w :w\|:!script/features --profile wip<cr>

" Colors **********************************************************************
set background=dark 
colorscheme solarized
syntax on

" Cursor highlights ***********************************************************
set cursorline

" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word

" Folding ***************************************************************
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" File Stuff ******************************************************************
filetype plugin indent on
autocmd FileType html :set filetype=xhtml 
autocmd FileType cpp :set filetype=cpp.cpputest
autocmd FileType hpp :set filetype=hpp.cpputest
autocmd FileType c :set filetype=c.cpputest
autocmd FileType h :set filetype=h.cpputest

" Restore cursor position
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Insert New Line **************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>

" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Misc ************************************************************************
set backspace=indent,eol,start
set number " Show line numbers
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

autocmd FileType c set makeprg=scons\ \check
autocmd FileType ruby set makeprg=rake

autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=0
autocmd FileType markdown setlocal spell

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

" Ack/Ag
let g:ackprg = 'ag --nogroup --nocolor --column'

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
" |                               Host specific                               |
" -----------------------------------------------------------------------------  
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"if hostname() == "foo"
  " do something
"endif
"
" CTRL-P
"
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,jspm_packages/*,node_modules/*
let g:ctrlp_custom_ignore={
  \'dir': '\v[\/](\.(git|hg|svn)|(jspm_packages|node_modules))$'
  \}
