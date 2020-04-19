if exists('b:current_syntax')
  finish
endif

syn match spvmClassName /\u\w\+\%(::\w\+\)*/ contained
syn match spvmFuncName /\w\+/ contained
syn match spvmPropName /\w\+/ contained
syn match spvmVarName /\w\+\%(::\w\+\)*/ contained
syn match spvmSigil /@\$\|[$@]/ contained contains=spvmDerefSigil

syn match spvmIntDecNum /\<\d\+\%(_\d\+\)*[lL]\?\>/
syn match spvmIntHexNum /\<0x\x\+\%(_\x\+\)*[lL]\?\>/
syn match spvmIntOctNum /\<0\o\+\%(_\o\+\)*[lL]\?\>/
syn match spvmIntBinNum /\<0b[01]\+\%(_[01]\+\)*[lL]\?\>/
syn match spvmConstant /__\%(END\|PACKAGE\|FILE\|LINE\)__/

syn match spvmCharSingle /\\\%([0abtnfr'\\]\|x\x\{2\}\)/ contained 
syn match spvmChar /\\\%([0abtnfrsSdDwW"\\]\|x\x\{2\}\|N{U+\x\+}\)/ contained

syn match spvmTypes /byte\|short\|int\|long\|float\|double\|void\|string\|object\|\%(callback\|pointer\|mulnum\)_t\|\u\w\+\%(::\w\+\)*/ contains=spvmClassName
syn keyword spvmTypes byte short int long float double void object callback_t pointer_t mulnum_t
syn keyword spvmDecorator public private allow precompile rw ro wo native 
syn keyword spvmOperator package use has sub new contained

syn region spvmBlock start=/{/ end=/}/ contains=TOP

syn match spvmClass /package\s\+\u\w\+\%(::\w\+\)*/ contains=spvmOperator,spvmClassName
syn match spvmClassExports /([a-zA-Z0-9_, ]\+)/ contains=spvmFuncName contained
syn match spvmUseClass /use\s\+[a-zA-Z0-9_:]\+\s*\%(([^)]*)\)\?/ contains=spvmOperator,spvmClassName,spvmClassExports
syn match spvmPropDef /has\s*[^ ]\+\s*/ contains=spvmOperator,spvmPropName
syn match spvmFuncDef /sub\s*\%([^ ]\+\)*\s*:/ contains=spvmOperator,spvmFuncName
syn match spvmVar /[@$]\{0,2\}[a-zA-Z_:]\+\%(\%(->\)*[^ ;"']\+\)*/ contains=spvmSigil,spvmVarName,spvmAllowDeRef,spvmAllowBracket
syn match spvmNewInstance /new\s\+[^(;\[]\+/ contains=spvmOperator,spvmClassName,spvmTypes
syn region spvmStringSingle start=/\'/ skip=/\\'/ end=/\'/ contains=spvmCharSingle
syn region spvmString start=/"/ skip=/\\"/ end=/"/ contains=spvmChar,spvmVar
syn match spvmFuncCall /\w\+(\@=/ contains=spvmFuncName

syn keyword spvmConditional if else elsif unless switch
syn keyword spvmEnumDef enum
syn keyword spvmVarDef my our
syn match spvmAllowDeRef /->/ contained
syn match spvmAllowBracket /{[^ }]\+}\|\[[^ \]]\+\]\|\w\+/ contains=spvmVarName,spvmIntDecNum,spvmIntHexNum,spvmIntOctNum,spvmIntBinNum contained
syn keyword spvmCompareStr eq gt ge lt le ne 
syn match spvmCompareNum /==\|<=\|>=\|!=\|&&\|||/

syn keyword spvmRepeat for while last next
syn keyword spvmCoreOperator print weaken isweak undef return BEGIN eval self length
syn keyword spvmLabel case default break

syn keyword spvmException die warn

syn match spvmError /__/

syn match spvmComment /#.*/
syn region spvmPOD start=/\^=.*/ end=/\^=cut$/

hi def link spvmError Error

hi def link spvmEnumDef Operator
hi def link spvmVarDef Operator
hi def link spvmInstance Operator
hi def link spvmConditional Conditional
hi def link spvmRepeat Repeat
hi def link spvmCoreOperator Operator
hi def link spvmLabel Label 
hi def link spvmException Exception
hi def link spvmAllowDeRef Operator
hi def link spvmAllowBracket Keyword
hi def link spvmCompareStr Operator
hi def link spvmCompareNum Operator
hi def link spvmSigil Type

hi def link spvmIntDecNum Number
hi def link spvmIntHexNum Number
hi def link spvmIntOctNum Number
hi def link spvmIntBinNum Number
hi def link spvmConstant Costant

hi def link spvmString String
hi def link spvmStringSingle String
hi def link spvmChar Character
hi def link spvmCharSingle Character
hi def link spvmFuncCall Function

hi def link spvmClassName Identifier
hi def link spvmFuncName Function
hi def link spvmPropName Identifier
hi def link spvmVarName Identifier
hi def link spvmSigil Type 
hi def link spvmOperator Operator
hi def link spvmTypes Type
hi def link spvmDecorator Statement

hi def link spvmComment Comment
hi def link spvmPOD SpecialComment

let b:current_syntax = 'spvm'
