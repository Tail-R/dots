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
set nosmartindent
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

set wildmenu

"
" Status Line
"
set laststatus=2 " show always

if (&t_Co ?? 0) >= 16 && ! has('gui_running')
    " set user highlight group to User{N} [The N must be 1 ~ 9]
    " :h statusline to see more details
    
    " hi User1 ctermfg=green ctermbg=white cterm=bold
    hi User2 ctermfg=black ctermbg=cyan cterm=bold
    
    " left items
    set statusline=\ ▼\ \ %{GetCurrentMode()}\ 
    
    " jump to right
    set statusline+=%=
    
    " right items
    set statusline+=\ %l\ 行\ %c\ 列\ 
    set statusline+=%2*\ %{GetCurrentFileName()}\ 
endif

"
" Tab Line
"
set showtabline=1
set tabline=%!MyTabLine()

set noshowmode

"
" Remap
"
let mapleader = ' ' "  use space as leaderkey

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

" resize the current window
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
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap < <><Left>
inoremap " ""<Left>
inoremap /* /*  */<Left><Left><Left>
inoremap <!-- <!--  --><Left><Left><Left><Left>

" copy the latest selection to the system clipboard via xclip command
" make sure that you have xclip on your system
nnoremap <C-c> :call CopyVisualSelection()<CR>
vnoremap <C-c> :call CopyVisualSelection()<CR>

"
" Functions
"
function! ToggleTypoHighlight()
    let spell_is_enable = &spell

    if spell_is_enable == '0'
        set spell
    else    
        set nospell
    endif
endfunction

function! GetCurrentMode()
    let mode = mode()
     
    if mode ==# 'n'
        let current_mode = 'NORMAL'
    elseif mode ==# 'v'
        let current_mode = 'VISUAL'
    elseif mode ==# 'V'
        let current_mode = 'V-LINE'
    elseif mode ==# "\<C-v>"
        let current_mode = 'V-BLOCK'
    elseif mode ==# 'i'
        let current_mode = 'INSERT'
    elseif mode ==# 'c'
        let current_mode = 'COMMAND'
    elseif mode ==# 't'
        let current_mode = 'TERM'
    else
        let current_mode = mode
    endif

    return current_mode
endfunction

function! GetCurrentFileName()
    let fileName = expand('%:t')
    
    return fileName == '' ? 'New File' : fileName
endfunction

" simple implementation of the tabline
function MyTabLine()
    let s = '   '
    
    for i in range(tabpagenr('$'))
        let s..= i + 1 == tabpagenr() ? '%#TabLineSel#': '%#TabLine#'
        
        let s ..= '%' .. (i + 1) .. 'T'
        let s ..= ' %{GetTabLabel(' .. (i + 1) .. ')} '
    endfor
    
    let s ..= '%#TabLineFill#%T'
 
    return s
endfunction

function GetTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let bufname = bufname(buflist[winnr - 1])
    
    return bufname == '' ? 'New File' : bufname
endfunction

function CopyVisualSelection()
    call system("echo -e '" . GetVisualSelection() . "' | xclip -sel clip")
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

" return to last edit position. just working lol
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
