"  Pathogen
call pathogen#infect()

" 
syntax on
set modeline
set number
set background=dark

" check that we have solarized theme installed
if !empty(globpath(&rtp, 'colors/solarized.vim'))
  set t_Co=256
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
  let g:solarized_visibility="low"
  "let g:solarized_bold=1
  ""let g:solarized_underline=1
  "let g:solarized_italic=1
  colorscheme solarized
endif

" finally, import local stuff if any
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif 
