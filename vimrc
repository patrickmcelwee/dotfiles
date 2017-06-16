set nocompatible
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set diffopt=vertical,filler
silent! set relativenumber
silent! set number
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin  'gmarik/Vundle.vim'
" Plugin  'tpope/vim-rails.git'
Plugin  'tpope/vim-fugitive.git'
"Plugin 'scrooloose/nerdtree.git' # corrupting characters
Plugin  'tpope/vim-endwise.git'
Plugin  'tpope/vim-surround.git'
Plugin  'Townk/vim-autoclose'
"Plugin 'vim-scripts/slimv.vim'
"Plugin  'kchmck/vim-coffee-script'
"Plugin 'tpope/vim-haml'
Plugin  'altercation/vim-colors-solarized'
Plugin  'kien/ctrlp.vim'
Plugin  'benmills/vimux'
" Plugin  'mattn/emmet-vim'
"Plugin  'scrooloose/nerdcommenter.git'
Plugin  'tpope/vim-commentary'
Plugin  'jwhitley/vim-matchit.git'
"Plugin  'tpope/vim-fireplace'
" Plugin  'guns/vim-clojure-static'
Plugin  'groenewege/vim-less'
"Plugin  'mattpap/vim-owl-tools'
" Plugin  'derekwyatt/vim-scala'
"Plugin  'digitaltoad/vim-jade'
Plugin  'raymond-w-ko/vim-niji'
Plugin  'sjl/gundo.vim'
Plugin  'niklasl/vim-rdf'
Plugin 'Omer/vim-sparql'
" Plugin 'patrickmcelwee/sonicpi.vim'
Plugin 'othree/xml.vim'
Plugin 'vim-syntastic/syntastic'
" Plugin 'Shutnik/jshint2.vim'
Plugin 'reedes/vim-pencil'
Plugin 'jeroenp/vim-xquery-syntax'
Plugin 'leafgarland/typescript-vim'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_html_tidy_ignore_errors=["proprietary attribute", "is not recognized!", "discarding unexpected"]
let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "passive_filetypes": ["html"] }

nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lN :lNext<CR>
nnoremap <leader>ll :ll<CR>

" let g:sonicpi_keymaps_enabled = 0
" nnoremap <leader>P :silent w !sonic_pi<CR>
" inoremap <C-p> <C-O>:silent w !sonic_pi<CR>
" nnoremap <leader>S :call system("sonic_pi stop")<CR>
" inoremap <C-Space> <C-x><C-o>
" inoremap <C-@> <C-x><C-o>
" inoremap <C-j> <C-n>
" inoremap <C-k> <C-p>

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
nmap <silent> <Leader>dg :diffget<CR>

vmap <silent> <Leader>' :<C-U>call YankToClipboard(visualmode(), 1)<CR>
nmap <silent> <Leader>' :set opfunc=YankToClipboard<CR>g@

" For some reason, having to do this recently in Vim
nmap <silent> <Leader>rd :redraw!<CR>

function! YankToClipboard(type, ...)
  let sel_save = &selection
  let &selection = "inclusive" "To yank the right text in Visual mode

  if a:0 " Invoked from visual mode "
    silent exe "normal! `<" . a:type . "`>\"+y"
  elseif a:type == 'line'
    silent exe "normal! '[V']\"+y"
  else
    silent exe "normal! `[v`]\"\+y"
  endif

  let &selection = sel_save
endfunction

set background=dark
colorscheme solarized

" Ctrl-P
nnoremap <Leader>f :CtrlP <CR>
nnoremap <Leader>b :CtrlPBuffer <CR>
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<c-f>'] }
"exclude source and compiled files (put in target/ by scala)
let g:ctrlp_custom_ignore = '\v/(\.git|\.build|target|out|classes|gen|log|data)$'
"map <Leader>gdm :CommandTFlush<CR>\|:CommandT lib/duke_vivo_mapper/maps<CR>
"map <Leader>gdr :CommandTFlush<CR>\|:CommandT lib/duke_vivo_mapper/resources<CR>
"map <Leader>gds :CommandTFlush<CR>\|:CommandT lib/duke_vivo_mapper/sources<CR>
"map <Leader>gdd :CommandTFlush<CR>\|:CommandT lib/duke_vivo_mapper/models<CR>

