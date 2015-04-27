set nocompatible
set expandtab
set shiftwidth=2
set softtabstop=2
set diffopt=vertical,filler
silent! set relativenumber
silent! set number
filetype off

let g:blockle_mapping = '<Leader>ed'
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle  'gmarik/Vundle.vim'
Bundle  'tpope/vim-rails.git'
Bundle  'tpope/vim-fugitive.git'
"Bundle 'scrooloose/nerdtree.git' # corrupting characters
Bundle  'tpope/vim-rvm.git'
Bundle  'tpope/vim-endwise.git'
Bundle  'tpope/vim-surround.git'
Bundle  'Townk/vim-autoclose'
"Bundle 'vim-scripts/slimv.vim'
Bundle  'kchmck/vim-coffee-script'
"Bundle 'tpope/vim-haml'
Bundle  'altercation/vim-colors-solarized'
Bundle  'kien/ctrlp.vim'
Bundle  'benmills/vimux'
Bundle  'mattn/emmet-vim'
Bundle  'scrooloose/nerdcommenter.git'
Bundle  'jwhitley/vim-matchit.git'
Bundle  'tpope/vim-fireplace'
Bundle  'guns/vim-clojure-static'
Bundle  'patrickmcelwee/ftl-vim-syntax'
Bundle  'groenewege/vim-less'
Bundle  'mattpap/vim-owl-tools'
Bundle  'jgdavey/vim-blockle'
Bundle  'derekwyatt/vim-scala'
Bundle  'digitaltoad/vim-jade'
Bundle  'amdt/vim-niji'
Bundle  'sjl/gundo.vim'
Bundle  'niklasl/vim-rdf'
Bundle 'patrickmcelwee/sonicpi.vim'

let g:sonicpi_keymaps_enabled = 0
nnoremap <leader>P :silent w !sonic_pi<CR>
inoremap <C-p> <C-O>:silent w !sonic_pi<CR>
nnoremap <leader>S :call system("sonic_pi stop")<CR>
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

call vundle#end()
filetype on
filetype indent on
filetype plugin on

imap jk <Esc>
" Change mapleader from \ to ,
" Remap comma function
let mapleader=" "
syntax on
set tags+=gems.tags
nnoremap K -J
nnoremap <Leader>w :w<CR>

set background=dark
colorscheme solarized

" Vivo_Admin
" When in a resource, open its map
nnoremap <Leader>mp :e app/maps/%:t:r_map.rb<CR>
" When in a map, open its resource
nnoremap <Leader>rs :e lib/duke_vivo_mapper/resources/%:t:r:s/_map//.rb<CR>

" Code to create a new data loader
nnoremap <leader>dl a<space>Rails.configuration.data_loader_factory.create_data_loader<Esc>
nnoremap <leader>es aexpect(subject.)<Esc>==g_i

" Ctrl-P
nnoremap <Leader>f :CtrlP <CR>
nnoremap <Leader>b :CtrlPBuffer <CR>
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<c-f>'] }
"exclude source and compiled files (put in target/ by scala)
let g:ctrlp_custom_ignore = '\v/(\.git|\.build|target|out|classes|gen|log)$'
"map <Leader>gdm :CommandTFlush<CR>\|:CommandT lib/duke_vivo_mapper/maps<CR>
"map <Leader>gdr :CommandTFlush<CR>\|:CommandT lib/duke_vivo_mapper/resources<CR>
"map <Leader>gds :CommandTFlush<CR>\|:CommandT lib/duke_vivo_mapper/sources<CR>
"map <Leader>gdd :CommandTFlush<CR>\|:CommandT lib/duke_vivo_mapper/models<CR>

nnoremap <Leader>jc :!javac % <CR>
let g:user_emmet_leader_key='<C-Q>'

" Lazy save 
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" Switch to last window
nnoremap <Leader><Leader> <C-^>

"Open this rc file
nnoremap <Leader>rc :e ~/.vimrc<CR>

"Move between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Create directory for current open file
nnoremap <Leader>md :!mkdir -p %:h<CR>

"Vimux
" If text is selected, save it in v buffer and send to tmux
vnoremap <Leader>vt "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
" Select current paragraph and send it to tmux
nmap <Leader>vt vip<Leader>vt
nmap <Leader>vv V<Leader>vt

let g:VimuxOrientation = "h"
let g:VimuxHeight = "23"
let VimuxUseNearestPane = 1

