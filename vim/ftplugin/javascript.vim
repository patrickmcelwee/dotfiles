nnoremap <buffer> <Leader>pt "xyiwoconsole.log(': ' + );<esc>F:"xPf)"xP
nnoremap <buffer> <Leader>pit "xyiwoconsole.log(': ' + JSON.stringify());<esc>F:"xPf)"xP
vnoremap <buffer> <Leader>pt "xyoconsole.log(': ' + );<esc>F:"xPf)"xP
vnoremap <buffer> <Leader>pit "xyoconsole.log(': ' + JSON.stringify());<esc>F:"xPf)"xP

" Add semicolon to line
nmap <leader>; m`A;<esc>``
inoremap <leader>; <C-o>m`<C-o>A;<C-o>``
