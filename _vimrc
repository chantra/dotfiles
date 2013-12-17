"  Pathogen
call pathogen#infect()

" 
syntax on
set modeline
set number
set ruler
set background=dark
set sw=4 ts=4 sts=4 et 
set incsearch

" check that we have solarized theme installed
if !empty(globpath(&rtp, 'colors/solarized.vim'))
  set t_Co=256
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
  let g:solarized_visibility="low"
  "let g:solarized_bold=1
  let g:solarized_underline=1
  "let g:solarized_italic=1
  colorscheme solarized
endif

" finally, import local stuff if any
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif 

" Underline current line and add 80 char delimiter
if v:version > 700
    set cursorline
    hi CursorLine cterm=NONE,underline ctermbg=NONE
    if exists("+colorcolumn")
      set colorcolumn=80
    end
    hi! link CursorColumn CursorLine
endif
