"注意：1、本vimrc需要vim7.0以上版本. vim编译配置：./configure --enable-cscope --enable-multibyte --enable-pythoninterp,用来支持cscope以及中文。 或者 ./configure --with-features=huge --enable-pythoninterp
"      2、打包文件(夹)包括：.vim .vimrc .cscope_ingorecase.sh
"      3、ctags需要5.6版本以上
"      4、cscope安装在/usr/local/bin/目录下，或者更改.cscope_ingorecase.sh里面cscope的路径
"      5、taglist/cscope的用法：在工程根目录(所有源码的根目录)下打开任意一个文件；命令模式下键入',ctl'创建taglist，键入',csc'创建cscope关联文件
"      
"ginozhang 20141122 v3.1
" 首行按tab键不是空格的问题: 注释Smart_TabComplete
" %跳到块头块尾: py_jump.vim->~/.vim/ftplugin/python.vim http://www.vim.org/scripts/script.php?script_id=1392
" python语法检测(要求编译vim时支持--enable-pythoninterp): pyflakes-vim.zip 在$HOME/.vim/下解压 http://www.vim.org/scripts/script.php?script_id=2441
" 新建*.py文件自动生成头文件注释

"ginozhang 20130906 v2.9
" 解决的问题：csc创建cscope关联文件后需要退出再重新编辑文件才能使用"cscope e"等命令
" cscope e 支持对大写字母的搜索:先自动转化为小写
"
"ginozhang 20130830 v2.8
" cscope正则匹配时支持大小写不敏感.see .cscope_ingorecase.sh
"
"ginozhang 20130814 v2.7
" ctags版本需要5.6以上，否则typedef定义的结构体自动补全功能(omnicppcomplet)无法识别变量
"
"ginozhang 20130814 v2.6
" 自定义c、cpp、h文件头. 给当前文件的C_AuthorName赋值可修改文件作者, 模板见~/.vim/c-support/templates/h-file-header,~/.vim/c-support/templates/c-file-header.文件头中的date格式见.vim/plugin/c.vim的DATE定义
"
"ginozhang 20130705
" 需要vim7.0以上版本,编译配置：./configure --enable-cscope --enable-multibyte
"
"ginozhang 2011.12.28 v1.5
"      文件更新时自动更新taglist
"      创建cscope[,cs],文件更新时自动更新cscope.查找某个函数、变量的引用使用[,c]
"      查找忽略大小写
"      记住上次打开的位置
"      软行首
"
"ginozhang 20110504 create: 
" 本文件的vim主要预设命令、插件如下(方括号中为命令)：
"      颜色(不伤眼睛) colorscheme desert
"      汉字的支持
"      插入模式下,使用ctrl+方向键移动光标
"      Statusline状态栏显示: 当前路径、当前编辑文件、光标当前行列
"      Text options.包括自动缩进
"      创建taglist[,ctl],包括系统函数taglist[,cts]
"      windows manager: 查看函数列表、当前目录文件列表[wm]
"      添加对函数的注释说明[,cf]
"      创建文件时自动添加文件(支持pl,sh文件格式)的注释,c/c++由c.vim自动完成
"      c.vim:定义函数[,if]，添加函数、文件功能注释[,cfu]
"      a.vim: cpp/h文件之间切换. [,a]
"      tab智能补全单词
"      OmniCppComplete: 成员变量、函数自动提示 (需要vim7.0以上版本支持)
"      括号智能匹配,自动添加右括号
"      NERD_commenter:智能注释掉多行，支持多种文件格式 [,cm]
"
"
" vim常用命令: (最基本的命令可下载"vi/vim键盘图")
"   一、命令模式下( 按esc键)
"      1. gd: 选中光标所在的单词. 通常使用n来跳到下一个相同单词,N为上一个
"      2. Ctrl-o: 跳转到上一次的光标所在位置。与之对应的是: Ctrl-i
"      3. gf: 打开光标所在的文件(需要taglist的支持)
"      4. gg: 跳到文件头。与之对应的是文件尾: G
"      5. f+'某个字母': 跳转到当前的某个字母上
"      6. Shift-v: 选中当前行。Ctrl-v: 选中字母
"      7. 选中模式下+=: 选中行对齐
"      8. Ctrl+w+方向键(h,l,j,k): 屏幕之间跳转
"      9. 0: 软行首
"   二、输入命令模式 (命令模式下+Shift+:)
"      1. vs+filename: 打开文件,与现有文件上下分屏。左右分屏: sv
"      2. n,ms/regex/replace/gc: 将n行到m行中的匹配到regex正则的字符串替换成replace
"
"   三、插入模式 (i,a,I,A)
"      1. Ctrl-backspace: 删除

