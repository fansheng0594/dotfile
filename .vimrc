" Basic settings --------------------- {{{
syntax on
set wildmenu
set wildmode=longest:list,full
set history=50
set hidden  " 缓冲区修改还未保存的情况下可以进行移动
cnoremap <expr> %% getcmdtype()==':' ? expand('%:h').'/':'%%'	  " 在命令行中输入 %% 就可以显示出当前文件夹路径
" set guifont="JetBrainsMono Nerd Font Mono Regular"
set guifont="JetBrains Mono Regular"
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 13

set expandtab
set tabstop=4
set shiftwidth=4
" set softtabstop=4
" set autoindent

" 结尾有空格时，更容易发现
set list
set listchars=tab:\|\ ,trail:▫

set scrolloff=4 " 光标上下方的最小行数
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix

set indentexpr=
set textwidth=0
" set foldmethod=indent
" set foldlevel=99
" set foldenable
set formatoptions-=tc

" 分屏时到右边和下边
set splitright
set splitbelow

set noshowmode
set showcmd
set shortmess+=c
" set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell

set backspace=indent,eol,start
set number		   "That's active line number"
set linespace=15
set hlsearch		 "搜索结果高亮"
set incsearch		"输入搜索条件时边高亮搜索结果"
"----------------TheCW----------------------"
"--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
set relativenumber  "显示相对行数
set cursorline	"光标所在的行高亮
set wrap			"字超出屏幕换行
set showcmd		 "输入 esc 会显示出来
set wildmenu		"如输入 :sor 按 tab 会出现两个选项 sort 和 source
set ignorecase	  "忽略大小写"
set smartcase	   "智能大小写 如搜索 vimRC 只会搜索到vimRC的结果，但如果搜索 vimrc 就可以搜索到 vimrc vimRc VimRC 等结果"
" hwlloo world Amy hwlloo world Amy"

" 不同模式下的光标样式
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 移动
let g:move_key_modifier = 'C'

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
" }}}


" Mappings --------------------- {{{
" 上次编辑位置
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif  

" keymap
nnoremap <SPACE> <Nop>
let mapleader="\<SPACE>"
let maplocalleader="-"
noremap <Down> <Nop>
noremap <Left> <Nop>
" noremap <Right> <Nop>
noremap <Leader>n nzz
noremap <Leader>N Nzz

" make Y to copy till the end of the line 
nnoremap Y "+y
" Copy to system clipboard
vnoremap Y "+y
" noremap <Up> <Nop>
" coc yank list
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>cr
" style
hi HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A

"uppercase
nnoremap <C-u> viwU

"delete cursor forward to end
inoremap <C-k> <C-o>d$

" 个性化粘贴
" noremap <Leader>pp o<Esc>p 

" 批量缩进代码
xnoremap < <gv
xnoremap > >gv

" 代码缩进
nnoremap < <<
nnoremap > >>

" Search
" noremap <LEADER><CR> :nohlsearch<CR>
nnoremap <silent> <Leader><CR> :if (&hlsearch && v:hlsearch) \| nohlsearch \| else \| set hlsearch \| endif <CR>

" Adjacent duplicate words  查找相邻重复词
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab 空格转化为 tab
nnoremap <LEADER>tt :%s/	/\t/g
vnoremap <LEADER>tt :s/	/\t/g

" Folding
noremap <silent> <LEADER>o za

" 翻页
noremap <C-f> <C-f>zz
noremap <C-b> <C-b>zz

inoremap <C-b> <C-o>h
inoremap <C-f> <C-o>a

noremap <silent> K 5k
noremap <silent> J 5j

" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" quit vim
map <silent> Q :q<CR>
nnoremap S :w<CR>

" edit myvimrc file
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
" source $MYVIMRC
nnoremap <Leader>sv :source $MYVIMRC<cr>
"------------Usual
nnoremap <Leader>H :help 
nnoremap <Leader>se :set 
nnoremap <Leader>ec :echo 
nnoremap <Leader>em :echom 
nnoremap <Leader>ex :execute 

" open previous buffer in split
" nnoremap <Leader>hs :split #<CR>
nnoremap <Leader>vs :vsplit #<CR>
nnoremap <Leader>no :normal! 

" insert-mode delete current line
inoremap <C-u> <Esc>ddO

" move
nnoremap H ^
nnoremap L $


