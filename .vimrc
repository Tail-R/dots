"
" Settings
"
set encoding=UTF-8

set nobackup
set noswapfile

" enable the undo-redo permanently
set undofile
set undodir=~/.vim/undodir

set shell=zsh

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

set nospell
set background=light

syntax on

colorscheme light-theme

set wildmenu

"
" Status Line
"
set laststatus=2 " show always

if (&t_Co ?? 0) >= 16 && ! has('gui_running')
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
    " set statusline+=%2*\ R\ %l\ C\ %c\  
    set statusline+=%2*\ %{GetCurrentFileName()}\ 
endif

"
" Tab Line
"
set showtabline=1 " don't show always
set tabline=%!MyTabLine()

set noshowmode

"
" Remap
"
let mapleader = ' '

" move between tabs
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>c :tabclose<CR>
nnoremap <Leader>h :tabprev<CR>
nnoremap <Leader>l :tabnext<CR>

" move between windows
nnoremap <S-h> <C-w>h
nnoremap <S-j> <C-w>j
nnoremap <S-k> <C-w>k
nnoremap <S-l> <C-w>l

" resize the current windows
nnoremap <C-h> :vertical resize -2<CR>
nnoremap <C-j> :resize +2<CR>
nnoremap <C-k> :resize -2<CR>
nnoremap <C-l> :vertical resize +2<CR>

nnoremap s ^ " jump tp start of line
nnoremap e $ " jump to end of line

" disable highlighting until next search
nnoremap <C-n> :noh<CR>

" toggle typo highlighting
nnoremap <C-s> :call ToggleTypoHighlight()<CR>

" some useful completions
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap < <><left>
inoremap " ""<left>
inoremap /* /*  */<left><left><left>
inoremap <!-- <!--  --><left><left><left><left>

" copy the latest selection to the system clipboard via xclip command
" make sure that you have xclip on your system
nnoremap <C-c> :call CopyVisualSelection()<CR>
vnoremap <C-c> :call CopyVisualSelection()<CR>

"
" Functions
"
function! ToggleTypoHighlight()
    let l:State = &spell

    if l:State == '0'
        set spell
    else    
        set nospell
    endif
endfunction

function! GetCurrentMode()
    let l:Mode = mode()
    
    if l:Mode ==# 'n'
        let b:CurrentMode = 'Normal'
    elseif l:Mode ==# 'v'
        let b:CurrentMode = 'Visual'
    elseif l:Mode ==# 'V'
        let b:CurrentMode = 'V-Line'
    elseif l:Mode ==# "\<C-v>"
        let b:CurrentMode = 'V-Block'
    elseif l:Mode ==# 'i'
        let b:CurrentMode = 'Insert'
    elseif l:Mode ==# 'c'
        let b:CurrentMode = 'Command'
    else
        let b:CurrentMode = l:Mode
    endif

    " if l:Mode ==# 'n'
    "     let b:CurrentMode = 'のーまる'
    " elseif l:Mode ==# 'v'
    "     let b:CurrentMode = 'びじゅある'
    " elseif l:Mode ==# 'V'
    "     let b:CurrentMode = 'らいん'
    " elseif l:Mode ==# "\<C-v>"
    "     let b:CurrentMode = 'ぶろっく'
    " elseif l:Mode ==# 'i'
    "     let b:CurrentMode = 'いんさーと'
    " elseif l:Mode ==# 'c'
    "     let b:CurrentMode = 'こまんど'
    " else
    "     let b:CurrentMode = l:Mode
    " endif

    return b:CurrentMode
endfunction

function! GetCurrentFileName()
    let fileName = expand('%:t')
    
    " return fileName == '' ? 'ななし' : fileName
    return fileName == '' ? 'New File' : fileName
endfunction

" simple implementation of the tabline
function MyTabLine()
    let s = ''
    
    for i in range(tabpagenr('$'))
        let s..= i + 1 == tabpagenr() ? '%#TabLineSel#': '%#TabLine#'
        
        let s ..= '%' .. (i + 1) .. 'T'
        let s ..= ' %{MyTabLabel(' .. (i + 1) .. ')} '
    endfor
    
    let s ..= '%#TabLineFill#%T'

    " if tabpagenr('$') > 1
    "     let s ..= '%=%#TabLine#%999X とじる '
    " endif
    
    return s
endfunction

" it will be invoked to get tabname
function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let bufname = bufname(buflist[winnr - 1])
    
    " return bufname == '' ? 'ななし' : bufname
    return bufname == '' ? 'New File' : bufname
endfunction

function CopyVisualSelection()
    call system('echo ' . GetVisualSelection() .' | xclip -sel clip')
endfunction

function! GetVisualSelection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    
    if len(lines) == 0
        return ''
    endif
    
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    
    return join(lines, "\n")
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