"设置显示行数
set number

"Get out of VI's compatible mode..
" 不兼容vi，否则会丢失很多vim的特性
set nocompatible

"Sets how many lines of history VIM har to remember
set history=7000

"Enable filetype plugin.开启文件自动识别
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread

"Enable syntax hl
syntax enable
"设置颜色
if has("gui_running")
    "图形界面的设置
    set guioptions-=T
    let psc_style='cool'
    colorscheme darkblue 
else
    set background=dark
    "colorscheme default 
    colorscheme desert
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 汉字的支持 -依赖：configure vim时需要添加选项：--enable-multibyte
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
set fileencodings=utf8,gb2312,utf-8,utf-16,ucs-bom,big5,latin1
set termencoding=utf8
set fencs=utf8,gbk 
""set encoding=chinese
""set langmenu=zh_CN.GB2312
""set imcmdline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插入模式下,使用ctrl+h左移
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"inoremap <C-h> <left>
"inoremap <C-l> <Right>
"inoremap <C-j> <C-o>gj
"inoremap <C-k> <C-o>gk
"inoremap <C-a> <Home>
"inoremap <C-e> <End>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set so=7

"Set mapleader.
let mapleader = ","
let g:mapleader = ","

"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"Highlight search things
set hlsearch

"Set backspace. 退格时可移除所有字符
set backspace=eol,start,indent

""""""""""""""""""""""""""""""
" Statusline状态栏
""""""""""""""""""""""""""""""
"Always hide the statusline
set laststatus=2
" !感叹号的用法: 见"help E127",如果之前有此函数定义则替换掉
function! CurDir()
  let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
  return curdir
endfunction
" 获取当前工程名
function! ProjectDir()
  let projectDir = substitute(getcwd(), '.*/', "", "")
  return  projectDir
endfunction

"Format the statusline
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
let g:curdir=CurDir()
set statusline=%r%{g:curdir}%h\ %f\ %w\ %l/%L:%c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options.缩进
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>
au FileType html,python,vim,javascript setl shiftwidth=4
au FileType html,python,vim,javascript setl tabstop=4
au FileType java setl shiftwidth=4
au FileType java setl tabstop=4

set smarttab
set lbr
set tw=500
"Turn backup off
set nobackup
set nowb
set noswapfile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Switch to current dir
map <leader>cd :cd %:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 创建公共库(safesrv)的taglist
" map <leader>cct :silent !ctags -R -f ~/.vim/commtags --c++-kinds=+p --fields=+iaS --exclude=*.js --extra=+q ~/safe_svr_lib_proj/trunk <cr>;<cr>:set tags+=~/.vim/commtags<CR>
map <leader>cct :silent !ctags -R -f ~/.vim/commtags --c++-kinds=+p --fields=+iaS --exclude=*.js --extra=+q ~/safe_svr_lib_proj/trunk ;<cr>:set tags+=~/.vim/commtags<CR>
"set tags+=~/.vim/commtags
" 创建taglist,当前目录下生成tags文件
" map <leader>ctl :silent !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ../libsrc/ ./ <cr>
map <leader>ctll :silent !ctags -R -f .libtags --c++-kinds=+p --fields=+iaS --exclude=*.js --extra=+q ../libsrc/ <cr>
set tags+=.libtags
map <leader>ctl :call UpdateTag() <cr>
" set tags+=g:curdir/tagslist
" map <leader>ctl :silent !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q /usr/local/safe_svr/include <cr>
" 包含系统头文件, 添加系统tags
map <leader>cst :silent !ctags -R -f ~/.vim/systags --c++-kinds=+p --fields=+iaS --exclude=*.js --extra=+q /usr/include /usr/local/include <cr>
set tags+=~/.vim/systags
"set tags+=~/.vim/stltags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! CallCscope()
  if has("cscope")
    set csprg=~/.cscope_ingorecase.sh
    "set csprg=/usr/local/bin/cscope
    set csto=1
    set cst
    set nocsverb
    if  filereadable("cscope.out")
      cs add cscope.out 
    endif
    set csverb
    if has('quickfix')
      set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif
  endif
