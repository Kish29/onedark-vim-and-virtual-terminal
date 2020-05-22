" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

if filereadable("/etc/vim/.vim/plugin/NERD_tree.vim")
  source /etc/vim/.vim/plugin/NERD_tree.vim 
endif

if filereadable("/etc/vim/.vim/autoload/vim-plug/plug.vim")
  source /etc/vim/.vim/autoload/vim-plug/plug.vim 
endif 

" Vundleset ---------------------------------------------------------------------
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/etc/vim/.vim/bundle/Vundle.vim
call vundle#begin('/etc/vim/.vim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'xavierd/clang_complete'
Plugin 'Chiel92/vim-autoformat'
"press F6 to format code
Plugin 'Yggdroot/indentLine'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'Valloric/YouCompleteMe'

Plugin 'suan/vim-instant-markdown'

Plugin 'sheerun/vim-polyglot'

Plugin 'itchyny/lightline.vim'
"Plugin 'kannokanno/preview'
"Plugin 'tyru/open-browser.vim'
"Plugin '

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代
"filetype plugin on

call plug#begin('/etc/vim/.vim/plugged')
"Plug 'iamcco/mathjax-support-for-mkdp'
"Plug 'iamcco/markdown-preview.vim'
"Plug 'iamcco/markdown-preview.nvim', { 'do': {-> mkdp#util#install()}}
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
call plug#end()


nnoremap <F6> :Autoformat<CR>
let g:indentLine_enabled = 1
let g:autoformat_remove_trailing_spaces=4
let g:autoformat_retab=4
let g:indentLine_char='|'
let g:autoformat_autoindent=4



" 自动补全配置
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_global_ycm_extra_conf = "/etc/vim/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>

"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"关闭语法错误检测提示
let g:ycm_enable_diagnostic_signs=0
let g:ycm_enable_diagnostic_highlighting=0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 按jd跳转到定义处
"let g:ycm_key_invoke_completion = ''
"set completeopt=longest,menu
"let g:ycm_min_num_identifier_candidate_chars = 2
"let g:ycm_goto_buffer_command = 'horizontal-split'
"let g:ycm_seed_identifiers_with_syntax=1
map <F2> :YcmCompleter GoTo<CR>                           
" 按F2跳转到定义处
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>*'



" Uncomment to override defaults:

"By default, vim-instant-markdown will update the display in realtime. If that taxes your system too much, you can specify
" let g:instant_markdown_slow = 1


"By default, vim-instant-markdown will automatically launch the preview window when you open a markdown file. If you want to manually control this behavior, you can specify"
"let g:instant_markdown_autostart = 0

"By default, the server only listens on localhost. To make the server available to others in your network, edit your .vimrc and add
"let g:instant_markdown_open_to_the_world = 1


" By default, scripts are blocked. To allow scripts to run, edit your .vimrc and add
"let g:instant_markdown_allow_unsafe_content = 1


"By default, external resources such as images, stylesheets, frames and plugins are allowed. To block such content, edit your .vimrc and add
"let g:instant_markdown_allow_external_content = 0

"By default, no TeX code embedded within markdown would be rendered. This option uses MathJax and launches the node server as instant-markdown-d --mathjax.
let g:instant_markdown_mathjax = 1

"For troubleshooting, server startup and curl communication from Vim to the server can be logged into a file.
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'

"By default, browser is detected by instant-markdown-d depending on the OS. Starting with version instant-markdown-d>=0.2.0, you can set something like
" let g:instant_markdown_browser = firefox --new-window


"Choose a custom port instead of the default 8090.
"let g:instant_markdown_port = 8888

"By default, with version instant-markdown-d>=0.2.0, the live preview auto-scrolls to where your cursor is positioned. To disable this behaviour, edit your .vimrc and add
"let g:instant_markdown_autoscroll = 1

"let g:instant_markdown_python = 1


set title
" set bs=2
"设置行号
set nu
"语法高亮
syntax on
"显示尺标
set ruler
"设置tap键为4格
set tabstop=4
"设置
set softtabstop=4

set shiftwidth=4

set noexpandtab

"自动缩进
set autoindent

"没有备份
set nobackup
"没有临时文件
set swapfile
"设置NERDTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"设置选中行高亮
set cursorline
"autocmd VimEnter * NERDTree

if &term != "linux"
	set termguicolors
endif

colorscheme onedark

let g:lightline = {"colorscheme": "onedark",}
let g:airline = "onedark"