" Run the current file with rspec, excluding js specs
nnoremap <Leader>vs :call VimuxRunCommand("bundle exec rspec --tag ~js " . bufname("%"))<CR>
" Run the current spec with rspec, including js specs
nnoremap <Leader>vjs :call VimuxRunCommand("JRUBY_OPTS='$JRUBY_OPTS -J-Xmx2024m -J-XX:MaxPermSize=112m' bundle exec rspec " . bufname("%"))<CR>
" Run the current spec with rspec
nnoremap <Leader>vo :call VimuxRunCommand("JRUBY_OPTS='$JRUBY_OPTS -J-Xmx2024m -J-XX:MaxPermSize=112m' bundle exec rspec " . expand("%p") . ":" . line("."))<CR>
" Run all specs
nnoremap <Leader>va :call VimuxRunCommand("JRUBY_OPTS='$JRUBY_OPTS -J-XX:MaxPermSize=112m' bundle exec rspec spec")<CR>
" Run all model specs
nnoremap <Leader>vm :call VimuxRunCommand("rspec spec/models")<CR>
" Run all controller specs
nnoremap <Leader>vc :call VimuxRunCommand("rspec spec/models")<CR>
" Prompt for a command to run map
nnoremap <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
nnoremap <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
nnoremap <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane map
nnoremap <Leader>vx :VimuxInterruptRunner<CR>

"Run the current file with test_unit
nnoremap <Leader>ru :call VimuxRunCommand("ruby -Itest " . bufname("%"))<CR>
"Run the current spec with test_unit
nnoremap <Leader>ro :call VimuxRunCommand("ruby " . expand("%p") . ":" . line("."))<CR>

"Run all tests
nnoremap <Leader>rt :call VimuxRunCommand("bundle exec rake test")<CR>
"Run the current file with minitest
nnoremap <Leader>ms :call VimuxRunCommand("ruby -Itest -rminitest/pride " . bufname("%"))<CR>
"Run all specs with minitest
nnoremap <Leader>ma :call VimuxRunCommand("ruby -Itest -rminitest/pride spec/specs.rb")<CR>

"Vivo
nnoremap <Leader>vd :call VimuxRunCommand("ant deploy -Dskiptests=true")<CR>
nnoremap <Leader>aa :call VimuxRunCommand("ant all -Dskiptests=true")<CR>

"IRB
"Load the current file in ruby
"Make this harder to do
nnoremap <Leader>+lf :call VimuxRunCommand("load \'" . bufname("%") . "\'")<CR>

"Surround shortcuts
"Surround all text on line
nmap <Leader>ss $v^S
" Clear the search buffer
nnoremap <Leader>h :nohlsearch<cr>

