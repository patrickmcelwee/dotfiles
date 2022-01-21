nnoremap <buffer> <Leader>pt "xyiwoconsole.log(':', );<esc>F:"xPf)"xPA // eslint-disable-line
nnoremap <buffer> <Leader>pit "xyiwoconsole.log(':', JSON.stringify());<esc>F:"xPf)"xPA // eslint-disable-line
vnoremap <buffer> <Leader>pt "xyoconsole.log(':', );<esc>F:"xPf)"xPA // eslint-disable-line
vnoremap <buffer> <Leader>pit "xyoconsole.log(':', JSON.stringify());<esc>F:"xPf)"xPA // eslint-disable-line

" Add semicolon to line
nmap <leader>; m`A;<esc>``
inoremap <leader>; <C-o>m`<C-o>A;<C-o>``

nmap <leader>jf i(function () {<CR><space><space>'use strict';<CR><CR>})();<esc>

" Jasmine
nmap <leader>ds idescribe('', () => {<CR>});<esc>lxk0f'a
nmap <leader>it o<CR>it('', () => {<CR>});<esc>k0f'a

nnoremap gp mm :silent %!./node_modules/.bin/prettier --stdin-filepath %<CR>`m
