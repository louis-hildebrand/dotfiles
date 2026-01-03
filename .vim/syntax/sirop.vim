" Sirop syntax file
" Author: Louis Hildebrand

if exists("b:current_syntax")
    finish
endif

syn keyword siropBasicKeyword if then else letstm let in
syn keyword siropBasicKeyword vbuild sbuild init next stm ready sdata undefined

syn match siropIdent '[a-zA-Z_][a-zA-Z_]*'

syn keyword siropConstant true false
syn match siropConstant '[0-9_]\+'
syn match siropConstant '[+-][0-9_]\+'

syn keyword siropType bool Stm Vec
syn match siropType 'u\d\+'
syn match siropType 'i\d\+'

syn match siropBuiltin 'pad\d\+'
syn match siropBuiltin 'truncate\d\+'
syn keyword siropBuiltin sign
syn keyword siropBuiltin unsign

syn region siropComment start='/\*' end='\*/' contains=siropComment

hi def link siropBasicKeyword   Keyword
hi def link siropType           Type
hi def link siropConstant       Constant
hi def link siropIdent          Identifier
hi def link siropComment        Comment
hi def link siropBuiltin        Special
