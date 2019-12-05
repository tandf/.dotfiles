"""""""""""""""""""""""""Vundle"""""""""""""""""""""""""
set nocompatible              " ȥ�� VI һ���ԣ�����
filetype off                  " ����

" ���ð��� vundle �ͳ�ʼ����ص� runtime path
if has("win32")
    set rtp+=E:/Software/Vim/vimfiles/bundle/Vundle.vim
    call vundle#begin("E:/Software/Vim/vimfiles/bundle")
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

" �� vundle �������汾������
Plugin 'VundleVim/Vundle.vim'

" �뽫��װ������������ vundle#begin �� vundle#end ֮�䡣

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

" ������в����Ҫ����������֮ǰ
call vundle#end()            " ����
filetype plugin indent on    " ���� ���� vim �Դ��Ͳ����Ӧ���﷨���ļ�������ؽű�
" ���Ӳ���ı�����������ʹ�����������
filetype plugin on
"
" ��Ҫ�����ĵ�
" :PluginList       - �г����������õĲ��
" :PluginInstall    - ��װ�����׷�� `!` ���Ը��»�ʹ�� :PluginUpdate
" :PluginSearch foo - ���� foo ; ׷�� `!` ������ػ���
" :PluginClean      - ���δʹ�ò������Ҫȷ�ϣ�׷�� `!` �Զ���׼�Ƴ�δʹ�ò��
"
" ���� :h vundle ��ȡ����ϸ�ں� wiki �Լ� FAQ
" �����Լ��ķǲ��Ƭ�η�������֮��
"""""""""""""""""""""""""Vundle"""""""""""""""""""""""""

" Taboo
let g:taboo_tab_format=" [%f]%U%m "
let g:taboo_renamed_tab_format= " [%l]%U%m "

" Nerdcommenter
let g:NERDSpaceDelims=1

" Highlight the 71th character
set colorcolumn=71

" leader ��
let mapleader=","

" �� f{char}�� back ����ӳ�䵽"\"�ϣ�","�䵱 leader
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

" ��������
syntax enable

" �����ļ������ʽ
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1,gbk,gb18030,gk2312
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
" ����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" ��� console ��ʾ��Ϣ�������
language messages zh_CN.utf-8

" ��Сд����
set ignorecase
set infercase
set smartcase

" �������������ʱ�����ø���
noremap n :set hlsearch<CR>n
noremap N :set hlsearch<CR>N
noremap / :set hlsearch<CR>/
noremap ? :set hlsearch<CR>?
noremap * *:set hlsearch<CR>N
noremap # #:set hlsearch<CR>N
"" �����һ��ʱ�䱣�ֲ����ˣ��ͽ��ø���
"autocmd cursorhold * set nohlsearch
" <C-l>�ֶ��رո���
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" ������ͬʱ��ʱ��ʾ���
set incsearch
" ���� <leader>n ͳ��ƥ�����
nnoremap <leader>n :set hlsearch<CR>:%s///gn<CR><C-o>

" gui ����
set guifont=Consolas:h12:cANSI
" ����ʾ�˵�����������������
set guioptions-=TrLm
" ȡ���߿�
set go=
" ָ����ʾ
set mouse=a
" ��ʾ���λ�á���ʾ�к�
set ruler
set number
" ���͵ײ�����
set scrolloff=5
" ��ɫ����
" colors koehler
set t_Co=256
set background=dark
colorscheme solarized
" ǳɫ������ǰ�С���
set cursorline
set cursorcolumn

source $VIMRUNTIME/mswin.vim
behave mswin

" tab ������
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
autocmd FileType ruby setlocal softtabstop=2 tabstop=2 shiftwidth=2

" public: ������
set cino=g0

" ������
set nobackup

" �л��ļ�ǰ��һ��Ҫ���浱ǰ�ļ����˳�ʱѯ���Ƿ񱣴�
set hidden

" ��¼���λ�ã��´ο����ļ�ʱ�ƶ��������
augroup resCur
autocmd!
autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" ���ļ�ʱ�л����ļ�Ŀ¼
autocmd BufEnter * silent! lcd %:p:h

" ����Ĭ�Ͻ���Ϊʮ����
set nrformats=

" ���� Ex �����������
set history=1000

" ȡ��<C-V>��ݼ���ʹ�� Visual Block
unmap <C-V>
iunmap <C-V>
" ȡ��<C-A>��ݼ���ʹ�üӼ�����
unmap <C-A>
iunmap <C-A>
" ȡ��<C-Y>
unmap <C-Y>
iunmap <C-Y>

if has("win32")
    " ȡ��<C-H>
    unmap <C-H>
    iunmap <C-H>
    " ȡ��<C-F>
    unmap <C-F>
    iunmap <C-F>
endif

" ��������������� %% �滻Ϊ��ǰĿ¼
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

" �������д��� ʹ��<C-p>��<C-n>��ȫ���<Up>��<Down>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" ��ȫ�˵�����
set wildmode=list:longest

" pangu.vim ����Զ���ӿո�
"autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

" ���� matchit �����ʹ�� % ƥ��ؼ���
packadd! matchit

" ƴд�������Ϊ��Ӣ��
set spelllang=en,cjk
" <leader>s �򿪡��ر�ƴд���
nnoremap <leader>s :set invspell<CR>:set spell?<CR>

" markdown-preview ����������
let g:mkdp_auto_close=0

" Ĭ�ϻ������
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
" ��� <NOTE>
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
