"ע�⣺1����vimrc��Ҫvim7.0���ϰ汾. vim�������ã�./configure --enable-cscope --enable-multibyte --enable-pythoninterp,����֧��cscope�Լ����ġ� ���� ./configure --with-features=huge --enable-pythoninterp
"      2������ļ�(��)������.vim .vimrc .cscope_ingorecase.sh
"      3��ctags��Ҫ5.6�汾����
"      4��cscope��װ��/usr/local/bin/Ŀ¼�£����߸���.cscope_ingorecase.sh����cscope��·��
"      5��taglist/cscope���÷����ڹ��̸�Ŀ¼(����Դ��ĸ�Ŀ¼)�´�����һ���ļ�������ģʽ�¼���',ctl'����taglist������',csc'����cscope�����ļ�
"      
"ginozhang 20141122 v3.1
" ���а�tab�����ǿո������: ע��Smart_TabComplete
" %������ͷ��β: py_jump.vim->~/.vim/ftplugin/python.vim http://www.vim.org/scripts/script.php?script_id=1392
" python�﷨���(Ҫ�����vimʱ֧��--enable-pythoninterp): pyflakes-vim.zip ��$HOME/.vim/�½�ѹ http://www.vim.org/scripts/script.php?script_id=2441
" �½�*.py�ļ��Զ�����ͷ�ļ�ע��

"ginozhang 20130906 v2.9
" ��������⣺csc����cscope�����ļ�����Ҫ�˳������±༭�ļ�����ʹ��"cscope e"������
" cscope e ֧�ֶԴ�д��ĸ������:���Զ�ת��ΪСд
"
"ginozhang 20130830 v2.8
" cscope����ƥ��ʱ֧�ִ�Сд������.see .cscope_ingorecase.sh
"
"ginozhang 20130814 v2.7
" ctags�汾��Ҫ5.6���ϣ�����typedef����Ľṹ���Զ���ȫ����(omnicppcomplet)�޷�ʶ�����
"
"ginozhang 20130814 v2.6
" �Զ���c��cpp��h�ļ�ͷ. ����ǰ�ļ���C_AuthorName��ֵ���޸��ļ�����, ģ���~/.vim/c-support/templates/h-file-header,~/.vim/c-support/templates/c-file-header.�ļ�ͷ�е�date��ʽ��.vim/plugin/c.vim��DATE����
"
"ginozhang 20130705
" ��Ҫvim7.0���ϰ汾,�������ã�./configure --enable-cscope --enable-multibyte
"
"ginozhang 2011.12.28 v1.5
"      �ļ�����ʱ�Զ�����taglist
"      ����cscope[,cs],�ļ�����ʱ�Զ�����cscope.����ĳ������������������ʹ��[,c]
"      ���Һ��Դ�Сд
"      ��ס�ϴδ򿪵�λ��
"      ������
"
"ginozhang 20110504 create: 
" ���ļ���vim��ҪԤ������������(��������Ϊ����)��
"      ��ɫ(�����۾�) colorscheme desert
"      ���ֵ�֧��
"      ����ģʽ��,ʹ��ctrl+������ƶ����
"      Statusline״̬����ʾ: ��ǰ·������ǰ�༭�ļ�����굱ǰ����
"      Text options.�����Զ�����
"      ����taglist[,ctl],����ϵͳ����taglist[,cts]
"      windows manager: �鿴�����б���ǰĿ¼�ļ��б�[wm]
"      ��ӶԺ�����ע��˵��[,cf]
"      �����ļ�ʱ�Զ�����ļ�(֧��pl,sh�ļ���ʽ)��ע��,c/c++��c.vim�Զ����
"      c.vim:���庯��[,if]����Ӻ������ļ�����ע��[,cfu]
"      a.vim: cpp/h�ļ�֮���л�. [,a]
"      tab���ܲ�ȫ����
"      OmniCppComplete: ��Ա�����������Զ���ʾ (��Ҫvim7.0���ϰ汾֧��)
"      ��������ƥ��,�Զ����������
"      NERD_commenter:����ע�͵����У�֧�ֶ����ļ���ʽ [,cm]
"
"
" vim��������: (����������������"vi/vim����ͼ")
"   һ������ģʽ��( ��esc��)
"      1. gd: ѡ�й�����ڵĵ���. ͨ��ʹ��n��������һ����ͬ����,NΪ��һ��
"      2. Ctrl-o: ��ת����һ�εĹ������λ�á���֮��Ӧ����: Ctrl-i
"      3. gf: �򿪹�����ڵ��ļ�(��Ҫtaglist��֧��)
"      4. gg: �����ļ�ͷ����֮��Ӧ�����ļ�β: G
"      5. f+'ĳ����ĸ': ��ת����ǰ��ĳ����ĸ��
"      6. Shift-v: ѡ�е�ǰ�С�Ctrl-v: ѡ����ĸ
"      7. ѡ��ģʽ��+=: ѡ���ж���
"      8. Ctrl+w+�����(h,l,j,k): ��Ļ֮����ת
"      9. 0: ������
"   ������������ģʽ (����ģʽ��+Shift+:)
"      1. vs+filename: ���ļ�,�������ļ����·��������ҷ���: sv
"      2. n,ms/regex/replace/gc: ��n�е�m���е�ƥ�䵽regex������ַ����滻��replace
"
"   ��������ģʽ (i,a,I,A)
"      1. Ctrl-backspace: ɾ��

