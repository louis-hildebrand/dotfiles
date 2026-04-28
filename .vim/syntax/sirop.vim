" Sirop syntax file
" Author: Louis Hildebrand

if exists("b:current_syntax")
    finish
endif

syn keyword siropBasicKeyword if then else letstm let in accelerator const
syn keyword siropBasicKeyword vbuild sbuild init next stm ready sdata undefined default
syn keyword siropBasicKeyword assert yields

syn keyword siropConstant true false
syn match siropConstant '[0-9_]\+'
syn match siropConstant '[+-][0-9_]\+'

syn match siropIdent '[a-zA-Z_][a-zA-Z0-9_]*'

syn keyword siropType bool Stm Vec
syn match siropType 'u\d\+'
syn match siropType 'i\d\+'

syn match siropBuiltin 'pad\d\+'
syn match siropBuiltin 'truncate\d\+'
syn keyword siropBuiltin sign unsign
syn keyword siropBuiltin min max
syn keyword siropBuiltin VecLength
syn keyword siropBuiltin Vec2Stm        Stm2Vec
syn keyword siropBuiltin VecMap         StmMap
syn keyword siropBuiltin VecMap2        StmMap2
syn keyword siropBuiltin VecZip         StmZip
syn keyword siropBuiltin VecReduce      StmReduce
syn keyword siropBuiltin VecSplit       StmSplit
syn keyword siropBuiltin VecJoin        StmJoin
syn keyword siropBuiltin VecConcat      StmConcat
syn keyword siropBuiltin VecReverse
syn keyword siropBuiltin VecTranspose
syn keyword siropBuiltin VecRange       StmRange
syn keyword siropBuiltin                StmCount2D
syn keyword siropBuiltin                StmSlide
syn keyword siropBuiltin                StmSlideInit
syn keyword siropBuiltin                StmSlide2D
syn keyword siropBuiltin                StmAccess
syn keyword siropBuiltin                StmPrefix
syn keyword siropBuiltin                StmSuffix

syn region siropComment start='/\*' end='\*/' contains=siropComment

hi def link siropBasicKeyword   Keyword
hi def link siropType           Type
hi def link siropConstant       Constant
hi def link siropIdent          Special
hi def link siropComment        Comment
hi def link siropBuiltin        Identifier
