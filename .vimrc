"
" Settings
"
set encoding=UTF-8

set nobackup
set noswapfile

set mouse=a " enable the mouse

set number
set relativenumber
set cursorline
set nocursorcolumn

set nowrap
set virtualedit=onemore
set smartindent
set smarttab " delete multiple spaces as a single tab
set expandtab " use space instead of tab
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

"
" Status Line
"
set noshowmode
set laststatus=2 " show always

if (&t_Co ?? 0) > 16
    " set user highlight group to User{N} [The N must be 1 ~ 9]
    " :h statusline to see more details
    
    hi User1 ctermfg=magenta ctermbg=white cterm=bold
    hi User2 ctermfg=black ctermbg=cyan cterm=bold
    
    " left items
    set statusline=%2*\ %{GetCurrentMode()}\ 
    
    " jump to right
    set statusline+=%*%=
    
    " right items
    set statusline+=合計\ %L\ L\ 
    set statusline+=%2*\ R\ %l\ C\ %c\  
    " "set statusline+=%2*\ %{GetCurrentFileName()}\ 
endif

"
" Tab Line
"
set showtabline=2 " show always
set tabline=%!MyTabLine()

" enable the undo-redo permanently
set undofile
set undodir=~/.vim/undodir

"
" Remap
"
nnoremap <C-t> :tabnew<CR>

nnoremap <Space> /

" move between windows
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

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
" inoremap ' ''<left>
inoremap " ""<left>

"
" Functions
"
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

" simple implementation of the tabline
" copied and edited from https://vim-jp.org/vimdoc-ja/tabpage.html
function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        let s..= i + 1 == tabpagenr() ? '%#TabLineSel#': '%#TabLine#'
        
        let s ..= '%' .. (i + 1) .. 'T'
        let s ..= ' %{MyTabLabel(' .. (i + 1) .. ')} '
    endfor
    
    let s ..= '%#TabLineFill#%T'
    
    return s
endfunction

" it will be invoked to get tabname
function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    
    return bufname(buflist[winnr - 1])
endfunction

"
" Startup commands
"
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

" return to last edit position. Just working lol
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"
" Callback commands
"
autocmd ModeChanged *:i* set norelativenumber
autocmd ModeChanged i*:* set relativenumber

" xml tag auto completion
set omnifunc=xmlcomplete#CompleteTags
augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END