"������ʾ����
set number

"Get out of VI's compatible mode..
" ������vi������ᶪʧ�ܶ�vim������
set nocompatible

"Sets how many lines of history VIM har to remember
set history=7000

"Enable filetype plugin.�����ļ��Զ�ʶ��
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread

"Enable syntax hl
syntax enable
"������ɫ
if has("gui_running")
    "ͼ�ν��������
    set guioptions-=T
    let psc_style='cool'
    colorscheme darkblue 
else
    set background=dark
    "colorscheme default 
    colorscheme desert
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���ֵ�֧�� -������configure vimʱ��Ҫ���ѡ�--enable-multibyte
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
set fileencodings=utf8,gb2312,utf-8,utf-16,ucs-bom,big5,latin1
set termencoding=utf8
set fencs=utf8,gbk 
""set encoding=chinese
""set langmenu=zh_CN.GB2312
""set imcmdline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ����ģʽ��,ʹ��ctrl+h����
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

"Set backspace. �˸�ʱ���Ƴ������ַ�
set backspace=eol,start,indent

""""""""""""""""""""""""""""""
" Statusline״̬��
""""""""""""""""""""""""""""""
"Always hide the statusline
set laststatus=2
" !��̾�ŵ��÷�: ��"help E127",���֮ǰ�д˺����������滻��
function! CurDir()
  let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
  return curdir
endfunction
" ��ȡ��ǰ������
function! ProjectDir()
  let projectDir = substitute(getcwd(), '.*/', "", "")
  return  projectDir
endfunction

"Format the statusline
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
let g:curdir=CurDir()
set statusline=%r%{g:curdir}%h\ %f\ %w\ %l/%L:%c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options.����
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
" ����������(safesrv)��taglist
" map <leader>cct :silent !ctags -R -f ~/.vim/commtags --c++-kinds=+p --fields=+iaS --exclude=*.js --extra=+q ~/safe_svr_lib_proj/trunk <cr>;<cr>:set tags+=~/.vim/commtags<CR>
map <leader>cct :silent !ctags -R -f ~/.vim/commtags --c++-kinds=+p --fields=+iaS --exclude=*.js --extra=+q ~/safe_svr_lib_proj/trunk ;<cr>:set tags+=~/.vim/commtags<CR>
"set tags+=~/.vim/commtags
" ����taglist,��ǰĿ¼������tags�ļ�
" map <leader>ctl :silent !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ../libsrc/ ./ <cr>
map <leader>ctll :silent !ctags -R -f .libtags --c++-kinds=+p --fields=+iaS --exclude=*.js --extra=+q ../libsrc/ <cr>
set tags+=.libtags
map <leader>ctl :call UpdateTag() <cr>
" set tags+=g:curdir/tagslist
" map <leader>ctl :silent !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q /usr/local/safe_svr/include <cr>
" ����ϵͳͷ�ļ�, ���ϵͳtags
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
"�´��ڴ��ļ� scs/vert scs
"map <leader>csf :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
map <leader>csf :scs find f <C-R>=expand("<cfile>")<CR><CR>
map <leader>css :cs find s <C-R>=expand("<cword>")<CR><CR>
map <leader>csu :cs find c <C-R>=expand("<cword>")<CR>
map <leader>csd :cs find d <C-R>=expand("<cword>")<CR><CR>
map <leader>cst :cs find t <C-R>=expand("<cword>")<CR><CR>
map <leader>csg :cs find g <C-R>=expand("<cword>")<CR><CR>

