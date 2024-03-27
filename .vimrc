" Settings
set encoding=UTF-8

set nobackup
set noswapfile

set mouse=a " enable mouse

set noerrorbells
set novisualbell

set number
set norelativenumber
set cursorline
set nocursorcolumn

set nowrap
set virtualedit=onemore
set noautoindent
set smartindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4

set wrapscan
set incsearch
set hlsearch
set smartcase
set ignorecase

set spell
set background=light

syntax on

colorscheme light-theme

" Statusbar
set noshowmode
set laststatus=2 " Show always

" Set user highlight group to User{N} [N must be 1 ~ 9]
" :h statusline to see more details

" Normal items
hi User1 ctermfg=black ctermbg=white cterm=bold

" Active items
hi User2 ctermfg=magenta ctermbg=white cterm=bold
hi User3 ctermfg=black ctermbg=cyan cterm=bold

" Left
set statusline=%3*\ %{GetCurrentMode()}\ 
" set statusline+=%2*\ R\ %l\ C\ %c\  

" Jump to right
set statusline+=%1*%=

" Right
set statusline+=%2*\ 合計\ %L\ L\ 
set statusline+=%3*\ %{GetCurrentFileName()}\ 

set showtabline=1

set cmdheight=1

" Remap
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprev<CR>

nnoremap s ^ " jump tp start of line
nnoremap e $ " jump to end of line

" Disable highlighting until next search
nnoremap <C-n> :noh<CR>

" Toggle typo highlighting
nnoremap <C-s> :call ToggleTypoHighlight()<CR>

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap < <><left>
inoremap ' ''<left>
inoremap " ""<left>

" xml tag autocomplete
set omnifunc=xmlcomplete#CompleteTags
augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

" Functions
function! ToggleTypoHighlight()
    let l:State = &spell

    if l:State == '0'
        set spell
    elseif l:State == '1'
        set nospell
    endif
endfunction

function! GetCurrentMode()
    let l:Mode = mode()

    if l:Mode ==# 'n'
        " let b:CurrentMode = 'NORMAL'
        let b:CurrentMode = 'のーまる'
    elseif l:Mode ==# 'v'
        " let b:CurrentMode = 'VISUAL'
        let b:CurrentMode = 'びじゅある'
    elseif l:Mode ==# 'V'
        " let b:CurrentMode = 'V-LINE'
        let b:CurrentMode = 'らいん'
    elseif l:Mode ==# "\<C-v>"
        " let b:CurrentMode = 'V-BLOCK'
        let b:CurrentMode = 'ぶろっく'
    elseif l:Mode ==# 'i'
        " let b:CurrentMode = 'INSERT'
        let b:CurrentMode = 'いんさーと'
    elseif l:Mode ==# 'c'
        " let b:CurrentMode = 'COMMAND'
        let b:CurrentMode = 'こまんど'
    else
        let b:CurrentMode = l:Mode
    endif

    return b:CurrentMode
endfunction

function! GetCurrentFileName()
    let l:FileName = expand('%:t')
    
    if l:FileName == ''
        return 'ななし'
    else
        return l:FileName
    endif
endfunction

" Auto run commands
augroup xmlIndent
    autocmd!
    autocmd FileType xml set expandtab
    autocmd FileType xml set tabstop=2
    autocmd FileType xml set shiftwidth=2
augroup END

augroup autoShebang
    autocmd!
    autocmd BufNewFile *.sh call append(0, '#! /usr/bin/env bash')
    autocmd BufNewFile *.py call append(0, '#! /usr/bin/env python3')
    autocmd BufNewFile *.lua call append(0, '#! /usr/bin/env lua')
augroup END

" Return to last edit position. Just working lol
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
