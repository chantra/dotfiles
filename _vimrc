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

" syntax check
if !empty(globpath(&rtp, 'plugin/syntastic.vim'))
    let g:syntastic_python_checkers = ['pyflakes', 'pep8']
    let g:syntastic_ruby_checkers          = ['rubocop']
endif

" airline
if !empty(globpath(&rtp, 'plugin/airline.vim'))
    set laststatus=2
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme='powerlineish'
endif

" vim-instant-markdown
if !empty(globpath(&rtp, 'after/ftplugin/markdown/instant-markdown.vim'))
    " Do not autoload, use :InstantMarkdownPreview instead
    let g:instant_markdown_autostart = 0
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

" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" GO files
au FileType go set noet

" spaces indentation for YAML files
au FileType yaml setl sw=2 ts=2 sts=2 et
