if exists("b:current_syntax")
    finish
endif

syntax match OrgTitle "^\*[^\*].\+$"
syntax region OrgTitleFold start="^\*[^\*].\{-1,}" end="\(^\*[^\*]\)\@=" transparent fold

syntax match SubOrgTitle "^\*\*[^\*].\+$"
syntax region SubOrgTitleFold start="^\*\*[^\*].\{-1,}" end="\(^\*\*\?[^\*]\)\@=" transparent fold

syntax match SubSubOrgTitle "^\*\*\*[^\*].\+$"
syntax region SubSubOrgTitleFold start="^\*\*\*[^\*].\{-1,}" end="\(^\*\*\?\*\?[^\*]\)\@=" transparent fold

syntax match SubSubSubOrgTitle "^\*\*\*\*[^\*].\+$"
syntax region SubSubOrgTitleFold start="^\*\*\*\*[^\*].\{-1,}" end="\(^\*\*\?\*\?\*\?[^\*]\)\@=" transparent fold

let b:current_syntax = "org"
