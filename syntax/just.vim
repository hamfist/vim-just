" Vim syntax file
" Language: Just Command Runner
" Maintainer: Dan Buch <dan@meatballhat.com>
" Latest Revision: 28 May 2021

if exists("b:current_syntax")
  finish
endif

let b:shell_syntax = "sh"
if exists("g:just_shell_syntax")
  let b:shell_syntax = g:just_shell_syntax
endif

exe "syn include @setshellsyntax syntax/" . b:shell_syntax . ".vim"

syn keyword justKeyword alias export if else set

syn keyword justFunction arch os os_family
syn keyword justFunction env_var env_var_or_default invocation_directory
syn keyword justFunction justfile justfile_directory just_executable

syn keyword justSetting shell export dotenv-load positional-arguments

syn match justOperator "\v:"
syn match justOperator "\v\)"
syn match justOperator "\v\("
syn match justOperator "\v\+"
syn match justOperator "\v\@"
syn match justOperator "\v\="
syn match justOperator "\v:\="

syn match justQuote '\v"'
syn match justQuote "\v'"
syn match justQuote '\v"""'
syn match justQuote "\v'''"

syn match justBacktick "\v\`"
syn match justBacktick "\v\`\`\`"

syn match justCurlyBrace "\v\{\{"
syn match justCurlyBrace "\v\}\}"

syn match justComment "\v#.*$"

syn match justShebang "\v^ *#!.*$"

syn match justPublicName "\v[a-zA-Z][_a-zA-Z0-9-]*[a-zA-Z0-9_]"
syn match justPrivateName "\v_[a-zA-Z0-9][_a-zA-Z0-9-]*[a-zA-Z0-9_]"

syn region justCurlyBraced matchgroup=justCurlyBrace start="\v\{\{" skip="\v\\\{" end="\v\}\}" contains=justKeyword,justFunction,justOperator,justQuote,justString,justRawString

syn region justString matchgroup=justQuote start='\v"' skip='\v\\"' end='\v"' contains=justCurlyBraced
syn region justString matchgroup=justQuote start='\v"""' skip='\v\\"' end='\v"""' contains=justCurlyBraced

syn region justRawString matchgroup=justQuote start="\v'" end="\v'"
syn region justRawString matchgroup=justQuote start="\v'''" end="\v'''"

syn region justSubshell matchgroup=justBacktick start="\v\`" skip="\v\\\`" end="\v\`" contains=@setshellsyntax
syn region justSubshell matchgroup=justBacktick start="\v\`\`\`" skip="\v\\\`" end="\v\`\`\`" contains=@setshellsyntax
syn region justRecipeBody start="\v^  *" end="$" keepend contains=@setshellsyntax
syn region justRecipeNoechoBody start="\v^  *\@" end="$" keepend contains=justOperator,@setshellsyntax

hi def link justPublicName Constant
hi def link justPrivateName Constant
hi def link justKeyword Keyword
hi def link justSetting Keyword
hi def link justOperator Operator
hi def link justComment Comment
hi def link justShebang PreProc
hi def link justFunction Function
hi def link justQuote String
hi def link justString String
hi def link justRawString String
hi def link justCurlyBrace Keyword
hi def link justBacktick Special

let b:current_syntax = "just"

" vim:expandtab:ts=2:sts=2
