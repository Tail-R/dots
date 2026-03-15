hi clear

if exists("syntax_on")
    syntax reset
endif

set background=light

let g:colors_name = "dark-theme"

if (&t_Co ?? 0) >= 16 && ! has('gui_running')
    " General
    hi Normal ctermfg=7 ctermbg=none cterm=none
    hi Visual ctermfg=none ctermbg=0 cterm=none
    hi Cursor ctermfg=none ctermbg=none cterm=reverse
    hi CursorLine ctermfg=none ctermbg=none cterm=none
    hi CursorColumn ctermfg=none ctermbg=none cterm=none
    hi LineNr ctermfg=0 ctermbg=none cterm=none
    hi CursorLineNr ctermfg=7 ctermbg=none cterm=bold
    hi VertSplit ctermfg=0 ctermbg=none cterm=none
    hi EndOfBuffer ctermfg=0 ctermbg=none cterm=none
    hi ErrorMsg ctermfg=9 ctermbg=none cterm=underline
    hi WarningMsg ctermfg=11 ctermbg=none cterm=underline

    " Search
    hi Search ctermfg=11 ctermbg=0 cterm=underline
    hi IncSearch ctermfg=15 ctermbg=0 cterm=underline
    hi MatchParen ctermfg=15 ctermbg=0 cterm=none

    " Statusline
    hi StatusLine ctermfg=15 ctermbg=0 cterm=none
    hi StatusLineNC ctermfg=15 ctermbg=0 cterm=none
    hi WildMenu ctermfg=15 ctermbg=8 cterm=none

    " TabLine
    hi TabLine ctermfg=15 ctermbg=none cterm=none
    hi TabLineSel ctermfg=15 ctermbg=0 cterm=bold
    hi TabLineFill ctermfg=none ctermbg=none cterm=none

    " Syntax
    hi Comment ctermfg=8 ctermbg=none cterm=italic
    hi Constant ctermfg=5 ctermbg=none cterm=none
    hi String ctermfg=2 ctermbg=none cterm=none
    hi Character ctermfg=3 ctermbg=none cterm=none
    hi Number ctermfg=4 ctermbg=none cterm=none
    hi Float ctermfg=4 ctermbg=none cterm=none
    hi Boolean ctermfg=3 ctermbg=none cterm=none

    hi Identifier ctermfg=7 ctermbg=none cterm=none
    hi Function ctermfg=6 ctermbg=none cterm=none
    hi Statement ctermfg=1 ctermbg=none cterm=none
    hi Operator ctermfg=5 ctermbg=none cterm=none
    hi Delimiter ctermfg=5 ctermbg=none cterm=none

    hi Type ctermfg=4 ctermbg=none cterm=none
    hi PreProc ctermfg=5 ctermbg=none cterm=none
    hi Error ctermfg=9 ctermbg=0 cterm=underline
    hi Special ctermfg=5 ctermbg=none cterm=none
    hi SpecialKey ctermfg=10 ctermbg=none cterm=none

    " Vim
    hi VimGroup ctermfg=3 ctermbg=none cterm=none

    " Sh
    hi shDeref ctermfg=7 ctermbg=none cterm=none
    hi shStatement ctermfg=4 ctermbg=none cterm=none
endif

