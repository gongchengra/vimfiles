set nocompatible          "不要兼容vi
filetype off              "必须的设置：

"Color Settings {
set colorcolumn=85           "彩色显示第85行
set t_Co=256                 "设置256色显示
set background=dark          "使用color solarized
set cursorline               "设置光标高亮显示
set cursorcolumn             "光标垂直高亮
set ttyfast
set ruler
" 配色方案
set backspace=indent,eol,start
"set background=dark
"colorscheme solarized
"colorscheme molokai
"colorscheme phd"
colorscheme desert
"colorscheme solarized
"colorscheme molokai
"colorscheme desert
"colorscheme wombat256
"colorscheme grb256
"colorscheme distinguished
"colorscheme github
"colorscheme jellybeans
"colorscheme railscasts
"colorscheme twilight
"colorscheme vividchalk
"colorscheme candy
"let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")
"exe 'so ' . mycolors[localtime() % len(mycolors)]
"unlet mycolors

let g:solarized_termtrans  = 1
let g:solarized_termcolors = 256
let g:solarized_contrast   = "high"
let g:solarized_visibility = "high"
"}
""
"tab setting {
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"}

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set scrolloff=3
set fenc=utf-8
"set spell spellang=en_us
set autoindent
set hidden
set encoding=utf-8
set autoread
au CursorHold * checktime

set number                                    "显示行号
""set undofile                                  "无限undo
"set nowrap                                    "禁止自动换行
autocmd! bufwritepost _vimrc source %         "自动载入配置文件不需要重启
"autocmd BufWritePost $MYVIMRC source $MYVIMRC "自动载入配置文件不需要重启

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"相对行号 要想相对行号起作用要放在显示行号后面
"set relativenumber
"自动换行
set wrap
"GUI界面里的字体，默认有抗锯齿
set guifont=Inconsolata:h15
"将-连接符也设置为单词
set isk+=-

set ignorecase "设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch

set numberwidth=4          "行号栏的宽度
"set columns=135           "初始窗口的宽度
"set lines=50              "初始窗口的高度
"winpos 620 45             "初始窗口的位置

set whichwrap=b,s,<,>,[,]  "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）

"set encryption method to blowfish
set cm=blowfish

"tabpage settings
ca e tabe
nmap th  :tabfirst<CR>
nmap tj  :tabnext<CR>
nmap tk  :tabprev<CR>
nmap tl  :tablast<CR>
nmap tt  :tabedit<Space>
nmap tn  :tabnext<Space>
nmap tm  :tabm<Space>
nmap td  :tabclose<CR>
nmap tc  :tabnew<CR>
"nmap <C-S-tab> :tabprevious<CR>
"nmap <C-tab>   :tabnext<CR>
"nmap <C-t>     :tabnew<CR>
"inoremap <C-S-tab> <Esc>:tabprevious<CR>i
"inoremap <C-tab>   <Esc>:tabnext<CR>i
"inoremap <C-t>     <Esc>:tabnew<CR>

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

"===================================================
"修改leader键为逗号
let mapleader=","
imap jj <esc>
xnoremap <leader>p :w !python<cr>

inoremap <C-R> <C-G>u<C-R>
inoremap <F1> <ESC>
nmap <F1> <ESC>
vnoremap <F1> <ESC>

"修改vim的正则表达
nmap / /\v
vnoremap / /\v

nmap bn :bn<cr>
nmap bp :bp<cr>
nmap bd :bd<cr>
nmap ls :ls<cr>

"使用tab键来代替%进行匹配跳转
nmap <tab> %
vnoremap <tab> %

"spell setting
"nmap <leader>s :set spell!
"nmap <leader>f 1z=

"折叠html标签 ,fold tag
nmap <leader>ft vatzf

