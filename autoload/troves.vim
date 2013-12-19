" autoload/troves.vim
" Author:       Lowe Thiderman <lowe.thiderman@gmail.com>
" Github:       https://github.com/thiderman/vim-troves

if exists('g:autoloaded_troves') || &cp
  finish
endif
let g:autoloaded_troves = '0.1'

let s:cpo_save = &cpo
set cpo&vim

" Variables and setup {{{

if !exists('g:troves_url')
  let g:troves_url = 'https://pypi.python.org/pypi?%3Aaction=list_classifiers'
endif

if !exists('g:troves_cache')
  let g:troves_cache = '~/.cache/vim-troves/troves.txt'
endif
let g:troves_cache = expand(g:troves_cache)

" Make sure that the cache directory exists
let cachedir = fnamemodify(g:troves_cache, ':h')
if !isdirectory(cachedir)
  call mkdir(cachedir, 'p')
endif

" }}}
" Meat of the plugin {{{

function! troves#Init()
  let b:troves = troves#Load()
  set omnifunc=troves#TroveComplete
endfunction

function! troves#Load()
  if !filereadable(g:troves_cache)
    call troves#Download()
  endif

  " haha fak u emacs |o/
  let troves = readfile(g:troves_cache)
  let troves = map(troves, "substitute(v:val, 'Emacs', 'vim', '')")
  return troves
endfunction

function! troves#Download()
  " Downloads the troves in the background using curl
  silent exe "!curl --silent -o" g:troves_cache shellescape(g:troves_url, 1) '&'
endfunction

function! troves#TroveComplete(findstart, base)
  if a:findstart == 1
    return match(getline('.'), '^\W*\zs\w')
  else
    return filter(copy(b:troves), 'v:val =~ "^' . a:base . '"')
  endif
endfunction

" }}}

let &cpo = s:cpo_save
