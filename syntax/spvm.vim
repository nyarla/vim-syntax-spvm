if exists('b:current_syntax')
  finish
endif

" SYNTAX
" ======

" Token
" -----
syntax match spvmLineBreak /;/ contained

" Class Syntax
" ------------
syntax match    spvmClassSymbol         /\<\v[A-Z]((__)@![a-zA-Z0-9_])*(::((__)@![a-zA-Z0-9_])+)*\V\>/
syntax match    spvmClassVersionNumber  /\v(\d{1,}|\d{1,}\.\d{3}|\d{1,}\.(\d{3}){2})/       contained
syntax region   spvmClassVersionString  start=/"/ end=/"/ contains=spvmClassVersionNumber   contained

syntax region   spvmClass         start=/class/ end=/[;{]\@=/      nextgroup=spvmClassBlock,spvmLineBreak contains=spvmClassSymbol,spvmClassExtends,spvmClassAttrs,spvmClassBlock,spvmLineBreak
syntax keyword  spvmClassExtends  extends contained
syntax keyword  spvmClassScope    public private protected      nextgroup=spvmClassType,spvmClassPreProc,spvmLineBreak  contained
syntax keyword  spvmClassType     interface_t mulnum_t pointer  nextgroup=spvmClassPreProc,spvmLineBreak                contained
syntax keyword  spvmClassPreProc  precompile                    nextgroup=spvmLineBreak                                 contained
syntax region   spvmClassAttrs    start=/:/ end=/[;{]\@=/       nextgroup=spvmClassScope,spvmClassType,spvmClassPreProc contained contains=spvmClassScope,spvmClassType,spvmClassPreProc

syntax region   spvmClassBlock    start=/{/       end=/}/       contains=spvmClassVersion,spvmClassUse,spvmClassAlias,spvmClassAllow
syntax region   spvmClassVersion  start=/version/ end=/;/       contains=spvmClassVersionString contained

syntax region   spvmClassUse      start=/use/     end=/;/       contains=spvmClassSymbol,spvmClassUseAs contained
syntax region   spvmClassAlias    start=/alias/   end=/;/       contains=spvmClassSymbol,spvmClassUseAs contained
syntax region   spvmClassUseAs    start=/as/      end=/;\@=/    contains=spvmClassSymbol contained

syntax region   spvmClassAllow    start=/allow/   end=/;/       contains=spvmClassSymbol contained

" HIGHLIGHT
" =========

" Token
" -----
hi def link   spvmSymbol  Identifier

" Class Syntax
" ------------
hi def link   spvmClass         Structure
hi def link   spvmClassScope    StorageClass
hi def link   spvmClassType     Type
hi def link   spvmClassPreProc  PreProc

hi def link   spvmClassVersion        Statement
hi def link   spvmClassVersionString  String
hi def link   spvmClassVersionNumber  Number

hi def link   spvmClassUse      Statement
hi def link   spvmClassAlias    Statement
hi def link   spvmClassUseAs    Statement
hi def link   spvmClassAllow    Statement
hi def link   spvmClassExtends  Statement

let b:current_syntax = 'spvm'
