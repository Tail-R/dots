set background=light
hi clear

let g:colors_name='light-theme'

let s:t_Co = has('gui_running') ? -1 : (&t_Co ?? 0)

if s:t_Co >= 16
    " General
    hi Normal ctermfg=black ctermbg=NONE cterm=NONE
    hi CursorLine ctermfg=NONE ctermbg=NONE cterm=NONE
    hi CursorColumn ctermfg=NONE ctermbg=white cterm=NONE
    hi CursorLineNr ctermfg=red ctermbg=NONE cterm=bold
    hi LineNr ctermfg=cyan ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=yellow ctermbg=NONE cterm=NONE
    hi StatusLine ctermfg=NONE ctermbg=blue cterm=NONE
    hi StatusLineNC ctermfg=NONE ctermbg=yellow cterm=NONE
    hi VertSplit ctermfg=yellow ctermbg=yellow cterm=NONE
    hi Tabline ctermfg=NONE ctermbg=white cterm=NONE
    hi TablineFill ctermfg=NONE ctermbg=NONE cterm=NONE
    hi TablineSel ctermfg=black ctermbg=yellow cterm=bold
    hi Visual ctermfg=red ctermbg=blue cterm=NONE
    
    " Search
    hi MatchParen ctermfg=NONE ctermbg=magenta cterm=bold
    hi Search ctermfg=black ctermbg=yellow cterm=NONE
    hi IncSearch ctermfg=black ctermbg=yellow cterm=bold
    hi SpellBad ctermfg=black ctermbg=cyan cterm=NONE
    hi SpellCap ctermfg=black ctermbg=cyan cterm=NONE
    
    " Coding
    hi Comment ctermfg=green ctermbg=NONE cterm=italic
    hi Constant ctermfg=black ctermbg=NONE cterm=NONE
    hi Identifier ctermfg=green ctermbg=NONE cterm=NONE
    hi Statement ctermfg=black ctermbg=NONE cterm=NONE
    hi PreProc ctermfg=magenta ctermbg=NONE cterm=NONE
    hi Type ctermfg=blue ctermbg=NONE cterm=NONE
    hi Underlined ctermfg=cyan ctermbg=NONE cterm=bold cterm=italic
    hi Error ctermfg=white ctermbg=red cterm=NONE
    
    unlet s:t_Co
    finish
endif
