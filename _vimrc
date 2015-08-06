source $VIMPROJ/vimrc/_vimrc
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set ic

let mapleader=";"
"-----------------------------------------------------------------------------------------------
"doxygentoolkit config and map
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="duzhichaomail@gmail.com"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:Doxygen_enhanced_color=1
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_briefTag_post = ": "
let g:DoxygenToolkit_paramTag_post = " : "
let g:DoxygenToolkit_returnTag_post = " : "

map <F2>f :Dox<cr>
map <F2>a :DoxAuthor<cr>
map <F2>l :DoxLic<cr>


"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"map <A-[> :sp <CR>:exec("tag ".expand("<cword>"))<CR>

"------------------------------------------------------------------------------------------------
"自定义map
"------------------------------------------------------------------------------------------------
"map of jump between split windows
map <A-j> <C-W>j   
map <A-k> <C-W>k
map <A-h> <C-W>h
map <A-l> <C-W>l
map <A-t> <C-W>t
map <A-b> <C-W>b
map <A-s> <C-W>s
map <A-v> <C-W>v
"------------------------------------------------------------------------------------------------
"jump to defintion
nnoremap <A-]> <C-]>              
"jump back
nnoremap <A-o> <C-o>              
"jump forward
nnoremap <A-i> <C-i>              
"------------------------------------------------------------------------------------------------
"jump to header file and source file
nnoremap <leader>a :A<cr>
nnoremap <leader>va :vs<cr>:A<cr>
nnoremap <leader>sa :sp<cr>:A<cr>
"------------------------------------------------------------------------------------------------
"------------------------------------------------------------------------------------------------
"map of cscope 
"Find this C symbol
nnoremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR><Tab>   
"Find this definition
nnoremap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR><Tab>   
"Find functions calling this function
nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR><Tab>   
"Find functions called by this function
nnoremap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR><Tab>   
"Find this egrep pattern
nnoremap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR><Tab>   
"------------------------------------------------------------------------------------------------
"write file 
inoremap <M-e> <esc>:w<cr>
nnoremap <M-e> :w<cr>
"write and quit file
inoremap <A-q> <esc>ZZ
nnoremap <A-q> ZZ           
"------------------------------------------------------------------------------------------------
"same as <esc>
inoremap <M-c> <esc>              
"------------------------------------------------------------------------------------------------
"show the function name of current line
map F [[k"xy$``:echo @x<CR>        
"------------------------------------------------------------------------------------------------
"source the _vimrc
map <leader>ts :source ~/_vimrc<cr>    
"------------------------------------------------------------------------------------------------
map <F3> : call ModifiedComment() <CR>
map <F4> : call TestComment() <CR>
imap <C-y> <esc>:call MoveForward()<cr>
"------------------------------------------------------------------------------------------------
"call the test script function
map <leader>tt : call TmpTest() <CR>        
"------------------------------------------------------------------------------------------------
"the test script function
let g:dic = {}
let g:dic["a"] = "Funa"
let g:dic["b"] = "Funb"
function! Funa()
    echo "funa"
endfunction
function! Funb()
    echo "funb"
endfunction
function! TmpTest()
        let vim_proj=$VIMPROJ."/Tool"
        let cygwin_proj=$CYGWINPATH."/mintty.exe"
        let cmd= "! ".cygwin_proj." ".vim_proj."/test.sh"
        echo cmd
endfunction


"------------------------------------------------------------------------------------------------
"<F3> <F4> map
function! ModifiedComment()
    let line = line(".")-1
    let str = "//     modified:AlexDu  time:".strftime("%c")."  reason:"
    call append(line,str)
    exec "normal k"
    startinsert!
endfunction

function! TestComment()
    let line = line(".")
    let str = "// test log modified:AlexDu  time:".strftime("%c")."  begin"
    call append(line,str)
    let line3 = line(".")+1
    let str3 = "// test log modified:AlexDu  time:".strftime("%c")."  end"
    call append(line3,str3)
    exec "normal j"
    exec "normal o"
    startinsert!
endfunction

function! MoveForward()
    if col('.') == col('$') - 1
        startinsert! " `A`
    else
        normal l     " `l`
        startinsert  " `i`
    end
endfunction


 "------------------------------------------------------------------------------------------------------
 "bundle
 set nocompatible                " be iMproved
 filetype off                    " required!
 "set rtp+=$VIM/vimfiles/bundle/vundle/
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()
 
 " let Vundle manage Vundle
 Bundle 'gmarik/Vundle.vim'
 Bundle "https://github.com/vim-scripts/a.vim.git"
 "Bundle "https://github.com/Valloric/YouCompleteMe.git"
 
 "my Bundle here:
 "
 " original repos on github
 "Bundle "https://github.com/Valloric/YouCompleteMe.git"
 "..................................
 "Bundle 'AutoClose'
 "Bundle 'YouCompleteMe'
 " vim-scripts repos
 "..................................
 " non github repos
 " Bundle 'git://git.wincent.com/command-t.git'
 "......................................
 filetype plugin indent on