" add quote
nnoremap <Leader>" viW<Esc>a"<Esc>Bi"<Esc>f"
nnoremap <Leader>' viW<Esc>a'<Esc>Bi'<Esc>f'
vnoremap <Leader>" <Esc>`<i"<Esc>`>la"<Esc>

" training your fingers
inoremap jk <Esc>
inoremap <Esc> <Nop>
vnoremap <Esc> <Nop>

" buffer
nnoremap <Leader>ls :ls<cr>
nnoremap <Leader>bn :bn<cr>
nnoremap <Leader>bp :bp<cr>

" insert mode
inoremap ,, <Esc>A,<Esc>
inoremap ;; <Esc>A;<Esc>
map gf :edit <cfile><cr>

" add blank line
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>


"-----Operator-Pending-Mapping-----"
"--round brackets(parentheses)
onoremap ( i(
" inside last round brackets
onoremap il( :normal! F)vi(<cr>
" inside next round brackets
onoremap in( :normal! f(vi(<cr>
" around last round brackets
onoremap al( :normal! F)va(<cr>
" around next round brackets
onoremap an( :normal! f(va(<cr>

"--square brackets(brackets)
onoremap [ i[
" inside last square brackets
onoremap il[ :normal! F]vi[<cr>
" inside next square brackets
onoremap in[ :normal! f[vi[<cr>
" around last square brackets
onoremap al[ :normal! F]va[<cr>
" around next square brackets
onoremap an[ :normal! f[va[<cr>

"--curly brackets(braces)
onoremap { i{
" inside last curly brackets
onoremap il{ :normal! F}vi{<cr>
" inside next curly brackets
onoremap in{ :normal! f{vi{<cr>
" around last curly brackets
onoremap al{ :normal! F}va{<cr>
" around next curly brackets
onoremap an{ :normal! f{va{<cr>

"-- Markdown head
onoremap ih :<C-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
onoremap ah :<C-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>

"-- if trailing whitespace, it will be highlight
nnoremap <Leader>ts :match ERROR /\v.* $/<CR>
"-- clear match highlight
nnoremap <Leader>th :match <CR>

"-- automatically insert \v for search open very magic mode
nnoremap <Leader>/ /\v

"-- marks
nnoremap <Leader>ms :marks abcdefghijklmnopqrstuvwxyz<CR>
nnoremap <Leader>mu :marks ABCDEFGHIJKLMNOPQRSTUVWXYZ<CR>

"-- jump
" nnoremap <Leader>] <C-]>
" nnoremap <Leader>[ <C-O>
" nnoremap <Leader>] <C-I>
" }}}


" Plugins --------------------- {{{
call plug#begin('~/.vim/plugged')

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'amiorin/vim-project'

" 移动
" Plug 'matze/vim-move'

" fzf 
Plug 'junegunn/fzf'

" vim-easyclip
Plug 'svermeulen/vim-easyclip'

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()

" vim-easyclip
let g:EasyClipShareYanks = 1
nnoremap gm m
" let g:EasyClipUseCutDefaults = 1

" airline statusline
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_y = ''
" }}}

" Autocommand -------------------- {{{
" Automatically source the Vimrc file on save"
augroup autosourcing
autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
" }}}
nnoremap nu :set nonu<CR>

" Filetype specific settings -------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker " default fold
    autocmd FileType vim setlocal foldlevelstart=0
    autocmd FileType vim setlocal foldlevel=0
augroup END

augroup filetype_php
    autocmd!
    autocmd FileType php setlocal commentstring=//\ %s
    " autocmd FileType php nnoremap <C-c> I// <Esc>
augroup END
" }}}


" Abbreviations -------------------- {{{
iabbrev aema fansheng0594@163.com
iabbrev atel 18513112827
iabbrev ast 000120289415
iabbrev agt 8888888518106979
iabbrev rcc "----------"<left><left><left><left><left><left>
cabbrev func function 
cabbrev efunc endfunction END
" }}}


" Status Line --------------------- {{{
"set laststatus=2
"" set statusline=%#Question#%#Question# "add group highlight
"set statusline=[b:%n] "buffer number
"set statusline+=\ %f "file name, in current directory
"set statusline+=\ \ %m "modified and modifiable
"set statusline+=%r "read only
"set statusline+=%= "align right
"set statusline+=%l/%L "current/total line
" }}}


" Functions --------------------- {{{
"function Table(title, ...)
"    echohl Title
"    echo a:title
"    echohl None
"    echo a:0 . " items:"
"    for s in a:000
"      echom ' ' . s
"    endfor
"endfunction
" }}}




