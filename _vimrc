set nocompatible          "不要兼容vi
filetype off              "必须的设置：

"tab setting {
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"}

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set scrolloff=3
set fenc=utf-8
set autoindent
set hidden
set encoding=utf-8
set autoread
au CursorHold * checktime

set number                                    "显示行号
"autocmd! bufwritepost _vimrc source %         "自动载入配置文件不需要重启

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set wrap "自动换行
set ignorecase "设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch
set numberwidth=4          "行号栏的宽度
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
nmap mp @p<CR>

"修改leader键为逗号
let mapleader=","
imap jj <esc>

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

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

"使用<leader>空格来取消搜索高亮
nmap <leader><space> :noh<cr>

"html中的js加注释 取消注释
nmap <leader>h I//jj
nmap <leader>ch ^xx

"切换到当前目录
nmap <leader>cd :execute "cd" expand("%:h")<CR>:pwd<CR>

"取消粘贴缩进
nmap <leader>p :set paste<CR>
nmap <leader>pp :set nopaste<CR>

"my settings"
nmap <leader>e :edit!<cr>
nmap <leader>f :FixWhitespace<cr>
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>
nmap <leader>n :call ToggleLineNumbers()<cr>
" Toggle line numbers
function! ToggleLineNumbers()
    if(&number == 1)
        set number!
    else
        set number
    endif
endfunction

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
"Plug 'tpope/vim-sensible'
"Plug 'junegunn/seoul256.vim'

Plug 'vim-scripts/ctrlp.vim'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_working_path_mode = 'ra'
Plug 'vim-scripts/AutoClose'
Plug 'vim-scripts/Emmet.vim'
let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1
"Plug 'Valloric/YouCompleteMe'
"let g:ycm_complete_in_comments = 1
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
Plug 'vim-scripts/trailing-whitespace'
"displaying indent levels
"Plug 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_guide_size=1
Plug 'vim-scripts/EasyMotion'
let g:EasyMotion_leader_key = '<Leader><Leader>'
"let g:EasyMotion_keys = '1234567890'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:EasyMotion_do_shade = 0
Plug 'vim-scripts/EnhCommentify.vim'
"Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/The-NERD-tree'
"设置相对行号
nmap <leader>nt :NERDTree<cr>:set rnu<cr>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=1
"Plug 'jistr/vim-nerdtree-tabs'
"map <Leader>n <plug>NERDTreeTabsToggle<CR>
"Plug 'vim-scripts/xml.vim'
"let g:xml_syntax_folding = 1
Plug 'vim-scripts/SessionMgr'
"let g:SessionMgr_AutoManage = 0
let g:SessionMgr_AutoManage = 1
let g:SessionMgr_DefaultName = "mysession"
let g:SessionMgr_Dir = "/tmp"
Plug 'vim-scripts/LargeFile'
Plug 'vim-scripts/dbext.vim'
Plug 'danro/rename.vim'
"Plug 'alvan/vim-phpmanual'
Plug 'vim-scripts/BufOnly.vim'
"Plug 'vim-scripts/AnsiEsc.vim'
"Plug 'mileszs/ack.vim'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
set laststatus=2
"Plug 'honza/vim-snippets'
"let g:UltiSnipsExpandTrigger = "<nop>"
"inoremap <expr> <CR> pumvisible() ?"<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
Plug 'chr4/nginx.vim'
" List ends here. Plugins become visible to Vim after this call.
Plug 'https://github.com/ervandew/supertab.git'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <Leader>g :Rg<CR>
nnoremap <silent> <Leader>z :Files<CR>
nnoremap <leader>jt :w !python3 -mjson.tool %<CR>


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

filetype plugin indent on    " required
syntax on

set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
