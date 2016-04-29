"global-------------------------------------------------------------------{{{
set ic
"}}}
"lorscheme-------------------------------------------------------------------{{{
"colorscheme peachpuff#刺眼
"colorscheme elflord
"colorscheme lucius
"colorscheme freya
"colorscheme solarized
"colorscheme fine_blue
"colorscheme Tomorrow-Night-Blue
"colorscheme Tomorrow-Night-Bright
"colorscheme Tomorrow-Night-Eighties
"colorscheme Tomorrow-Night
"colorscheme Tomorrow
"}}}
"BASIC SET-----------------------------------------------{{{
"Make space more useful zediekj
set history=5000
set incsearch
set hls
set autoindent
set tabstop=4  
set shiftwidth=4  
set expandtab  
set ignorecase smartcase
set number "Bool option set no<name> OR set <name> | use! to switch status of bool value,for example set number!,this common will switch
set numberwidth=4
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>z :set cursorline! cursorcolumn!<CR>
"set mouse=a
"endif
set noeb
set nocompatible
filetype plugin on
syntax on

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
"}}}
"MAPS-----------------------------------------------{{{
let mapleader = ","  
let maplocalleader = "-"  "localleader-->especial filetype just as python/perl and so on CHPTER LEADER
inoremap <c-d> <esc>ddi
inoremap ; <esc>mqA;<esc>`qa
"nnoremap <space> za
inoremap kj <ESC>
inoremap <C-l> <esc>f"A
noremap <leader>d dd
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
noremap <space>" viw<esc>a"<esc>hbi"<esc>lel
noremap <space>_ viw<esc>a__<esc>hbi__<esc>lel
nnoremap H 0
nnoremap L g_
onoremap p i(   
onoremap in :<c-u>execute "normal! ?@\r:nohlsearch\rbviw"<cr>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <f8> :NERDTreeMirror<cr>
nnoremap <f8> :NERDTreeToggle<cr>
nnoremap gr gt
nnoremap av gg<s-V>G
"}}}
"Abbreviations-----------------------------------------------{{{
iabbrev adn and
iabbrev chomd chmod
iabbrev fct function
iabbrev rrn return
iabbrev ptr print
iabbrev 163 ourzizz@163.com
iabbrev qq 552716481@qq.com
iabbrev sfz 522401198508292031
iabbrev gmail ourzizz@gmail.com
iab date <c-r>=strftime("%y-%m-%d")<cr>
"}}}
"autocmd-----------------------------------------------{{{
augroup auto_cmd
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType python nnoremap <buffer> <F5> :w<cr>:!python %<cr>
    autocmd Bufreadpre *.vim :nnoremap <buffer> <F5> :w<cr>:source %<cr>

    autocmd FileType python nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType perl nnoremap <buffer> <F5> :w<cr>:!perl %<cr>
    autocmd FileType sh nnoremap <buffer> <F5> :w<cr>:!%<cr>
    "autocmd BufWritePre *.html :normal gg=G`.

    autocmd FileType python :iabbrev <buffer> iff if:<left>
    autocmd FileType javascript :iabbrev <buffer> iff if()<left>
    "autocmd FileType *.html :normal gg=G`.

augroup END

