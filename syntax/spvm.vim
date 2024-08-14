if exists('b:current_syntax')
  finish
endif

" SYNTAX
" ======

" Token
" -----
syntax match spvmLineBreak /;/ contained
syntax match spvmSymbol /\<\v[A-Z]((__)@![a-zA-Z0-9_])*(::((__)@![a-zA-Z0-9_])+)*\V\>/ contained

syntax match  spvmVersionNumber /\v(\d{1,}|\d{1,}\.\d{3}|\d{1,}\.(\d{3}){2})/ contained
syntax region spvmVersionString start=/"/ end=/"/ contains=spvmVersionNumber  contained

" Class Syntax
" ------------
syntax region   spvmClass         start=/class/ end=/;\@=/      nextgroup=spvmClassBlock,spvmLineBreak                            contains=spvmSymbol,spvmClassAttrs,spvmClassBlock,spvmLineBreak
syntax keyword  spvmClassScope    public private protected      nextgroup=spvmClassType,spvmClassPreProc,spvmLineBreak  contained
syntax keyword  spvmClassType     interface_t mulnum_t pointer  nextgroup=spvmClassPreProc,spvmLineBreak                contained
syntax keyword  spvmClassPreProc  precompile                    nextgroup=spvmLineBreak                                 contained
syntax region   spvmClassAttrs    start=/:/ end=/[;{]\@=/       nextgroup=spvmClassScope,spvmClassType,spvmClassPreProc contained contains=spvmClassScope,spvmClassType,spvmClassPreProc

syntax region   spvmClassBlock    start=/{/       end=/}/       contains=spvmClassVersion,spvmClassUse,spvmClassAlias
syntax region   spvmClassVersion  start=/version/ end=/;/       contains=spvmVersionString

syntax region   spvmClassUse      start=/use/     end=/;/       contains=spvmSymbol,spvmClassUseAs
syntax region   spvmClassAlias    start=/alias/   end=/;/       contains=spvmSymbol,spvmClassUseAs
syntax region   spvmClassUseAs    start=/as/      end=/;\@=/    contains=spvmSymbol

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

hi def link   spvmClassVersion  Statement
hi def link   spvmVersionString String
hi def link   spvmVersionNumber Number

hi def link   spvmClassUse      Statement
hi def link   spvmClassAlias    Statement
hi def link   spvmClassUseAs    Statement

let b:current_syntax = 'spvm'