"使用,v来选择刚刚复制的段落，这样可以用来缩进
nmap <leader>v v`]

"使用,w来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
nmap <leader>s <c-w>v<c-w>l
nmap <leader>sc <c-w>c
nmap <leader>sw <c-w>w

"tab切换
"nmap <leader>t gt
"nmap <leader>r gT

"使用<leader>空格来取消搜索高亮
nmap <leader><space> :noh<cr>

"html中的js加注释 取消注释
nmap <leader>h I//jj
nmap <leader>ch ^xx

"切换到当前目录
nmap <leader>cd :execute "cd" expand("%:h")<CR>:pwd<CR>

"搜索替换
"nmap <leader>s :,s///c

"取消粘贴缩进
nmap <leader>p :set paste<CR>
nmap <leader>pp :set nopaste<CR>

"文件类型切换
nmap <leader>fj :set ft=javascript<CR>
nmap <leader>fc :set ft=css<CR>
nmap <leader>fx :set ft=xml<CR>

"my settings"
"nmap <C-Space> <PageUp>
"nmap <Space> <PageDown>
"nmap <leader>be :exec '!'.getline('.')<CR>
"nmap <leader>ds :g/^\s*\n\s*$/d<CR>
"nmap <leader>dj :g/jpg/d<CR>
nmap <leader>d :g/^[\s ]*\n[\s ]*$/d<cr>
nmap <leader>e :edit!<cr>
nmap <leader>f :FixWhitespace<cr>
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>
cmap w!! w !sudo tee > /dev/null %
"设置隐藏gvim的菜单和工具栏 F2切换
set guioptions-=m
set guioptions-=T
"去除左右两边的滚动条
set go-=r
set go-=L

map <silent> <F2> :if &guioptions =~# 'T' <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=m <bar>
            \else <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=m <Bar>
            \endif<CR>

"Vundle Settings {

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlp.vim'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = 'ra'
Plugin 'AutoClose'
Plugin 'Emmet.vim'
let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1
Plugin 'Valloric/YouCompleteMe'
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
Plugin 'trailing-whitespace'
"displaying indent levels
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
Plugin 'EasyMotion'
let g:EasyMotion_leader_key = '<Leader><Leader>'
"let g:EasyMotion_keys = '1234567890'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:EasyMotion_do_shade = 0
Plugin 'EnhCommentify.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'joonty/vim-xdebug.git'
Plugin 'The-NERD-tree'
"设置相对行号
nmap <leader>nt :NERDTree<cr>:set rnu<cr>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=1
Plugin 'jistr/vim-nerdtree-tabs'
map <Leader>n <plug>NERDTreeTabsToggle<CR>
Plugin 'xml.vim'
let g:xml_syntax_folding = 1
Plugin 'SessionMgr'
"let g:SessionMgr_AutoManage = 0
let g:SessionMgr_AutoManage = 1
let g:SessionMgr_DefaultName = "mysession"
let g:SessionMgr_Dir = "/tmp"

Plugin 'LargeFile'
Plugin 'vim-scripts/dbext.vim'
Plugin 'danro/rename.vim'
"Plugin 'joonty/vdebug.git'
"let g:vdebug_options= {
"            \    "port" : 9999,
"            \    "server" : 'localhost',
"            \    "timeout" : 20,
"            \    "on_close" : 'detach',
"            \    "break_on_open" : 1,
"            \    "ide_key" : '',
"            \    "path_maps" : {},
"            \    "debug_window_level" : 0,
"            \    "debug_file_level" : 0,
"            \    "debug_file" : "",
"            \    "watch_window_style" : 'expanded',
"            \    "marker_default" : '⬦',
"            \    "marker_closed_tree" : '▸',
"            \    "marker_open_tree" : '▾'
"            \}

Plugin 'alvan/vim-phpmanual'
Plugin 'eshion/vim-sync'
autocmd BufWritePost * :call SyncUploadFile()
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'vim-scripts/AnsiEsc.vim'
Plugin 'mileszs/ack.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-airline/vim-airline'
Plugin 'eclim'
nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
set laststatus=2
call vundle#end()            " required
"}
filetype plugin indent on    " required
syntax on
"set synmaxcol=128
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
"set tags=./tags,tags
set tags=~/alan/tags,tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
autocmd BufNewFile *.c 0r ~/.vim/skeleton.c
autocmd bufnewfile *.c exe "1," . 10 . "g/File Name :.*/s//File Name : ".expand("%")
autocmd bufnewfile *.c exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%Y-%m-%d")
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"
autocmd Bufread,BufNewFile *.m setfiletype=objc
let @t='ititle:jj'
let @j='ititle:jj:5f2vlllllllllygg$pa-jj:3v$hygg$p0f2y$:Rename 0.txt'
let @k='ititle:jj:5vlllllllllygg$pa-jj:3v$hygg$p0f2y$:Rename 0.txt'
"let @u='i# -*- coding: utf-8 -*\n'
let @u='i# -*- coding: utf-8 -*q�kb'
