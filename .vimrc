" settings
set encoding=UTF-8

set nobackup
set noswapfile

set mouse=a " enable mouse

set noerrorbells
set novisualbell

set number
set norelativenumber
set nocursorline
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

" colorscheme
syntax on

" statusbar
set noshowmode
set laststatus=2 " Show always

" set user highlight group to User{N} [N must be 1 ~ 9]
" :h statusline to see more details

" normal items
hi User1 ctermfg=black ctermbg=white cterm=bold

" active items
hi User2 ctermfg=red ctermbg=white cterm=bold
hi User3 ctermfg=black ctermbg=yellow cterm=bold


" left
set statusline=%3*\ %{GetCurrentFileName()}\ 
set statusline+=%2*\ 【\ %l\ 行\ %c\ 列\ 】\   
" set statusline+=%2*\ 【\ Total\ %L\ L\ 】\ 

" jump to right
set statusline+=%1*%=

" right
set statusline+=%3*\ %{GetCurrentMode()}\ 

set showtabline=1

" remap
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprev<CR>

nnoremap s ^ " jump tp start of line
nnoremap e $ " jump to end of line

" disable highlighting until next search
nnoremap <C-n> :noh<CR>

" toggle typo highlighting
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

" functions
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
        " let b:CurrentMode = 'LINE'
        let b:CurrentMode = 'らいん'
    elseif l:Mode ==# "\<C-v>"
        " let b:CurrentMode = 'BLOCK'
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
        return 'ななしふぁいる'
    else
        return l:FileName
    endif
endfunction