map <leader>csc :silent !find . ../libsrc ~/safe_svr_lib_proj/trunk -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" > cscope.files;cscope -bq;<cr>:call CallCscope()<CR>
map <leader>c :cs find g <C-R>=expand("<cword>")<CR><CR>

"�ļ�����ʱ�Զ�����tag,cscope
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
" ��ӶԺ�����˵��
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>cf :Dox<cr>
let g:DoxygenToolkit_licenseTag="My own license\<enter>" 
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK" 
let g:DoxygenToolkit_briefTag_pre = "��  ��: " 
let g:DoxygenToolkit_paramTag_pre = "��  ��: " 
let g:DoxygenToolkit_returnTag =    "����ֵ: " 
let g:DoxygenToolkit_briefTag_funcName = "no" 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"�����ļ�ʱ�Զ�����ļ���ע��,c/c++��c.vim(����ͨ��~/.vim/c-support/templates/c-file-header�ļ��޸���ʽ)���
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
  call append(lnum, "#dir=$(dirname $path); #��ǰ�ű�Ŀ¼" )
:let lnum=lnum+1
  call append(lnum, "" )
:let lnum=lnum+1
  call append(lnum, "#source $dir_tool/oneprocess.sh" )
:let lnum=lnum+1
  call append(lnum, "#fun_runone $0; #��ֻ֤��һ������" )
:let lnum=lnum+1
  call append(lnum, "" )
:let lnum=lnum+1
  call append(lnum, "#ip_local=$($dir_tools/getprivateip.pl); #����ip" )
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
  call append(lnum, '    echo "����: "' )
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
  call append(lnum, '#����' )
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
  call append(lnum, '#my $count=&InistanceCount("$0");#��ʵ��' )
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
  call append(lnum, '#my $ip_local=`$dir_tools/getprivateip.pl`;#����ip' )
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
" c.vim:�������ļ�ע��
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �Զ���c/c++�ļ�ͷע��
let g:C_AuthorName = "jaymiao"
"  map <leader>if :  ���c����
"  map <leader>im :  ���main����
"  map <leader>cfu :  ��Ӻ���ע��
"  map <leader>cfr :  ���ע��
"  map <leader>pd :  ��Ӻ궨��

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" a.vim: cpp/h�ļ����л�
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"��cpp/h�ļ����л�,���û�ж�Ӧ���ļ��򴴽�
map <leader>a :A <cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"omnicppcomplet�Զ���ȫ���� ֻ֧��vim7.0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"֧��.->���Զ���ȫ
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
"tab�������
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
"��������ƥ��,�Զ����������
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
"����ע�ͣ�֧�ֶ����ļ���ʽ NERD_commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>cc :����ע��
map <leader>cm :����ע��
" let NERDShutUp=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"���ܲ�ȫ OmniCppComplete 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists("completeopt")
  set completeopt=longest,menu
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���Դ�Сд,�����ڲ���
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ��ס�ϴδ򿪵�λ��
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g'\"" |
  \ endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ������
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <leader>0 ^
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>m :!make <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �ر�����ƥ�䴰��
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif 
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"�����۵� 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable 
"set foldmethod=syntax 
"set foldmethod=manual 
set foldmethod=indent 
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo') <CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QuickFix ����. cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>cw :cw <CR>
map <leader>cn :cn <CR>
map <leader>cp :cp <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pyflakes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
