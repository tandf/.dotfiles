"""""""""""""""""""""""""vim-plug"""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'hotoo/pangu.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'mzlogin/vim-markdown-toc'
Plug 'nelstrom/vim-visual-star-search'
Plug 'overcache/NeoSolarized'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
call plug#end()
"""""""""""""""""""""""""vim-plug"""""""""""""""""""""""""

" Use clang-format
autocmd FileType c,cpp setlocal equalprg=clang-format

" Automatically reload changed content
autocmd FocusGained * silent! checktime

function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
    exec 'silent %s///g'
  endif
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)

" Set default shell
if has("win32")
    set shell=cmd
    " set shell=powershell
    " set shellquote= shellpipe=\| shellxquote=
    " set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
    " set shellredir=\|\ Out-File\ -Encoding\ UTF8
else
    set shell=/bin/zsh
endif

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" Status line
set laststatus=2
set statusline=[%n]\ %F\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=
set statusline+=%{GetWordCount()}col:\%c\ line:%l/%L\ %P
function! GetWordCount()
    if &filetype=='markdown'
        return 'words:' . wordcount()['words'] . ' '
    end
    return ''
endfunction

" Taboo
let g:taboo_tab_format=" [%f]%U%m "
let g:taboo_renamed_tab_format= " [%l]%U%m "

" Nerdcommenter
let g:NERDSpaceDelims=1

" Highlight the 81th character
set colorcolumn=81

" leader 键
let mapleader=","

" 将 f{char}的 back 操作映射到"\"上，","充当 leader
noremap \ ,

" Reloading vimrc
command LoadVimrc so $MYVIMRC

" 开启高亮
syntax enable

" 设置文件编码格式
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1,gbk,gb18030,gk2312
" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决 console 提示信息输出乱码
if has("win32")
    language messages zh_CN.utf-8
endif

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
" <C-l>手动关闭高亮
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" 搜索的同时即时显示结果
set incsearch
" 按下 <leader>n 统计匹配个数
nnoremap <leader>n :set hlsearch<CR>:%s///gn<CR><C-o>

" gui 设置
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
set t_Co=256
set background=dark
" Using solarized
if has("win32")
    colorscheme NeoSolarized
endif


" 浅色高亮当前行、列
set cursorline
set cursorcolumn

if !has("mac")
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

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

if !has("mac")
    " 取消<C-V>快捷键以使用 Visual Block
    unmap <C-V>
    iunmap <C-V>
    " 取消<C-A>快捷键以使用加减操作
    unmap <C-A>
    iunmap <C-A>
    " 取消<C-Y>
    unmap <C-Y>
    iunmap <C-Y>
endif

" 将命令行中输入的 %% 替换为当前目录
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

" 在命令行窗口 使用<C-p>和<C-n>完全替代<Up>和<Down>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" 补全菜单设置
set wildmode=list:longest

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
nnoremap <C-N> /[%#/*<]*\s*TODO.*$<CR>:noh<CR>ztgn<C-G>
snoremap <C-N> <ESC>/[%#/*<]*\s*TODO.*$<CR>:noh<CR>ztgn<C-G>

" Python show 81th character
autocmd FileType python set colorcolumn=81
autocmd FileType python hi ColorColumn ctermbg=none ctermfg=255

map <F2> : call Save() <CR>
map <F7> : call Compile() <CR>
map <F9> : call Run() <CR>

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
        exec "!g++ % -o %< -std=c++0x -g -fdiagnostics-color=auto"
    else
        exec "!g++ % -o %< -std=c++0x -g -Wall -Wextra && size %<"
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
elseif &filetype=='perl'
    exec "!perl -w %"
endif
endfunc

func Run()
if &filetype=='python'
    if has("win32")
        exec "TabMessage :!python %"
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
    exec "go run %"
elseif &filetype=='perl'
    exec "!perl %"
elseif &filetype=='dosbatch' && has("win32")
    exec "!./%"
else
    if has("win32")
        exec "!./%<.exe"
    else
        exec "!./%<"
    endif
endif
endfunc
