"""""""""""""""""""""""""Vundle"""""""""""""""""""""""""
set nocompatible              " 去除 VI 一致性，必须
filetype off                  " 必须

" 设置包括 vundle 和初始化相关的 runtime path
if has("win32")
    set rtp+=E:/Software/Vim/vimfiles/bundle/Vundle.vim
    call vundle#begin("E:/Software/Vim/vimfiles/bundle")
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

" 让 vundle 管理插件版本，必须
Plugin 'VundleVim/Vundle.vim'

" 请将安装插件的命令放在 vundle#begin 和 vundle#end 之间。

Plugin 'KeitaNakamura/tex-conceal.vim'
Plugin 'Markdown'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'SirVer/ultisnips'
Plugin 'Solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'gcmt/taboo.vim'
Plugin 'honza/vim-snippets'
Plugin 'hotoo/pangu.vim'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/vim-easy-align'
Plugin 'lervag/vimtex'
Plugin 'mattn/emmet-vim'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tell-k/vim-autopep8'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载 vim 自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进，可以使用以下替代：
filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件，追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件，需要确认；追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和 wiki 以及 FAQ
" 将你自己的非插件片段放在这行之后
"""""""""""""""""""""""""Vundle"""""""""""""""""""""""""

" Taboo
let g:taboo_tab_format=" [%f]%U%m "
let g:taboo_renamed_tab_format= " [%l]%U%m "

" Nerdcommenter
let g:NERDSpaceDelims=1

" Highlight the 71th character
set colorcolumn=71

" leader 键
let mapleader=","

" 将 f{char}的 back 操作映射到"\"上，","充当 leader
noremap \ ,

" vim-easymotion shortcut
let g:EasyMotion_do_mapping = 0
" s{char} to move to {char}
nmap S <Plug>(easymotion-overwin-f)
" Move to line
nmap <Leader>l <Plug>(easymotion-bd-jk)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" vim-bookmarks
let g:bookmark_auto_close = 1
let g:bookmark_no_default_key_mappings = 1
nmap mm <Plug>BookmarkToggle
nmap mi <Plug>BookmarkAnnotate
nmap mn <Plug>BookmarkNext
nmap mp <Plug>BookmarkPrev
nmap ma <Plug>BookmarkShowAll
nmap mkk <Plug>BookmarkMoveUp
nmap mjj <Plug>BookmarkMoveDown
let g:bookmark_sign = '>>'
" Bookmark per project
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
" Finds the Git super-project directory.
function! g:BMWorkDirFileLocation()
    let filename = 'bookmarks'
    let location = ''
    if isdirectory('.git')
        " Current work dir is git's work tree
        let location = getcwd().'/.git'
    else
        " Look upwards (at parents) for a directory named '.git'
        let location = finddir('.git', '.;')
    endif
    if len(location) > 0
        return location.'/.'.filename
    else
        "return getcwd().'/.'.filename
        return $HOME.'/.vim-bookmarks'
    endif
endfunction

" Reloading vimrc
command LoadVimrc so $MYVIMRC

" 开启高亮
syntax enable

" 设置文件编码格式
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1,gbk,gb18030,gk2312
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决 console 提示信息输出乱码
language messages zh_CN.utf-8

" 大小写设置
set ignorecase
set infercase
set smartcase

" 当输入查找命令时，启用高亮
noremap n :set hlsearch<CR>n
noremap N :set hlsearch<CR>N
noremap / :set hlsearch<CR>/
noremap ? :set hlsearch<CR>?
noremap * *:set hlsearch<CR>N
noremap # #:set hlsearch<CR>N
"" 当光标一段时间保持不动了，就禁用高亮
"autocmd cursorhold * set nohlsearch
" <C-l>手动关闭高亮
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" 搜索的同时即时显示结果
set incsearch
" 按下 <leader>n 统计匹配个数
nnoremap <leader>n :set hlsearch<CR>:%s///gn<CR><C-o>

" gui 设置
set guifont=Consolas:h12:cANSI
" 不显示菜单、工具栏、滚动条
set guioptions-=TrLm
" 取消边框
set go=
" 指针显示
set mouse=a
" 显示光标位置、显示行号
set ruler
set number
" 光标和底部距离
set scrolloff=5
" 配色设置
" colors koehler
set t_Co=256
set background=dark
colorscheme solarized
" 浅色高亮当前行、列
set cursorline
set cursorcolumn

source $VIMRUNTIME/mswin.vim
behave mswin

" tab 键设置
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
autocmd FileType ruby setlocal softtabstop=2 tabstop=2 shiftwidth=2

" public: 不缩进
set cino=g0

" 不备份
set nobackup

" 切换文件前不一定要保存当前文件，退出时询问是否保存
set hidden

" 记录光标位置，下次开启文件时移动光标至此
augroup resCur
autocmd!
autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" 打开文件时切换到文件目录
autocmd BufEnter * silent! lcd %:p:h

" 设置默认进制为十进制
set nrformats=

" 设置 Ex 命令缓存区长度
set history=1000

