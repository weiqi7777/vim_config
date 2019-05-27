set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'The-NERD-tree'
Plugin 'DoxygenToolkit.vim'

call vundle#end()
filetype plugin indent on
syntax on
filetype on

set nu


set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

color evening

set nobackup

set cursorline
set cursorcolumn

set mouse=a

set hlsearch
set wrap

" key remap
imap <C+h> <C+w>h
imap <C+j> <C+w>j
imap <C+k> <C+w>k
imap <C+l> <C+w>l
map ee :Explore<CR>

" fold
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>

" NERD tree
map <F2> :NERDTreeToggle<CR>  
let NERDTreeIgnore=['\.swp','\.o']
let NERDTreeWinPos = 'left'   " nerdtree display on left``


" mini buffer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

" doxygen tool
"doxygen toolkit 
map fg :Dox<cr>
let g:DoxygenToolkit_briefTag_pre="@function_name  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="lujun, lujun_1991@163.com"
let g:DoxygenToolkit_licenseTag="GPL 2.0"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved <enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

" taglist
let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的    
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim   
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联

" ctags
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags "add current directory's generated tags file
set tags+=~/work/sifive/freedom-u-sdk/linux/tags "add new tags file(刚刚生成tags的路径，在ctags -R 生成tags文件后，不要将tags移动到别的目录，否则ctrl+］时，会提示找不到源码文件)

" cscope
if has("cscope")
set csprg=/usr/bin/cscope
set csto=1
set cst
set nocsverb
" add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
set csverb
endif
