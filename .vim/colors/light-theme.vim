set background=light
hi clear

let g:colors_name='light-theme'

if (&t_Co ?? 0) >= 16 && ! has('gui_running')
    " General
    hi Normal ctermfg=black ctermbg=NONE cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi CursorColumn ctermfg=NONE ctermbg=white cterm=NONE
    hi CursorLineNr ctermfg=black ctermbg=NONE cterm=bold
    hi LineNr ctermfg=magenta ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=yellow ctermbg=NONE cterm=NONE
    hi StatusLine ctermfg=magenta ctermbg=white cterm=bold
    hi StatusLineNC ctermfg=magenta ctermbg=white cterm=bold
    hi StatusLineTerm ctermfg=magenta ctermbg=white cterm=bold
    hi StatusLineTermNC ctermfg=magenta ctermbg=white cterm=bold
    hi VertSplit ctermfg=yellow ctermbg=NONE cterm=NONE
    hi Tabline ctermfg=blue ctermbg=NONE cterm=bold
    hi TablineFill ctermfg=NONE ctermbg=NONE cterm=NONE
    hi TablineSel ctermfg=black ctermbg=NONE cterm=bold
    hi WildMenu ctermfg=black ctermbg=yellow cterm=NONE
    hi Visual ctermfg=black ctermbg=cyan cterm=NONE
    
    " Search
    hi MatchParen ctermfg=NONE ctermbg=magenta cterm=NONE
    hi Search ctermfg=black ctermbg=yellow cterm=NONE
    hi IncSearch ctermfg=black ctermbg=yellow cterm=NONE
    hi SpellBad ctermfg=black ctermbg=cyan cterm=NONE
    hi SpellCap ctermfg=black ctermbg=cyan cterm=NONE
    
    " Coding
    hi Comment ctermfg=green ctermbg=NONE cterm=italic
    hi Constant ctermfg=magenta ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=black ctermbg=NONE cterm=NONE
    hi Statement ctermfg=green ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=magenta ctermbg=NONE cterm=NONE
    hi Type ctermfg=blue ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=cyan ctermbg=NONE cterm=italic
    hi Error ctermfg=white ctermbg=red cterm=NONE
    
    finish
endif
