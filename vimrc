" neo bundle
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" generic
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'rking/ag.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'scrooloose/syntastic'
" git
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
" clojure
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'vim-scripts/paredit.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
"NeoBundle 'venantius/vim-cljfmt'
"NeoBundle 'venantius/vim-eastwood'
" gradle
NeoBundle 'tfnico/vim-gradle'
" Markdown, reStructuredText
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
" Ansible
NeoBundle 'chase/vim-ansible-yaml'

call neobundle#end()

NeoBundleCheck

" general setings
syntax on
filetype indent plugin on
set smartindent
set ambiwidth=double
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set directory=~/.vim/swap
set number
set list
set listchars=tab:>-,trail:.

" unite
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,r :<C-u>UniteResume search-buffer<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" airline
set laststatus=2

" git
let g:gitgutter_sign_column_always = 1

" indent
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

function! s:ConfigureClojure()
  setlocal fileformat=unix fileencoding=utf-8
  let g:clojure_fuzzy_indent_patterns +=
  \ ['-for$', '^complex$', '^go-loop$',
  \  '^ANY$', '^GET$', '^POST$', '^PUT$', '^DELETE$']
  let g:clojure_align_subforms = 1
  let g:clojure_multiline_strings = 1
endfunction

augroup vimrc
  autocmd!
  autocmd BufRead,BufNewFile *.clj,*.cljs,*.cljs.hl call s:ConfigureClojure()
  autocmd FileType scheme
  \ setlocal lispwords+=define-method,define-module,let-keywords
  autocmd BufRead,BufNewFile *.java,*.py,*.gradle
  \ setlocal fileformat=unix fileencoding=utf-8 shiftwidth=4 expandtab
  autocmd BufRead,BufNewFile *.xml,*.html
  \ setlocal fileformat=unix fileencoding=utf-8 shiftwidth=2 expandtab
augroup END