nnoremap <Leader>jc :!javac % <CR>
let g:user_emmet_leader_key='<C-Z>'

" Switch to last window
nnoremap <Leader><Leader> <C-^>

"Open this rc file
nnoremap <Leader>rc :e ~/dotfiles/vimrc<CR>

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

"MarkLogic
nmap <Leader>dr :call VimuxRunCommand("./ml local deploy rest")<CR>
nmap <Leader>dm :call VimuxRunCommand("./ml local deploy modules")<CR>
nmap <Leader>dd :call VimuxRunCommand("./ml local deploy_data")<CR>
nmap <Leader>db :call VimuxRunCommand("./ml local bootstrap")<CR>

"gulp
nmap <Leader>gg :call VimuxRunCommand("gulp")<CR>
nmap <Leader>gt :call VimuxRunCommand("gulp test")<CR>

"XMLSH
nmap <Leader>xml :call VimuxRunCommand("xmlsh")<CR>
  \ :call VimuxRunCommand("import module ml=marklogic")<CR>
  \ :call VimuxRunCommand("MLCONNECT=xcc://admin:admin@db:8000/Documents")<CR>
nnoremap <Leader>xq :call VimuxRunCommand("ml:query -f " . bufname('%') . "\n", 0)<CR>

au BufNewFile,BufRead *.sjs set filetype=javascript

autocmd FileType xquery setlocal commentstring=(:%s:)

" Run all rspec specs
nnoremap <Leader>va :call VimuxRunCommand("JRUBY_OPTS='$JRUBY_OPTS -J-XX:MaxPermSize=112m' bundle exec rspec spec")<CR>
" Run all rspec model specs
nnoremap <Leader>vm :call VimuxRunCommand("rspec spec/models")<CR>
" Run all rspec controller specs
nnoremap <Leader>vc :call VimuxRunCommand("rspec spec/models")<CR>

"Vimux
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

"Run all tests
nnoremap <Leader>rt :call VimuxRunCommand("bundle exec rake test")<CR>
"Run all specs with minitest
nnoremap <Leader>ma :call VimuxRunCommand("ruby -Itest -rminitest/pride spec/specs.rb")<CR>

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
  autocmd FileType text setlocal formatoptions=tcq
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
set shortmess=AIlw " Do not warn of existing swap file or show intro
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

"log to java in cljs
nnoremap <Leader>jc "lyiwo(.log js/console <Esc>"lp
vnoremap <Leader>jc "lyo(.log js/console <Esc>"lp

"MATH
nnoremap <Leader>me a ∈<Esc>
nnoremap <Leader>mz a ℤ<Esc>

"Autosave changes to this file
autocmd! bufwritepost .vimrc source $MYVIMRC
autocmd! bufwritepost vimrc source $MYVIMRC

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
nnoremap <Leader>lk lbi[<esc>ea]<Esc>a()<esc>i
vnoremap <Leader>lk "zdi[]<esc>Pla()<esc>i

"Gundo
nnoremap <Leader>gu :GundoToggle<CR>

"Play-clj
"Play-Clj ReLoad
nnoremap <Leader>pcrl :call VimuxRunCommand("(use 'our-first-game.core :reload)")<CR>
"Play-Clj ReStart
nnoremap <Leader>pcrs :call VimuxRunCommand("(on-gl (set-screen! our-first-game main-screen))")<CR>
nnoremap <Leader>pcrr :call VimuxRunCommand("(use 'our-first-game.core :reload) (on-gl (set-screen! our-first-game main-screen))")<CR>

au BufRead,BufNewFile {Capfile,Gemfile,Gemfile.lock,Rakefile,config.ru,} set ft=ruby
au BufNewFile,BufRead *.gradle set ft=groovy
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

nnoremap <Leader>1 :set norelativenumber! nonumber!<CR>

let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END
let g:markdown_fenced_languages = ['html', 'xml', 'javascript', 'xquery', 'python', 'ruby', 'bash=sh']
