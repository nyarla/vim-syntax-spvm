if exists('b:current_syntax')
  finish
endif

" SYNTAX
" ======

" Token
" -----
syntax match spvmLineBreak /;/ contained
syntax match spvmSymbol /\<\v[A-Z]((__)@![a-zA-Z0-9_])+(::((__)@![a-zA-Z0-9_])+)*\V\>/ contained

" Class Syntax
" ------------
syntax region   spvmClass         start=/class/ end=/;\@=/      contains=spvmSymbol,spvmClassAttrs,spvmLineBreak
syntax keyword  spvmClassScope    public private protected      nextgroup=spvmClassType,spvmClassPreProc,spvmLineBreak  contained
syntax keyword  spvmClassType     interface_t mulnum_t pointer  nextgroup=spvmClassPreProc,spvmLineBreak                contained
syntax keyword  spvmClassPreProc  precompile                    nextgroup=spvmLineBreak                                 contained
syntax region   spvmClassAttrs    start=/:/ end=/;\@=/          nextgroup=spvmClassScope,spvmClassType,spvmClassPreProc contained contains=spvmClassScope,spvmClassType,spvmClassPreProc

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

let b:current_syntax = 'spvm'