endfunc
call CallCscope()

map <leader>cse :cs find e <C-R>=tolower(expand("<cword>"))<CR>
"新窗口打开文件 scs/vert scs
"map <leader>csf :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
map <leader>csf :scs find f <C-R>=expand("<cfile>")<CR><CR>
map <leader>css :cs find s <C-R>=expand("<cword>")<CR><CR>
map <leader>csu :cs find c <C-R>=expand("<cword>")<CR>
map <leader>csd :cs find d <C-R>=expand("<cword>")<CR><CR>
map <leader>cst :cs find t <C-R>=expand("<cword>")<CR><CR>
map <leader>csg :cs find g <C-R>=expand("<cword>")<CR><CR>

map <leader>csc :silent !find . ../libsrc ~/safe_svr_lib_proj/trunk -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" > cscope.files;cscope -bq;<cr>:call CallCscope()<CR>
map <leader>c :cs find g <C-R>=expand("<cword>")<CR><CR>

"文件更新时自动更新tag,cscope
func! UpdateTag()
  "silent !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ../libsrc/ ./ 
  silent !ctags -R --c++-kinds=+p --fields=+iaS --exclude=*.js --extra=+q
  "silent !find . -name "*.c" -o -name "*.cpp" -o -name "*.h" > cscope.files;cscope -bq 
  "cscope add cscope.out
endfunc
"autocmd BufWrite *.cpp,*.h,*.c,*.hpp :call UpdateTag()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" windows manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set showmode
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:winManagerWindowLayout='TagList'
nmap wm :WMToggle<cr>


"----------------------------------------------------
"
"   minibufexplorer
"
"------------------------------------------------------
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 0
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerAutoUpdate = 0


nmap <C-k> :bd<cr>:bp<cr>
nmap <C-z> :bp<cr>
nmap <C-x> :bn<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 添加对函数的说明
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>cf :Dox<cr>
let g:DoxygenToolkit_licenseTag="My own license\<enter>" 
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK" 
let g:DoxygenToolkit_briefTag_pre = "描  述: " 
let g:DoxygenToolkit_paramTag_pre = "参  数: " 
let g:DoxygenToolkit_returnTag =    "返回值: " 
let g:DoxygenToolkit_briefTag_funcName = "no" 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"创建文件时自动添加文件的注释,c/c++由c.vim(可以通过~/.vim/c-support/templates/c-file-header文件修改样式)完成
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Addluareadme()
  call setline(1, "#!/usr/local/bin/luajit ")
  call append(1, "\--desc:")
  call append(2, "\--author: jaymiao")
  call append(3, "\--date: " . strftime("%Y-%m-%d"))
endf
map <leader>shc :call Addluareadme()<cr>
au BufNewFile *.lua :call Addluareadme()

function! Addfileinfo()
  call append(3, "@author: jaymiao")
  call append(4, "@date: " . strftime("%Y-%m-%d"))
  call append(5, "@description: " )
