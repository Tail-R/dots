"
" Settings
"
set notitle
set encoding=UTF-8

set nobackup
set noswapfile

set shell=bash

set mouse=a " Enable mouse

set number
set norelativenumber
set cursorline
set nocursorcolumn

set nowrap
set virtualedit=onemore
set nosmartindent
set smarttab " Delete multiple spaces as a single tab
set expandtab " Use space instead of tab
set tabstop=4
set shiftwidth=4

set wrapscan
set incsearch
set hlsearch
set smartcase
set ignorecase

set nospell
set background=light

set wildmenu

set undofile
set undodir=~/.vim/undo

syntax on

" Color scheme
colorscheme light-theme

" Visualize tabs and trails
set list
set listchars=tab:→\ ,trail:•

"
" Status Line
"
set laststatus=2 " Show always
set noshowmode

" if (&t_Co ?? 0) >= 16 && ! has('gui_running')
    " Set user highlight group to User{N} [The N must be 1 ~ 9]
    " :h statusline to see more details

    " if g:colors_name ==# 'light-theme'
    "     hi HiLeft   ctermfg=0 ctermbg=7 cterm=bold
    "     hi HiCenter ctermfg=0 ctermbg=15 cterm=none
    "     hi HiRight  ctermfg=0 ctermbg=7 cterm=bold
    " else
    "     hi HiLeft   ctermfg=15 ctermbg=8 cterm=bold
    "     hi HiCenter ctermfg=15 ctermbg=0 cterm=none
    "     hi HiRight  ctermfg=15 ctermbg=8 cterm=bold
    " endif

    " Left items
    set statusline+=%#HiLeft#\ 
    " set statusline+=%{GetCurrentMode()}\ \ 
    set statusline+=%{GetCurrentFileName()}\ \ 

    set statusline+=%#HiCenter#
    set statusline+=%m\ %r

    " Jump to the right section
    set statusline+=%=

    " Right items
    set statusline+=%#HiRight#
    set statusline+=%l:%c\ \ %P\ \ 
    set statusline+=%{GetFileEncoding()}\ \ 
    set statusline+=%{GetCurrentFileType()}\ 
" endif

"
" Tab Line
"
set showtabline=1
set tabline=%!MyTabLine()

"
" Remap
"
let mapleader = 'g' "  Use spacekey as a leaderkey

" Move between tabs
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>c :tabclose<CR>
nnoremap <Leader>n :tabnext<CR>
nnoremap <Leader>p :tabprev<CR>

" Move between windows
nnoremap <S-h> <C-w>h
nnoremap <S-j> <C-w>j
nnoremap <S-k> <C-w>k
nnoremap <S-l> <C-w>l

" Resize current window
nnoremap <C-h> :vertical resize -2<CR>
nnoremap <C-j> :resize +2<CR>
nnoremap <C-k> :resize -2<CR>
nnoremap <C-l> :vertical resize +2<CR>

nnoremap <Leader>h ^<Left> " jump tp the start of line
nnoremap <Leader>l $ " jump to the end of line

" Enable/Disable highlighting
nnoremap <S-s> :set spell<CR>
nnoremap <S-n> :set nospell<CR> :noh<CR>

" Echo the highlight group name
nnoremap <S-g> :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>

" Auto completions
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
" inoremap < <><Left>
inoremap " ""<Left>
inoremap /* /*  */<Left><Left><Left>
inoremap <!-- <!--  --><Left><Left><Left><Left>

nnoremap <C-c> :call CopyVisualSelection()<CR>
vnoremap <C-c> :call CopyVisualSelection()<CR>

"
" Functions
"
function GetCurrentMode()
    let mode = mode()

    if mode ==# 'n'
        let current_mode = 'NOR'
    elseif mode ==# 'v'
        let current_mode = 'VIS'
    elseif mode ==# 'V'
        let current_mode = 'V-L'
    elseif mode ==# "\<C-v>"
        let current_mode = 'V-B'
    elseif mode ==# 'i'
        let current_mode = 'INS'
    elseif mode ==# 'R'
        let current_mode = 'REP'
    elseif mode ==# 'c'
        let current_mode = 'CMD'
    elseif mode ==# 't'
        let current_mode = 'TER'
    else
        let current_mode = mode
    endif

    return current_mode
endfunction

function GetCurrentFileName()
    let file_name = expand('%:t')

    return file_name == '' ? '[No Name]' : file_name
endfunction

function GetCurrentFileType()
    let file_type = &filetype

    " return file_type == '' ? '' : '[' .. file_type .. ']'
    return file_type == '' ? 'TEXT' : toupper(file_type)
endfunction

function GetFileEncoding()
    let file_encoding = &fileencoding !=# '' ? &fileencoding : &encoding
    let file_format = &fileformat

    let fmt = file_format == 'unix' ? 'LF' : file_format == 'mac' ? 'CR' : 'CRLF'

    return toupper(file_encoding) .. '  ' .. fmt
endfunction

" Tab Appearance
function MyTabLine()
    let s = ''

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

    return bufname == '' ? 'No Name' : bufname
endfunction

" Copy selected area to the system clipboard via xclip
function CopyVisualSelection() abort
    let vblock = GetVisualSelection()
    call system('xclip -sel clip', vblock)
endfunction

function GetVisualSelection()
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
augroup makefileTab
    autocmd!
    autocmd FileType make set noexpandtab
    autocmd FileType make set tabstop=4
    autocmd FileType make set shiftwidth=4
augroup END

augroup xmlTab
    autocmd!
    autocmd FileType html,xml set expandtab
    autocmd FileType html,xml set tabstop=2
    autocmd FileType html,xml set shiftwidth=2
augroup END

augroup autoShebang
    autocmd!
    autocmd BufNewFile *.sh call append(0, '#! /usr/bin/env bash')
    autocmd BufNewFile *.py call append(0, '#! /usr/bin/env python3')
    autocmd BufNewFile *.lua call append(0, '#! /usr/bin/env lua')
augroup END

" Return to the last edit position
autocmd bufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" XML tag auto completion
augroup MyXML
    autocmd!
    " Set omnifunc for each file type
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags

    " Map </ to trigger completion automatically
    autocmd Filetype html,xml inoremap <buffer> </ </<C-x><C-o>
augroup END

