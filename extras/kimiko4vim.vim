set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "kimiko"

"rowcolumn test
set cursorline
set cursorcolumn
"hi Cursor              cterm=inverse
hi CursorLine          cterm=NONE ctermbg=234
hi CursorColumn        ctermbg=235
hi ColorColumn         ctermbg=232

hi Normal              ctermfg=191 guibg=black guifg=#E7FFA0  " DEFAULT

"hi NonText             ctermfg=18
"hi SpecialKey          ctermfg=18
hi NonText             ctermfg=67
hi SpecialKey          ctermfg=67

hi Comment             ctermfg=152              " lines that have been commented out

hi Constant            ctermfg=121              " 'contstants', or integers placed outside of a string
hi String              ctermfg=219
hi Number              ctermfg=147

hi LineNr              ctermfg=250 ctermbg=237
hi StatusLine          cterm=bold ctermfg=223 ctermbg=237   " line at bottom of screen with filename, cursor position, etc...
hi StatusLineNC        cterm=bold ctermfg=247 ctermbg=237   " line at bottom of screen with filename, cursor position, etc...
hi ModeMsg             ctermbg=237
hi MoreMsg             ctermbg=237
hi VertSplit           cterm=bold ctermfg=242 ctermbg=237   " line at bottom of screen with filename, cursor position, etc...

hi TabLine             cterm=bold,underline ctermfg=253  ctermbg=239
hi TabLineSel          cterm=bold,underline ctermfg=253  ctermbg=29
hi TabLineFill         cterm=bold,underline ctermfg=253  ctermbg=239

hi Statement           cterm=bold ctermfg=221
hi pythonStatement     cterm=bold ctermfg=226   " stand out
hi Conditional         cterm=bold ctermfg=214
hi Repeat              cterm=bold ctermfg=123
hi Exception           cterm=bold ctermfg=202
hi Operator            cterm=bold ctermfg=204   " and in not

hi Identifier          cterm=bold ctermfg=195               " opening or closing brackets, ex: <  /> 
"hi Function            cterm=bold,underline ctermfg=195  "css misuses for identifiers
hi pythonBuiltin       cterm=bold ctermfg=74    "True, all(), etc

hi Special             ctermfg=197              "

hi Title               cterm=bold,underline ctermfg=211              "
hi htmlH1              cterm=bold ctermfg=211
hi htmlH2              cterm=bold ctermfg=224
hi htmlH3              cterm=bold,underline ctermfg=255
hi htmlH4              cterm=bold,underline  ctermfg=250
hi htmlH5              cterm=bold ctermfg=250
hi htmlH6              ctermfg=252

"hi Cursor              cterm=bold ctermfg=231 ctermbg=82

hi Type                ctermfg=83              " any variable or characters being assigned a value, ex: style=, height=, etc...

hi Visual              ctermbg=23  "ctermfg=232 ctermbg=153
hi MatchParen           ctermbg=22

hi Search               ctermbg=24 ctermfg=white
hi IncSearch            cterm=NONE ctermfg=89 ctermbg=118
hi Error                ctermbg=88
hi Todo                 cterm=bold,underline ctermfg=227 ctermbg=89


hi PreProc              cterm=bold ctermfg=141
hi Include              cterm=bold ctermfg=147
hi Define               cterm=bold ctermfg=129


" keyword completion menu
hi Pmenu                ctermfg=255 ctermbg=236
hi PmenuSel             ctermfg=255 ctermbg=22
hi PmenuSbar            ctermfg=250 ctermbg=239 "scrollbar
hi PmenuThumb           ctermfg=244 ctermbg=20  "scrollhandle

" copied links

" language links
hi link htmlTag         htmlTagName
hi link htmlEndTag      htmlSpecialTagName
hi link htmlItalic      htmlUnderline

hi link markdownCode Number

hi link diffAdded       Type "type is green
hi link diffFile        htmlH2
"broken hi link diffOldFile     diffRemoved
"broken hi link diffNewFile     diffAdded
hi DiffAdd               ctermbg=22
hi DiffDelete            ctermbg=239 ctermfg=52
hi DiffChange            ctermbg=237
hi DiffText              ctermbg=53

" syntastic default,
" http://stackoverflow.com/questions/17677441/changing-error-highlight-color-used-by-syntastic
hi link SyntasticError SpellBad
hi link SyntasticWarning SpellCap
hi SpellBad             ctermbg=52
hi SpellCap             ctermbg=54


" Directory
" ModeMsg
" MoreMsg
" Question
" SpecialKey
" WarningMsg
" NonText
" ErrorMsg
"

" needs to be repeated at the end, workaround(?)
"hi CursorLine          cterm=NONE