endf
function! Addshreadme()
  call setline(1,"#!/bin/bash")
  call append(1, "")
  call append(2, "<<COMMENT")
  call Addfileinfo()
  :let lnum=6
  call append(lnum, "COMMENT" )
:let lnum=lnum+1
  call append(lnum, "" )
:let lnum=lnum+1
  call append(lnum, "dir_tools='/usr/local/avs/public_tools'" )
:let lnum=lnum+1
  call append(lnum, "#path=$(readlink -f $0)" )
:let lnum=lnum+1
  call append(lnum, "#dir=$(dirname $path); #当前脚本目录" )
:let lnum=lnum+1
  call append(lnum, "" )
:let lnum=lnum+1
  call append(lnum, "#source $dir_tool/oneprocess.sh" )
:let lnum=lnum+1
  call append(lnum, "#fun_runone $0; #保证只有一个进程" )
:let lnum=lnum+1
  call append(lnum, "" )
:let lnum=lnum+1
  call append(lnum, "#ip_local=$($dir_tools/getprivateip.pl); #本地ip" )
:let lnum=lnum+1
  call append(lnum, '' )
:let lnum=lnum+1
  call append(lnum, "function usage()" )
:let lnum=lnum+1
  call append(lnum, "{" )
:let lnum=lnum+1
  call append(lnum, "    echo" )
:let lnum=lnum+1
  call append(lnum, '    echo "Usage: $0 [OPTION...] argv"' )
:let lnum=lnum+1
  call append(lnum, '    echo "功能: "' )
:let lnum=lnum+1
  call append(lnum, '    echo' )
:let lnum=lnum+1
  call append(lnum, '    echo "OPTION"' )
:let lnum=lnum+1
  call append(lnum, '    echo "  -h|--help                 help"' )
:let lnum=lnum+1
  call append(lnum, '    echo "  -t|--test                 test"' )
:let lnum=lnum+1
  call append(lnum, '    echo' )
:let lnum=lnum+1
  call append(lnum, '}' )
:let lnum=lnum+1
  call append(lnum, 'while [ $# -gt 0 ]; do' )
:let lnum=lnum+1
  call append(lnum, '    case "$1" in' )
:let lnum=lnum+1
  call append(lnum, '        "--help" | "-h")' )
:let lnum=lnum+1
  call append(lnum, '            usage; exit 0 ;;' )
:let lnum=lnum+1
  call append(lnum, '        "--test" | "-t")' )
:let lnum=lnum+1
  call append(lnum, '            shift; if [ $# -gt 0 ]; then test="$1"; fi ;;' )
:let lnum=lnum+1
  call append(lnum, '        *)' )
:let lnum=lnum+1
  call append(lnum, '            break;;' )
:let lnum=lnum+1
  call append(lnum, '    esac' )
:let lnum=lnum+1
  call append(lnum, '    shift;' )
:let lnum=lnum+1
  call append(lnum, 'done' )
:let lnum=lnum+1
  call append(lnum, '' )
:let lnum=lnum+1
  call append(lnum, '<<COMMENT' )
:let lnum=lnum+1
  call append(lnum, '#例子' )
:let lnum=lnum+1
  call append(lnum, 'if [ $# -ne 1 ]; then' )
:let lnum=lnum+1
  call append(lnum, '    usage' )
:let lnum=lnum+1
  call append(lnum, '    exit 0;' )
:let lnum=lnum+1
  call append(lnum, 'fi' )
:let lnum=lnum+1
  call append(lnum, 'COMMENT' )
endf
map <leader>shc :call Addshreadme()<cr>
au BufNewFile *.sh :call Addshreadme()
function! Addplreadme()
  call setline(1,"#!/usr/bin/perl -w")
  call append(1, "")
  call append(2, "=pod")
  call Addfileinfo()
  :let lnum=6
  call append(lnum, "=cut" )
:let lnum=lnum+1
  call append(lnum, "" )
