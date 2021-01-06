if exists('g:loaded_orgmode_nvim') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

function! OrgModeFoldText()
    return getline(v:foldstart) . "..."
endfunction

function! OrgModeInit()
    setlocal syntax=org
    setlocal foldmethod=syntax
    setlocal foldtext=OrgModeFoldText()
    setlocal fillchars=fold:\ 

    noremap <Tab> za
endfunction

autocmd BufNewFile,BufRead *.org :call OrgModeInit()

let &cpo=s:save_cpo
unlet s:save_cpo

let g:loaded_orgmode_nvim = 1
