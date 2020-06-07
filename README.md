# vim下c/c++配置

一直热衷于unix原生的vi(vim)编辑器，当前使用的vimrc是很早之前其他同事的版本，其中的插件都需要手工下载，都已经2020年了，已经有更优的解决方式了。刚好趁这次开发环境迁移上云的机会，重新折腾了下vim的开发配置。下面记录下相关操作过程，主要包括几个大的部分：

1. 升级vim到8.2版本：主要是优化了**popup windows**
2. 使用`vim-plug`管理使用插件，通过一个vimrc，自动安装所有依赖插件

## 1. vim源码安装到最新版(v8.2)

mac环境下，vim[官方下载页面](https://ftp.nluug.nl/pub/vim/unix/)，选择[vim-8.2.tar.bz2](https://ftp.nluug.nl/pub/vim/unix/vim-8.2.tar.bz2 ) 下载源码文件。之后执行如下操作：

```shell
# 解压源码文件
tar -jvxf vim-8.2.tar.bz2

cd vim82

# 查看编译支持的选项
./configure -h

# 编译选项配置: python2/3 perl ruby lua
# 如果报错，需要安装对应的依赖项，比如：ruby、python2、python3
./configure \
--enable-multibyte \
--enable-perlinterp=dynamic \
--with-ruby-command=/usr/local/bin/ruby \
--enable-pythoninterp=dynamic \
--with-python-config-dir=/usr/local/python2.7.18/lib/python2.7/config \
--enable-python3interp \
--with-python3-config-dir=/usr/local/python3.8.3/lib/python3.8/config-3.8-darwin \
--enable-cscope \
--enable-luainterp=yes \
--with-lua-prefix=/usr/local/ \
--enable-gui=auto \
--with-features=huge \
--enable-fontset \
--enable-largefile \
--disable-netbeans \
--enable-fail-if-missing \
--prefix=/usr/local/vim8.2
```

注意事项：

1. 如果没有[lua](https://www.lua.org/ftp/)、[python2](https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz)或[python3](https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz)，需要使用源码安装

## 2. 配置vimrc并安装相关插件

所有的vim插件都使用`vim-plug`管理，[安装方式](https://github.com/junegunn/vim-plug)如下：

```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

初始化的vimrc文件

```shell
let mapleader = ","

set nocompatible
set number
set history=7000

set background=dark
colorscheme desert

filetype plugin on
filetype indent on
syntax on

set incsearch
set ignorecase
set hlsearch
set wildmenu

" set tab to spaces
set expandtab
" tab equal spaces num
set tabstop=4
set shiftwidth=4
set softtabstop=4
map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>

set encoding=utf-8
set fileencodings=utf-8,gb2312,utf-8,utf-16,ucs-bom,big5,latin1
set termencoding=utf-8
set fencs=utf-8,gbk

set backspace=eol,start,indent

set foldmethod=syntax
set autoread

"nmap <C-k> :bd<cr>:bp<cr>
nmap <C-z> :bp<cr>
nmap <C-x> :bn<cr>

" get last open position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g'\"" |
  \ endif

"auto add bracket
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
":inoremap " ""<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

" Specify a directory for plugins
call plug#begin('~/.vim/plugin')
" 使用:A在.cpp文件和.h文件切换
Plug 'vim-scripts/a.vim'
" 常用的快捷操作
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" git相关
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" 文件窗口
Plug 'preservim/nerdtree'
Plug 'vim-scripts/winmanager'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'valloric/youcompleteme'
Plug 'rhysd/vim-clang-format'
Plug 'WolfgangMehner/c-support'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-airline/vim-airline'
"Plug 'drmingdrmer/vim-tabbar'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

let g:UltiSnipsExpandTrigger="<C-l>"
" 使用 tab 切换下一个触发点，shit+tab 上一个触发点
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
let g:UltiSnipsEditSplit="vertical"


let g:clang_format#command = "/home/data/software/clang+llvm-8.0.0-x86_64-linux-sles11.3/bin/clang-format"
let g:clang_format#detect_style_file = 1
"let g:clang_format#style_options = {
"            \ "AccessModifierOffset" : -4,
"            \ "AllowShortIfStatementsOnASingleLine" : "true",
"            \ "AlwaysBreakTemplateDeclarations" : "true",
"            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>cf :ClangFormat<CR>

nmap wm :NERDTreeToggle<CR>
let Tlist_Show_One_File=1
let g:NERDTree_title='NERD Tree'
let Tlist_Auto_Open=1
let g:winManagerWindowLayout='NERDTree|TagBar'
"nmap wm :WMToggle<CR>
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
```

后续再详细介绍相关插件的使用方式：比如git、snippets、youcompleteme
