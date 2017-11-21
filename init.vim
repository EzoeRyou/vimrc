set expandtab
set tabstop=4
set shiftwidth=4

set mouse=a
set autowrite


filetype indent off
set laststatus=1
set guicursor=


set showcmd
set showmatch
set incsearch
set hlsearch

set t_Co=256
"set bg=dark
set bg=light


set go-=T
set guifont=Monospace\ 18

" Escape/unescape & < > HTML entities in range (default current line).
function! HtmlEntities(line1, line2, action)
  let search = @/
  let range = 'silent ' . a:line1 . ',' . a:line2
  if a:action == 0  " must convert &amp; last
    execute range . 'sno/&lt;/</eg'
    execute range . 'sno/&gt;/>/eg'
    execute range . 'sno/&amp;/&/eg'
  else              " must convert & first
    execute range . 'sno/&/&amp;/eg'
    execute range . 'sno/</&lt;/eg'
    execute range . 'sno/>/&gt;/eg'
  endif
  nohl
  let @/ = search
endfunction
command! -range -nargs=1 Entities call HtmlEntities(<line1>, <line2>, <args>)
noremap <silent> \H :Entities 0<CR>
noremap <silent> \h :Entities 1<CR>

command! Copyarticle execute "55,$-10y+"
command! Copytitle execute "52y+"
command! Replaceurl execute "51s%url%" . @+ . "%"

" map Up and Down keys to gj/gk
noremap <Up> gk
noremap <Down> gj
inoremap <Up> <C-o>gk
inoremap <Down> <C-o>gj
