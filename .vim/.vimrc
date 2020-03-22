" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1
" syntax on
set autoindent

" 自定义 vim 快捷键 
" mac下 vim 的配置文目录件默认在 ~/.vimrc 
" mac下 vim 的插件安装或其它额外配置文件的目录在 ~/.vim/...

" 关闭 vi 兼容模式
set nocompatible

" 开启相关插件
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件载入相关缩进文件
filetype indent on 

let mapleader=" "

" 打开 vim 语法高亮
syntax on

" 显示行号
set number

" 设置光标所在行用横线标识
set cursorline

" 增强模式中命令行自动完成操作
set wildmenu

" 搜索的命令显示出来 看的清楚
set showcmd

" Tab 键的宽度
set tabstop=4
" 统一缩进为4
set shiftwidth=4

" 每次保存关闭后 再次打开时 光标定位到上一次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line ("$") | exe "normal! g'\"" | endif

" 保证光标上下有5行可以看到
set scrolloff=5

" 高亮搜索的关键字
set hlsearch
set incsearch
" 搜索完成后取消高亮
exec "nohlsearch"

" 搜索时不区分大小写
set ignorecase
set smartcase

" 自动换行
set wrap



"--------------------------- vim 改建操作-----------------------
" i 改为 h -> 此时 h 从普通模式进入编辑模式
noremap h i

" k 改为 i -> 此时 i 上移一位
noremap i k

" h 改为 j -> 此时 j 左移一位
noremap j h

" j 改为 k -> 此时 k 下移一位
noremap k j

" l 默认右移一位
"--------------------------- vim 改建操作-----------------------

"--------------------------- 分屏快捷键-------------------------
" sl -> 左右分屏 光标放在右边屏幕
map sl :set splitright<CR>:vsplit<CR>  
" sj -> 左右分屏 光标放在左边屏幕
map sj :set nosplitright<CR>:vsplit<CR>
" si -> 上下分屏 光标放在上边屏幕
map si :set nosplitbelow<CR>:split<CR>
" sk -> 上下分屏 光标放在下边屏幕
map sk :set splitbelow<CR>:split<CR>

" 空格 + i 光标移到上边屏幕
map <LEADER>i <C-w>k
" 空格 + k 光标移到下边屏幕
map <LEADER>k <C-w>j
" 空格 + j 光标移动到左边屏幕
map <LEADER>j <C-w>h
" 空格 + l 光标移动到右边屏幕
map <LEADER>l <C-w>l
" sv -> 从左右分屏切换为上下分屏
map sv <C-w>t<C-w>K
" sh -> 从上下分屏切换为左右分屏
map sh <C-w>t<C-w>L
"--------------------------- 分屏快捷键-------------------------

"----------------------------标签快捷键-------------------------
" tt -> 打开一个新的标签页
map tt :tabe<CR>
" tj -> 移动到前一个标签页
map tj :-tabnext<CR>
" tl -> 移动到后一个标签页
map tl :+tabnext<CR>
"----------------------------标签快捷键-------------------------

" 取消 s 的默认行为 此时 s 键在 vim 中不会触发任何行为
map s <nop>

" 设置 S 为保存修改
map S :w<CR>

" 设置 Q 不保存退出 vim
map Q :q<CR>

" 设置 R 刷行 .vimrc 配置文件
map R :source $MYVIMRC<CR>

" 插件管理器
call plug#begin('~/.vim/plugged')
	" 底部提示插件
 	Plug 'vim-airline/vim-airline'
	
	" 颜色插件
	Plug 'liuchengxu/space-vim-dark'

	" 文件列表插件 NERDTree
    Plug 'preservim/nerdtree'

	" NERDTree-git 给NERDTree增加git图标
    Plug 'Xuyuanp/nerdtree-git-plugin'

	" syntastic 代码错误提示
    Plug 'vim-syntastic/syntastic'

call plug#end()

" 应用颜色插件
colorscheme space-vim-dark

" NERDTree 文件列表插件配置
map ff :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" NERDTree-git 配置
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" syntastic 代码错误提示配置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
