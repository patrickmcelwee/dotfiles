imap <Leader>vt <Esc>mz<Leader>vtg`zl
map <Leader>cr :call VimuxRunCommand("lein repl")<CR>

"For Speclj
setlocal lispwords+=describe
setlocal lispwords+=it
setlocal lispwords+=around
setlocal lispwords+=should=
setlocal lispwords+=should-throw

"For Om
setlocal lispwords+=dom/div
setlocal lispwords+=dom/h1
setlocal lispwords+=dom/h2
setlocal lispwords+=dom/h3
setlocal lispwords+=dom/h4
setlocal lispwords+=dom/p
setlocal lispwords+=dom/form
setlocal lispwords+=dom/label
setlocal lispwords+=dom/input
setlocal lispwords+=dom/textarea