:let lnum=lnum+1
  call append(lnum, "use strict;" )
:let lnum=lnum+1
  call append(lnum, "use Getopt::Long qw(:config pass_through);" )
:let lnum=lnum+1
  call append(lnum, "use File::Basename;" )
:let lnum=lnum+1
  call append(lnum, "#use lib '/usr/local/avs/public_tools/';" )
:let lnum=lnum+1
  call append(lnum, "#use zero_util qw( InistanceCount);" )
:let lnum=lnum+1
  call append(lnum, "" )
:let lnum=lnum+1
  call append(lnum, '#my $count=&InistanceCount("$0");#单实例' )
:let lnum=lnum+1
  call append(lnum, "#if($count>1){" )
:let lnum=lnum+1
  call append(lnum, '#print("Inistance_exist count: $count");' )
:let lnum=lnum+1
  call append(lnum, "#exit();" )
:let lnum=lnum+1
  call append(lnum, '#}' )
:let lnum=lnum+1
  call append(lnum, "" )
:let lnum=lnum+1
  call append(lnum, "#my $dir = dirname($0);" )
:let lnum=lnum+1
  call append(lnum, "my $programName = basename($0);" )
:let lnum=lnum+1
  call append(lnum, "my $usage = <<EOF;" )
:let lnum=lnum+1
  call append(lnum, "" )
:let lnum=lnum+1
  call append(lnum, "Usage: $0 [options] " )
:let lnum=lnum+1
  call append(lnum, "  -c|--cnt                            test int" )
:let lnum=lnum+1
  call append(lnum, "  -f|--file                            test string" )
:let lnum=lnum+1
  call append(lnum, "  -h|--help                            Show this help message" )
:let lnum=lnum+1
  call append(lnum, "" )
:let lnum=lnum+1
  call append(lnum, "EOF" )
:let lnum=lnum+1
  call append(lnum, "" )
:let lnum=lnum+1
  call append(lnum, "my ($showHelp, $test_file, $test_cnt)=(0,'', 0);" )
:let lnum=lnum+1
  call append(lnum, "my %options = ( " )
:let lnum=lnum+1
  call append(lnum, "        'h|help' => \\$showHelp," )
:let lnum=lnum+1
  call append(lnum, "        'f|file=s' => \\$test_file, " )
:let lnum=lnum+1
  call append(lnum, "        'c|cnt=i' => \\$test_cnt, " )
:let lnum=lnum+1
  call append(lnum, "    );" )
:let lnum=lnum+1
  call append(lnum, "GetOptions(%options);" )
:let lnum=lnum+1
  call append(lnum, "if ($showHelp) {" )
:let lnum=lnum+1
  call append(lnum, "    print $usage; " )
:let lnum=lnum+1
  call append(lnum, "    exit 1; " )
:let lnum=lnum+1
  call append(lnum, "}" )
:let lnum=lnum+1
  call append(lnum, "shift @ARGV||die \"$usage\\n\";" )
:let lnum=lnum+1
  call append(lnum, "" )
:let lnum=lnum+1
  call append(lnum, "#my $dir_tools='/usr/local/avs/public_tools';" )
:let lnum=lnum+1
  call append(lnum, '#my $ip_local=`$dir_tools/getprivateip.pl`;#本地ip' )
:let lnum=lnum+1
  call append(lnum, "#chomp $ip_local;" )
:let lnum=lnum+1
  call append(lnum, "" )
endf
map <leader>plc :call Addplreadme()<cr>
au BufNewFile *.pl :call Addplreadme()

function! Addpyreadme()
  call setline(1,"#!/usr/bin/python")
  call append(1, "# -*- coding: utf-8 -*- ")
  call append(2, "'''")
  call Addfileinfo()
  :let lnum=6
  call append(lnum, "'''" )
  :let lnum=lnum+1
  call append(lnum, "" )
  :let lnum=lnum+1
  call append(lnum, "import sys" )
  :let lnum=lnum+1
  call append(lnum, "" )
