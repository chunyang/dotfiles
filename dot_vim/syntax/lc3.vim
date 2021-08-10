" Vim syntax file
" Language: LC3 Assembly
" Maintainer: Chun Yang <x@cyang.info>
" Last Change: 2012 Nov 9

if exists("b:current_syntax")
  finish
endif

syn case ignore

" LC3 instructions
syn keyword lc3ISA add and not
syn keyword lc3ISA br brn brz brp brnz brzp brnp brnzp
syn keyword lc3ISA jmp jsr jsrr ret
syn keyword lc3ISA ld ldi ldr lea
syn keyword lc3ISA st sti str
syn keyword lc3ISA rti trap

" LC3 traps
syn keyword lc3Trap getc out puts in putsp halt

" LC3 assembler directives
syn match lc3Directive /\(^\|\s\)\@<=\.\(orig\|fill\|blkw\|stringz\|end\)\>/

" LC3 registers
syn keyword lc3Register R0 R1 R2 R3 R4 R5 R6 R7

" LC3 Numbers
syn match lc3Number "#\=-\=\(\<\d*\>\|\<[134]\=x[0-9a-f]*\>\)"

" LC3 Strings
syn region lc3String start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=lc3StringSpecial
syn match lc3StringSpecial /\\./ contained

" LC3 comments
syn match lc3Comment ";.*$" contains=lc3Todo

" LC3 todo
syn keyword lc3Todo TODO FIXME XXX DEBUG NOTE contained

hi def link lc3ISA          Statement
hi def link lc3Trap         Statement
hi def link lc3Directive    PreProc
hi def link lc3Register     Identifier
hi def link lc3Number       Number
hi def link lc3String       String
hi def link lc3StringSpecial SpecialChar
hi def link lc3Comment      Comment
hi def link lc3Todo         Todo

let b:current_syntax = "lc3"

