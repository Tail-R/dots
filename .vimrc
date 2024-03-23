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
set laststatus=2 " show always

" set user highlight group to User{N} [N must be 1 ~ 9]
" :h statusline to see more details
hi User1 ctermfg=white ctermbg=NONE cterm=NONE " normal item
hi User2 ctermfg=white ctermbg=black cterm=bold " active item

set statusline=%2*\ %{GetCurrentMode()}\ %1*\ %{GetCurrentFileName()}%=%2*\ R\ %l\ C\ %c\ 
set noshowmode

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

" i'm not sure how the vim renders the statusline but
" this function will invoked when it's supposed
function! GetCurrentMode()
    let l:Mode = mode()

    if l:Mode ==# 'n'
        let b:CurrentMode = 'NORMAL'
    elseif l:Mode ==# 'v'
        let b:CurrentMode = 'VISUAL'
    elseif l:Mode ==# 'i'
        let b:CurrentMode = 'INSERT'
    elseif l:Mode ==# 'c'
        let b:CurrentMode = 'COMMAND'
    else
        let b:CurrentMode = l:Mode
    endif

    return b:CurrentMode
endfunction

function! GetCurrentFileName()
    let l:FileName = expand('%:t')

    return l:FileName
endfunction