endf
map <leader>pyc :call Addpyreadme()<cr>
au BufNewFile *.py :call Addpyreadme()

function! Addcreadme()
  call setline(1,"/***************************************")
  call append(1, "@author: jaymiao")
  call append(2, "@date: " . strftime("%Y-%m-%d"))
  call append(3, "@description: " )
  call append(4, "***************************************/" )
endf
"au BufNewFile *.h :call Addcreadme()
"au BufNewFile *.c :call Addcreadme()
"au BufNewFile *.cpp :call Addcreadme()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" c.vim:函数、文件注释
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动砑觕/c++文件头注释
let g:C_AuthorName = "jaymiao"
"  map <leader>if :  添加c函数
"  map <leader>im :  添加main函数
"  map <leader>cfu :  添加函数注释
"  map <leader>cfr :  添加注释
"  map <leader>pd :  添加宏定义

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" a.vim: cpp/h文件中切换
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"在cpp/h文件中切换,如果没有对应的文件则创建
map <leader>a :A <cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"omnicppcomplet自动补全功能 只支持vim7.0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"支持.->的自动补全
"
"------------------------------------------------------
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 2
let OmniCpp_ShowScopeInAbbr = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_SelectFirstItem = 2
let OmniCpp_LocalSearchDecl = 1
let OmniCpp_DefaultNamespaces = ["std"]
let OmniCpp_DisplayMode = 1
let OmniCpp_ShowPrototypeInAbbr = 1
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"--------------------------------------------------------
"
"  grep.vim
"
"-------------------------------------------------------
nnoremap <silent> <F3> :Grep<CR>
"------------------------------------------------------------------------------
"Recognize C/C++/linux/ standard headers
"----------------------------------------------------------------------------
au BufEnter /usr/include/c++/4.6    setf cpp
au BufEnter /usr/include/*        setf cpp
au BufEnter /usr/include/linux    setf cpp

"----------------------------------------------------------------------------------
"Use C style indent
"-----------------------------------------------------------------------------------
set cindent
function! GnuIndent()
setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,0,u0,w1,m1
setlocal shiftwidth=2
setlocal tabstop=4
endfunction

au FileType c,cpp setlocal cinoptions=:0,g0,(0,w1 shiftwidth=4 tabstop=4 softtabstop=4
au FileType diff  setlocal shiftwidth=4 tabstop=4
au FileType html  setlocal autoindent indentexpr=
au FileType changelog setlocal textwidth=76

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tab智能完成
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Smart_TabComplete()
    let line = getline('.')                    
    let substr = strpart(line, -1, col('.')+1)
    let substr = matchstr(substr, "[^ \t]*$")
    if (strlen(substr)==0)                  
        return "\<tab>"
    endif
    let has_period = match(substr, '\.') != -1
    let has_slash = match(substr, '\/') != -1 
    if (!has_period && !has_slash)
        return "\<C-X>\<C-P>"                  
    elseif ( has_slash )
        return "\<C-X>\<C-F>"                 
    else
        return "\<C-X>\<C-O>"                
    endif
endfunction
"inoremap <tab> <c-r>=Smart_TabComplete()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"括号智能匹配,自动添加右括号
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"智能注释，支持多种文件格式 NERD_commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>cc :单行注释
map <leader>cm :多行注释
" let NERDShutUp=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"智能补全 OmniCppComplete 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists("completeopt")
  set completeopt=longest,menu
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 忽略大小写,可用于查找
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 记住上次打开的位置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g'\"" |
  \ endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 软行首
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <leader>0 ^
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>m :!make <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 关闭智能匹配窗口
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif 
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"代码折叠 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable 
"set foldmethod=syntax 
"set foldmethod=manual 
set foldmethod=indent 
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo') <CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QuickFix 窗口. cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>cw :cw <CR>
map <leader>cn :cn <CR>
map <leader>cp :cp <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pyflakes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
