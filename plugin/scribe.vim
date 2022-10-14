if exists('g:loaded_scribe') 
  finish
endif " prevent loading file twice
" let s:save_cpo = &cpo " save user coptions
" set cpo&vim           " reset them to defaults

" command to run our plugin
command! -nargs=* ScribeOpen lua require("scribe").open(<f-args>)
command! ScribeFind lua require("scribe").find()

" let &cpo = s:save_cpo " and restore after
" unlet s:save_cpo
let g:loaded_scribe = 1

