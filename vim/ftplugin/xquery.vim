setlocal smartindent

nnoremap <buffer> <Leader>pt "xyiWolet $_ := xdmp:log((": ", ))<esc>F:"xPf)"xP 
vnoremap <buffer> <Leader>pt "xyolet $_ := xdmp:log((": ", ))<esc>F:"xPf)"xP 