" 取消<C-V>快捷键以使用 Visual Block
unmap <C-V>
iunmap <C-V>
" 取消<C-A>快捷键以使用加减操作
unmap <C-A>
iunmap <C-A>
" 取消<C-Y>
unmap <C-Y>
iunmap <C-Y>

if has("win32")
    " 取消<C-H>
    unmap <C-H>
    iunmap <C-H>
    " 取消<C-F>
    unmap <C-F>
    iunmap <C-F>
endif

" 将命令行中输入的 %% 替换为当前目录
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

" 在命令行窗口 使用<C-p>和<C-n>完全替代<Up>和<Down>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" 补全菜单设置
set wildmode=list:longest

" pangu.vim 插件自动添加空格
"autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

" 开启 matchit 插件，使用 % 匹配关键字
packadd! matchit

" 拼写检查语言为中英文
set spelllang=en,cjk
" <leader>s 打开、关闭拼写检查
nnoremap <leader>s :set invspell<CR>:set spell?<CR>

" markdown-preview 插件相关设置
let g:mkdp_auto_close=0

" 默认汇编语言
let asmsyntax="masm"

" vim-easy-align settings
xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

" move to the same place of another pane
nnoremap <c-w>w :call SwitchToAnotherPane()<CR>
func SwitchToAnotherPane()
    " If only one pane, split
    if winnr('$') == 1
        exec "vsplit"
    end
    exec 'normal! mH`H'
endfunc

" move in tabs
nnoremap H gT
nnoremap L gt

" find TODO
nnoremap <C-N> /\([%#/*]* \)\?TODO.*$<CR>:noh<CR>ztgn<C-G>
snoremap <C-N> <ESC>/\([%#/*]* \)\?TODO.*$<CR>:noh<CR>ztgn<C-G>

" emmet settings
" only for html css and markdown
let g:user_emmet_install_global = 0
autocmd FileType php,html,css,markdown,eruby EmmetInstall

" Python show 81th character
autocmd FileType python set colorcolumn=81
autocmd FileType python hi ColorColumn ctermbg=none ctermfg=255

" vimtex
let maplocalleader = ','
let g:tex_flavor='XeLaTeX'
if has("win32")
    let g:vimtex_view_general_viewer = "SumatraPDF"
else
    let g:vimtex_view_method='zathura'
endif
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
autocmd FileType tex nnoremap g<C-g> :VimtexCountWords<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
if has("win32")
    let g:UltiSnipsSnippetsDir = "E:/Software/Vim/vimfiles/bundle/ultisnips/UltiSnips"
else
    let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/UltiSnips"
endif

" ctags
set tags=tags;
set autochdir
nnoremap <c-]> g<c-]>

" cscope
set csre
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter * call LoadCscope()
set cscopequickfix=c-,d-,e-,g-,i-,s-,t-
noremap <leader>/ :cs f s <cword><CR>

" leetcode
command LT !leetcode test %
command LS !leetcode submit %

map <F2> : call Save() <CR>
map <F4> : !echo % <CR>
map <F7> : call Compile() <CR>
map <F9> : call Run() <CR>

"set makeprg=g++\ %\ -o\ %<\ -g\ -Wall\ -Wextra\ -DLAEKOV_LOCAL
func Save()
if &filetype=='javascript'
    set expandtab
elseif &filetype=='python'
    exec "Autopep8"
endif
call Highlight_marks()
exec "w"
endfunc

func Highlight_marks()
" 标记 <NOTE>
exec "match Todo /<.*NOTE.*>/"
endfunc
call Highlight_marks()

func Compile()
exec "w"
if &filetype=='cpp'
    if has("win32")
        exec "!g++ % -o %< -std=c++0x -g -Wall -Wextra -DLAEKOV_LOCAL && size %<.exe"
    else
        exec "!g++ % -o %< -std=c++0x -g -Wall -Wextra -DLAEKOV_LOCAL && size %<"
    endif
elseif &filetype=='c'
    exec "!gcc %  -o %< -g"
elseif &filetype=='pascal'
    exec "!fpc % -g"
elseif &filetype=='sh'
    exec "!chmod +x %"
elseif &filetype=='java'
    exec "!javac %"
elseif &filetype=='tex'
    exec "!xelatex %"
elseif &filetype=='ruby'
    exec "!ruby -c %"
endif
endfunc

func Run()
if &filetype=='python'
    if has("win32")
        exec "!start cmd /c \"python %\" & pause"
    else
        exec "!python3 %"
    endif
elseif &filetype=='sh'
    exec "!bash %"
elseif &filetype=='java'
    exec "!java %<"
elseif &filetype=='html'
    if has("win32")
        exec "!chrome %"
    else
        exec "!google-chrome ./%"
    endif
elseif &filetype=='tex'
    exec "!open %<.pdf"
elseif &filetype=='javascript'
    exec "!node %"
elseif &filetype=='markdown'
    exec "MarkdownPreview"
elseif &filetype=='ruby'
    exec "!ruby -w %"
elseif &filetype=='vb'
    exec "!%"
elseif &filetype=='go'
    exec "!start cmd /c \"go run %\" & pause"
else
    if has("win32")
        exec "!%<.exe"
    else
        exec "!./%<"
    endif
endif
endfunc