" Directory of current file with '%%'
cnoremap %% <C-R>=expand('%:h').'/'<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
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
" RENAME CURRENT FILE
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
nnoremap <leader>rn :call RenameFile()<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRACT METHOD
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ExtractMethod()
  normal! md
  let method_name = input('Method name: ')
  execute ":normal `da" . method_name
  execute ":normal G?def\<cr>%o\<cr>def " . method_name
  normal! oend
  normal! O
  normal! p==`d
endfunction
nnoremap <Leader>em vg_d:call ExtractMethod()<CR>
vnoremap <leader>em d:call ExtractMethod()<CR>
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
  if (&filetype=='ruby')
    let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1 || match(current_file, '\<loaders\>')
    if going_to_spec
      if in_app
        let new_file = substitute(new_file, '^app/', '', '')
      end
      let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
      let new_file = 'spec/' . new_file
    else
      let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
      let new_file = substitute(new_file, '^spec/', '', '')
      if in_app
        let new_file = 'app/' . new_file
      end
    endif
  endif
  if (&filetype=='clojure')
    if going_to_spec
      let new_file = substitute(new_file, '^src/', 'spec/', '')
      let new_file = substitute(new_file, '\.clj$', '_spec.clj', '')
    else
      let new_file = substitute(new_file, '_spec\.clj$', '.clj', '')
      let new_file = substitute(new_file, '^spec/', 'src/', '')
    endif
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

set backupdir=$HOME/.vim_backups
set directory=$HOME/.vim_backups

augroup smart_closure
  autocmd!
  autocmd FileType html imap {{ {{}}<Esc>hi
  autocmd FileType css inoremap { {
  autocmd FileType javascript inoremap { {
augroup END

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  autocmd FileType text setlocal formatoptions=tan
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  " Indent p tags
  "autocmd FileType eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif
augroup END

" Paste toggle
set pastetoggle=<F2>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" allow deleting selection without updated clipboard (yank buffer)
vnoremap x "_x

set laststatus=2
set history=500		" command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set cursorline
set hlsearch
set winwidth=83
set winheight=20
set statusline=%<(%{&ft})\ %{fugitive#statusline()}\ %=%-8(%3l,%02c%03V%)(%p%%)\ %f%(%m%)
set wildmode=longest,list
set wildmenu
" Catch trailing whitespace
nnoremap <leader>sw /\s\+$<CR>
" Show last command
nnoremap <leader>l1 :<up>
nnoremap <leader>l2 :<up><up>
set visualbell
set shortmess=AI " Do not warn of existing swap file or show intro
set matchpairs+=<:> " % jumps between carets
"Display a visual barrier for col 80
silent! set colorcolumn=80
"Use confirm instead of aborting an action
set confirm
"Always have lines of context above or below current line
set scrolloff=3

if &t_Co >= 256 && &bg == "dark"
  highlight ColorColumn ctermbg=233
elseif &t_Co >= 256 && &bg != "dark"
  highlight ColorColumn ctermbg=230
else
  highlight ColorColumn ctermbg=8
endif

let g:slimv_swank_cmd = '! xterm -e scheme --load /home/patrick/.vim/bundle/slimv.vim/slime/contrib/swank-mit-scheme.scm &'

" Puts out value of a variable below its definition
"pt = put
nnoremap <Leader>pt "xyiwoputs ": #{}"<esc>F:"xPf{"xp 
nnoremap <Leader>pit "xyiwoputs ": #{.inspect}"<esc>F:"xPf{"xp 
vnoremap <Leader>pt "xyoputs ": #{}"<esc>F:"xPf{"xp
vnoremap <Leader>pit "xyoputs ": #{.inspect}"<esc>F:"xPf{"xp
"log to java in cljs
nnoremap <Leader>jc "lyiwo(.log js/console <Esc>"lp
vnoremap <Leader>jc "lyo(.log js/console <Esc>"lp

"Refactoring (based on ecomba)
" convert symbol to key of hash
nnoremap <Leader>rh F:xepa<space>
nnoremap <leader>it :call InlineTemp()<CR>

" Synopsis:
" Inlines a variable
function! InlineTemp()
" Copy the variable under the cursor into the 'a' register
" XXX: How do I copy into a variable so I don't pollute the registers?
  let original_a = @a
  normal "ayiw

" It takes 4 diws to get the variable, equal sign, and surrounding
" whitespace. I'm not sure why. diw is different from dw in this
" respect.
  normal 4diw
" Delete the expression into the 'b' register
  let original_b = @b
  normal "bd$

" Delete the remnants of the line
  normal dd

" Store current line, that's where we will start searching from
  let current_line = line(".")

" Find the start and end of the current block
" TODO: tidy up if no matching 'def' found (start would be 0 atm)
  let [block_start, block_end] = common#get_range_for_block('\<def\|it\>','Wb')

" Rename the variable within the range of the block
  call common#gsub_all_in_range(current_line, block_end, '\<' . @a . '\>', @b)

" Put back original register contents
  let @a = original_a
  let @b = original_b
endfunction

"MATH
nnoremap <Leader>me a ∈<Esc>
nnoremap <Leader>mz a ℤ<Esc>

"Autosave changes to this file
autocmd! bufwritepost .vimrc source $MYVIMRC

"git
nnoremap <Leader>gr :Gread<CR>:w<CR>:Gstatus<CR>

"Clojure
autocmd FileType clojure,lisp let b:AutoClosePairs = AutoClose#ParsePairs("() [] {} ` \"")
nnoremap <Leader>dc "vyiw :call VimuxRunCommand("(doc " . @v . ")\n", 0)<CR>
"vnoremap <Leader>vt "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
"map <Leader>vs :call VimuxRunCommand("bundle exec rspec --tag ~js " . bufname("%"))<CR>
"Remove a layer of parentheses, leaving only last item
nnoremap <Leader>rp ds)dt(

"Markdown
"link
nnoremap <Leader>lk ysiw]f]a(
vnoremap <Leader>lk S]f]a(

"Gundo
nnoremap <Leader>gu :GundoToggle<CR>

"Play-clj
"Play-Clj ReLoad
nnoremap <Leader>pcrl :call VimuxRunCommand("(use 'our-first-game.core :reload)")<CR>
"Play-Clj ReStart
nnoremap <Leader>pcrs :call VimuxRunCommand("(on-gl (set-screen! our-first-game main-screen))")<CR>
nnoremap <Leader>pcrr :call VimuxRunCommand("(use 'our-first-game.core :reload) (on-gl (set-screen! our-first-game main-screen))")<CR>

au BufRead,BufNewFile {Capfile,Gemfile,Gemfile.lock,Rakefile,config.ru,} set ft=ruby
