set number
set relativenumber
set tabstop=4
set shiftwidth=4
set autoindent
set mouse=a
colorscheme slate

set linespace=43

" Custom mapping for the left arrow key

" Custom mappings for the left arrow key and 'H' key
nnoremap <Left> :call MoveLeftOrH('Left')<CR>
nnoremap H :call MoveLeftOrH('H')<CR>

function! MoveLeftOrH(key)
  " Check if the cursor is at the beginning of the line
  if col('.') == 1
    " Move to the end of the line above
    if line('.') > 1
      normal! k$
    endif
  else
    " Move cursor one character to the left for <Left> key
    " or to the first non-blank character for 'H' key
    if a:key == 'Left'
      normal! h
    elseif a:key == 'H'
      normal! ^
    endif
  endif
endfunction
