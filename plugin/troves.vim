" autoload/troves.vim
" Author:       Lowe Thiderman <lowe.thiderman@gmail.com>
" Github:       https://github.com/thiderman/vim-troves

if exists('g:loaded_troves') || &cp || v:version < 700 || !executable('curl')
  finish
endif
let g:loaded_troves = 1

let s:cpo_save = &cpo
set cpo&vim

augroup troves
  au!
  au BufEnter setup.py call troves#Init()
  au InsertLeave setup.py call troves#AutoCut()

  au BufEnter troves.txt call troves#BrowserInit()
augroup END

let &cpo = s:cpo_save
