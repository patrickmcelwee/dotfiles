nnoremap gp mm :silent %!./node_modules/.bin/prettier --stdin-filepath %<CR>`m

nnoremap gf :%s/\(\d\)\/\(\d\)/\1\&frasl;\2/<CR>
