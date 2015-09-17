" Puts out value of a variable below its definition
"pt = put
nnoremap <buffer> <Leader>pt "xyiwoputs ": #{}"<esc>F:"xPf{"xp 
nnoremap <buffer> <Leader>pit "xyiwoputs ": #{.inspect}"<esc>F:"xPf{"xp 
vnoremap <buffer> <Leader>pt "xyoputs ": #{}"<esc>F:"xPf{"xp
vnoremap <buffer> <Leader>pit "xyoputs ": #{.inspect}"<esc>F:"xPf{"xp
