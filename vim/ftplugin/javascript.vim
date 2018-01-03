nnoremap <buffer> <Leader>pt "xyiwoconsole.log(':', );<esc>F:"xPf)"xP
nnoremap <buffer> <Leader>pit "xyiwoconsole.log(':', JSON.stringify());<esc>F:"xPf)"xP
vnoremap <buffer> <Leader>pt "xyoconsole.log(':', );<esc>F:"xPf)"xP
vnoremap <buffer> <Leader>pit "xyoconsole.log(':', JSON.stringify());<esc>F:"xPf)"xP

" Add semicolon to line
nmap <leader>; m`A;<esc>``
inoremap <leader>; <C-o>m`<C-o>A;<C-o>``

nmap <leader>jf i(function () {<CR><space><space>'use strict';<CR><CR>})();<esc>

" Jasmine
nmap <leader>ds idescribe('', () => {<CR>});<esc>lxk0f'a
nmap <leader>it o<CR>it('', () => {<CR>});<esc>k0f'a

" npm
nnoremap <leader>nb :call VimuxRunCommand("npm run build")<CR>
nnoremap <leader>nt :call VimuxRunCommand("npm test")<CR>
nnoremap <leader>nw :call VimuxRunCommand("npm run test:watch")<CR>
