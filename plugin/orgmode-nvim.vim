if exists('g:loaded_orgmode_nvim') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

function! OrgModeToggleSection()
    " A custom folding method to make sure that section folding works like it
    " does in orgmode:
    "
    "   - You have to be on the title line
    "   - Pressing fold from inside a section doesn't fold the entire section
    "
    let header_level = 0
    let line = getline(".")
    for s:c in split(line, '\zs')
        if s:c == '*'
            let header_level += 1
        else
            break
        endif
    endfor

    if header_level == 0
        return
    endif

    let fold_level = foldlevel(".")
    if fold_level < header_level
        return
    endif

    if fold_level == 0
        return
    endif

    let closed = foldclosed(".")
    if closed != -1
        foldopen
    else
        foldclose
    endif
endfunction

function! OrgModeFoldText()
    return getline(v:foldstart) . "..."
endfunction

function! OrgModeInit()
    setlocal syntax=org
    setlocal foldmethod=syntax
    setlocal foldtext=OrgModeFoldText()
    setlocal fillchars=fold:\ 

    noremap <silent> <Tab> :call OrgModeToggleSection()<CR>
endfunction

autocmd BufNewFile,BufRead *.org :call OrgModeInit()

let &cpo=s:save_cpo
unlet s:save_cpo

let g:loaded_orgmode_nvim = 1
