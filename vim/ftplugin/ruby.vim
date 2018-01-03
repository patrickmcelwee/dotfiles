" Puts out value of a variable below its definition
"pt = put
nnoremap <buffer> <Leader>pt "xyiwoputs ": #{}"<esc>F:"xPf{"xp 
nnoremap <buffer> <Leader>pit "xyiwoputs ": #{.inspect}"<esc>F:"xPf{"xp 
vnoremap <buffer> <Leader>pt "xyoputs ": #{}"<esc>F:"xPf{"xp
vnoremap <buffer> <Leader>pit "xyoputs ": #{.inspect}"<esc>F:"xPf{"xp

"Ruby Refactoring (based on ecomba)
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

" Run the current file with rspec, excluding js specs
nnoremap <Leader>vs :call VimuxRunCommand("bundle exec rspec --color --tag ~js " . bufname("%"))<CR>
" Run the current spec with rspec, including js specs
nnoremap <Leader>vjs :call VimuxRunCommand("JRUBY_OPTS='$JRUBY_OPTS -J-Xmx2024m -J-XX:MaxPermSize=112m' bundle exec rspec " . bufname("%"))<CR>
" Run the current spec with rspec
nnoremap <Leader>vo :call VimuxRunCommand("JRUBY_OPTS='$JRUBY_OPTS -J-Xmx2024m -J-XX:MaxPermSize=112m' bundle exec rspec " . expand("%p") . ":" . line("."))<CR>

"Run the current file with test_unit
nnoremap <Leader>ru :call VimuxRunCommand("ruby -Itest " . bufname("%"))<CR>
"Run the current spec with test_unit
nnoremap <Leader>ro :call VimuxRunCommand("ruby " . expand("%p") . ":" . line("."))<CR>

"Run the current file with minitest
nnoremap <Leader>ms :call VimuxRunCommand("ruby -Itest -rminitest/pride " . bufname("%"))<CR>

"IRB
"Load the current file in ruby
"Make this harder to do
nnoremap <Leader>+lf :call VimuxRunCommand("load \'" . bufname("%") . "\'")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRACT METHOD Ruby
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