"}}}
"statulines-----------------------------------------------{{{
set statusline=%f          
set statusline+=%=        
set statusline+=%l        
set statusline+=/         
set statusline+=%L        
"}}}
"解决中文乱码--------------------------------------------------------------------{{{
"set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"set termencoding=utf-8
set encoding=utf-8
"}}}
"vundle---------------------------------------------------------{{{
" required!
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc('~/vimfiles/bundle/vundle/')
Bundle 'gmarik/vundle'
Bundle 'molokai'
Bundle 'evening_2'
Bundle 'kien/ctrlp.vim'
Bundle 'AutoClose'
Bundle 'matchit.zip'
Bundle 'less.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'godlygeek/tabular'
Bundle 'qiyu2580/vimcdoc'
Bundle 'vim-scripts/Emmet.vim'
Bundle 'auto_mkdir'
"---------------------------------------------"
" Track the engine.
Bundle 'SirVer/ultisnips'
"Bundle 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Bundle 'honza/vim-snippets'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"
" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"---------------------------------------------"
Bundle 'ervandew/supertab'
"Bundle 'hallettj/jslint.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Yggdroot/indentLine'
Bundle 'plasticboy/vim-markdown'
Bundle 'vcscommand.vim'
Bundle 'mhinz/vim-startify'
Bundle 'terryma/vim-expand-region'
Bundle 'tpope/vim-surround'
Bundle 'rking/ag.vim'
Bundle 'taiansu/nerdtree-ag'
Bundle 'heavenshell/vim-jsdoc'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'othree/xml.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'Lokaltog/vim-powerline'
Bundle 'einars/js-beautify'
Bundle 'Valloric/YouCompleteMe'
Bundle 'bufexplorer.zip'  
Bundle 'Lokaltog/vim-easymotion'
Bundle 'taglist.vim'
Bundle 'vimwiki'
let g:ycm_global_ycm_extra_conf = '~/vimfile/bundle/vundle/YouCompleteMe/cpp/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf ='~/vimfiles/bundle/vundle/YouCompleteMe/cpp'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:EasyMotion_leader_key = '<Space>'
filetype plugin indent on " required!
"}}}
"browser function------{{{
function! ViewInBrowser()
    let file = expand("%:p")
    exec ":update " . file
    let l:browsers = 'firefox'
    let htdocs='G:\\Apache\\htdocs\\'
    let strpos = stridx(file, substitute(htdocs, '\\\\', '\', "g"))"将所有斜杠转换为\
    echo strpos
    if strpos == -1
        exec ":!". browsers ." file://" . file
    else
        let file=substitute(file, htdocs, "http://127.0.0.1/", "g")
        let file=substitute(file, '\\', '/', "g")
        "        echo file
        exec ":!". browsers ." " . file
    endif
endfunction
nmap <f4> :call ViewInBrowser()<cr>
"}}}
"c/c++complite------{{{
func! CompileGcc()
    exec "w"
    let compilecmd="!gcc "
    let compileflag="-o %<.out -g "
    if search("mpi\.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
func! CompileGpp()
    exec "w"
    let compilecmd="!g++ "
    let compileflag="-o %<.out -g "
    if search("mpi\.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc

func! RunPython()
    exec "!python %"
endfunc
func! CompileJava()
    exec "!javac %"
endfunc

func! CompileCode()
    exec "w"
    if &filetype == "cpp"
        exec "call CompileGpp()"
    elseif &filetype == "c"
        exec "call CompileGcc()"
    elseif &filetype == "python"
        exec "call RunPython()"
    elseif &filetype == "java"
        exec "call CompileJava()"
    elseif &filetype == "sh"
        exec "!chmod a+x %"
    endif
endfunc

func! RunResult()
    exec "w"
    if search("mpi\.h") != 0
        exec "!mpirun -np 4 ./%<"
    elseif &filetype == "cpp"
        exec "! ./%<.out"
    elseif &filetype == "c"
        exec "! ./%<.out"
    elseif &filetype == "python"
        exec "call RunPython"
    elseif &filetype == "java"
        exec "!java %<"
    elseif &filetype == "sh"
        exec "!chmod 755 ./%"
        exec "!./%"
    endif
endfunc

map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR>
map <F6> :call RunResult()<CR>
nnoremap <F10> :!cgdb %< <CR>
"}}}
"wiki-----{{{
"let wiki = {}
"let wiki.path = '~/my_wiki/'
"let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
"let g:vimwiki_list = [wiki]
"}}}
"持久撤销---------------{{{
"http://wiki.ktmud.com/tips/Vim.html设置参考
let $VIMFILES=$HOME.'/.vim'
let $V=$HOME.'/.vimrc'
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=1000 "maximum number of changes that can be undone 撤销次数1000
"}}}
"cscope-------------{{{ 
"ZZ
"if fileradable("cscope.out")
"cs add csope.out
"elseif $CSCOPE_DB  != ""
"cs add $CSCOPE_DB
"endif
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    "if filereadable("cscope.out")
    "cs add cscope.out  
    " else add the database pointed to by environment variable 
    "elseif $CSCOPE_DB != ""
    "cs add $CSCOPE_DB
    "endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif
"}}}
