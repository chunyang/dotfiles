" Vim syntax file
" Language: Pig
" Maintainer: Sergiy Matusevych <motus2@yahoo.com>
" Last Change: 2012 July 5

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Pig keywords
syn keyword pigKeyword cogroup cross define distinct filter foreach group
syn keyword pigKeyword import join limit load mapreduce order sample split
syn keyword pigKeyword store stream union

syn keyword pigKeyword arrange flatten
syn keyword pigKeyword into if all any as onschema
syn keyword pigKeyword by using inner outer partition parallel left right
syn keyword pigKeyword continuously window tuples generate eval
syn keyword pigKeyword input output ship cache through
syn keyword pigKeyword seconds minutes hours asc desc null full outer

syn keyword pigType bag boolean bytearray chararray
syn keyword pigType double int float long map tuple 

syn keyword pigOperator and or not eq neq gt lt gte lte matches is
"syn keyword pigOperator ? : == != > >= < <= + - % * /

syn match pigFunction "\<\a\w*\s*(" contains=pigFunctionName

syn case match

" Built In Eval Functions
syn keyword pigFunctionName AVG CONCAT COUNT COUNT_STAR contained
syn keyword pigFunctionName DIFF IsEmpty MAX MIN SIZE SUM TOKENIZE contained

" Built In Load/Store Functions
syn keyword pigFunctionName BinStorage PigDump PigStorage TextLoader contained

" Built In Math Functions
syn keyword pigFunctionName ABS ACOS ASIN ATAN CBRT CEIL COS COSH contained
syn keyword pigFunctionName EXP FLOOR LOG LOG10 RANDOM ROUND SIN contained
syn keyword pigFunctionName SINH SQRT TAN TANH contained

" Built In String Functions
syn keyword pigFunctionName INDEXOF LAST_INDEX_OF LCFIRST LOWER contained
syn keyword pigFunctionName REGEX_EXTRACT REGEX_EXTRACT_ALL REPLACE contained
syn keyword pigFunctionName STRSPLIT SUBSTRING TRIM UCFIRST UPPER contained

" Built In Bag and Tuple Functions
syn keyword pigFunctionName TOBAG TOP TOTUPLE contained

syn match pigAssignVar "^\s*\a\w*\s*=[^=]" contains=pigAssignEq
syn match pigAssignEq  "=" contained

syn match pigSpecial "#"
syn match pigSpecial "\(\zs\s*[*]\s*\ze\)\@>\W"

syn match pigGrunt "^\s*\(cat\|cd\|cp\|copyFromLocal\|copyToLocal\|define\|dump\|illustrate\|describe\|explain\|help\|kill\|ls\|mv\|mkdir\|pwd\|quit\|register\|rm\|set\)\>.*$" contains=pigGruntCmd,pigRegisterKeyword,pigComment,pigString
syn match pigGruntCmd "^\s*\(cat\|cd\|cp\|copyFromLocal\|copyToLocal\|define\|dump\|illustrate\|describe\|explain\|help\|kill\|ls\|mv\|mkdir\|pwd\|quit\|rm\|set\)\>" contained
syn match pigRegisterKeyword "^\s*register\>" contained

" Strings and characters:
syn region pigString		start=+"+  skip=+\\\\\|\\"+  end=+"+ contains=pigDollarVar
syn region pigString		start=+'+  skip=+\\\\\|\\'+  end=+'+ contains=pigDollarVar
syn region pigString		start=+`+  skip=+\\\\\|\\`+  end=+`+ contains=pigDollarVar

" Dollar variables:
syn match pigDollarIdx "$\d\+"
syn match pigDollarVar "\$\h\w*"

" Preprocessor
syn match pigPreCondit "^\s*%\(default\|declare\)"

" Numbers:
syn match  pigNumber "[-+]\=\(\<\d[[:digit:]_]*L\=\>\|0[xX]\x[[:xdigit:]_]*\>\)"
syn match  pigFloat  "[-+]\=\<\d[[:digit:]_]*[eE][\-+]\=\d\+"
syn match  pigFloat  "[-+]\=\<\d[[:digit:]_]*\.[[:digit:]_]*\([eE][\-+]\=\d\+\)\="
syn match  pigFloat  "[-+]\=\<\.[[:digit:]_]\+\([eE][\-+]\=\d\+\)\="

" Comments:
syn region pigComment start="/\*" end="\*/" contains=pigTodo
syn match pigComment "--.*$" contains=pigTodo
" syn match pigComment "^\s*#.*$" contains=pigTodo

syn sync ccomment pigComment

" Todo.
syn keyword pigTodo TODO FIXME XXX DEBUG NOTE contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_c_syn_inits")
  if version < 508
    let did_c_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pigComment   Comment
  HiLink pigOpWord    Label
  HiLink pigOperator  Operator
  HiLink pigType      Type
  HiLink pigSpecial   Identifier
  HiLink pigPreCondit PreCondit
  HiLink pigKeyword   Statement
  HiLink pigNumber    Number
  HiLink pigFloat     Float
  HiLink pigDollarIdx Identifier
  HiLink pigDollarVar PreCondit
  HiLink pigAssignVar Identifier
  HiLink pigString    String
  HiLink pigTodo      Todo

  HiLink pigFunctionName Function

  HiLink pigGrunt String
  HiLink pigGruntCmd Statement
  HiLink pigRegisterKeyword Include

  delcommand HiLink
endif

let b:current_syntax = "pig"

