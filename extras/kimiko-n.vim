set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
colorscheme vim
let g:colors_name = "kimiko"

"rowcolumn test
set cursorline
set cursorcolumn
"hi Cursor              cterm=inverse
hi CursorLine          cterm=NONE ctermbg=234 guibg=#1c1c1c
hi CursorColumn        ctermbg=235            guibg=#262626
hi ColorColumn         ctermbg=232            guibg=#080808

hi Normal              ctermfg=191            guifg=#eaf4a0

hi NonText             ctermfg=67             guifg=#5f87af
hi SpecialKey          ctermfg=67             guifg=#5f87af

hi Comment             ctermfg=152            guifg=#aed7d7

hi Constant            ctermfg=121            guifg=#87ffaf
hi String              ctermfg=219            guifg=#ffafff
hi Number              ctermfg=147            guifg=#afaffe

hi LineNr              ctermfg=250 ctermbg=237 guifg=#bfbebc guibg=#2d2121
hi StatusLine          cterm=bold ctermfg=223 ctermbg=237 guifg=#f8d1aa guibg=#2d2121
hi StatusLineNC        cterm=bold ctermfg=247 ctermbg=237 guifg=#fedece guibg=#393736 gui=bold
hi ModeMsg             ctermbg=237                        guifg=#3a3a3a
hi MoreMsg             ctermbg=237                        guifg=#3a3a3a
hi VertSplit           cterm=bold ctermfg=242 ctermbg=237 guifg=#6c6c6c guibg=#3a3a3a gui=bold
hi WinSeparator        cterm=bold ctermfg=242 ctermbg=237 guifg=#6c6c6c guibg=#3a3a3a gui=bold

hi TabLine             cterm=bold,underline ctermfg=253  ctermbg=239 guifg=#dadada guibg=#4e4e4e gui=bold,underline
hi TabLineSel          cterm=bold,underline ctermfg=253  ctermbg=29  guifg=#dadada guibg=#00875f gui=bold,underline
hi TabLineFill         cterm=bold,underline ctermfg=253  ctermbg=239 guifg=#dadada guibg=#4e4e52 gui=bold,underline

hi Statement           cterm=bold ctermfg=221 guifg=#ffd65e gui=bold
hi pythonStatement     cterm=bold ctermfg=226 guifg=#ffff03 gui=bold
hi Conditional         cterm=bold ctermfg=214 guifg=#fa9903 gui=bold
hi Repeat              cterm=bold ctermfg=123 guifg=#81fee4 gui=bold
hi Exception           cterm=bold ctermfg=202 guifg=#ff5603 gui=bold
hi Operator            cterm=bold ctermfg=204 guifg=#ff4f81 gui=bold

hi Identifier          cterm=bold ctermfg=195 guifg=#dfefff gui=bold
hi Function            cterm=bold,underline ctermfg=195 guifg=#dfefff gui=bold,underline
hi pythonBuiltin       cterm=bold ctermfg=74 guifg=#5fafd7 gui=bold   "True, all(), etc

hi Special             ctermfg=197           guifg=#ff005f

hi Title               cterm=bold,underline ctermfg=211 guifg=#ff87af gui=bold,underline
hi htmlH1              cterm=bold ctermfg=211 guifg=#ff87af gui=bold
hi htmlH2              cterm=bold ctermfg=224 guifg=#ffdfdf gui=bold
hi htmlH3              cterm=bold,underline ctermfg=255 guifg=#eeeeee gui=bold,underline
hi htmlH4              cterm=bold,underline  ctermfg=250 guifg=#bcbcbc gui=bold,underline
hi htmlH5              cterm=bold ctermfg=250 guifg=#bcbcbc gui=bold
hi htmlH6              ctermfg=252            guifg=#d0d0d0

"hi Cursor              cterm=bold ctermfg=231 ctermbg=82

hi Type                ctermfg=83             guifg=#5fff5f

hi Visual              ctermbg=23                 guibg=#005f5f
hi MatchParen           ctermbg=22                guibg=#005f00

hi Search               ctermbg=24 ctermfg=white guifg=#ffffff guibg=#005187
hi IncSearch            cterm=NONE ctermfg=89 ctermbg=118 guifg=#670044 guibg=#8aff04
hi Error                ctermbg=88                guibg=#510000
hi Todo                 cterm=bold,underline ctermfg=227 ctermbg=89 guifg=#fff644 guibg=#433a3b gui=bold,underline


hi PreProc              cterm=bold ctermfg=141 guifg=#af87ff gui=bold
hi Include              cterm=bold ctermfg=147 guifg=#afafff gui=bold
hi Define               cterm=bold ctermfg=129 guifg=#af09ff gui=bold


" keyword completion menu
hi Pmenu                ctermfg=255 ctermbg=236 guifg=#eeeeee guibg=#323030
hi PmenuSel             ctermfg=255 ctermbg=22  guifg=#eeeeee guibg=#005f13
hi PmenuSbar            ctermfg=250 ctermbg=239 "scrollbar TODO
hi PmenuThumb           ctermfg=244 ctermbg=20  "scrollhandle TODO

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

hi DiffAdd               ctermbg=22               guibg=#004406
hi DiffDelete            ctermbg=239 ctermfg=52   guibg=#663230
hi DiffChange            ctermbg=237              guibg=#232345
hi DiffText              ctermbg=53               guibg=#343466

" syntastic default,
" http://stackoverflow.com/questions/17677441/changing-error-highlight-color-used-by-syntastic
hi link SyntasticError SpellBad
hi link SyntasticWarning SpellCap
hi SpellBad             ctermbg=52                guibg=#442211
hi SpellCap             ctermbg=54                guibg=#440011


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

