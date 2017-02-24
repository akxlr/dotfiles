scriptencoding utf-8
set encoding=utf-8
set nocompatible

" ---- VUNDLE STUFF ----
" Vundle setup taken directly from Vundle github repo
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Colour scheme
Plugin 'altercation/vim-colors-solarized'

" Snipmate and dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Other plugins
Plugin 'Yggdroot/indentLine'                                   " Display line indents with |
Plugin 'PeterRincker/vim-argumentative'                        " Manipulate function arguments
Plugin 'tpope/vim-surround'                                    " Add/delete surrounding brackets etc
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'} " Pretty status bar at the bottom
Plugin 'vim-scripts/vim-auto-save'                             " Automatically save without :w
Plugin 'kien/ctrlp.vim'                                        " Find and open related files
Plugin 'JuliaLang/julia-vim'                                   " Vim support for Julia
Plugin 'vim-scripts/loremipsum'                                " :Loremipsum [WORDCOUNT] to insert placeholder text
Plugin 'triglav/vim-visual-increment'                          " <C-A> to increment multiple lines in visual block mode
Plugin 'godlygeek/tabular'                                     " :Tab[ularize] /,/r1c1l0 to align by comma, /r1c1l0 is optional and specifies alignment and spacing around delimiter. See :h Tabular
Plugin 'plasticboy/vim-markdown'
Plugin 'rstacruz/sparkup'                                      " Write HTML code faster
Plugin 'ap/vim-css-color'                                      " Display #aabbcc and other css colour strings in colour
Plugin 'valloric/MatchTagAlways'                               " Highlight matching HTML tag
" Plugin 'lervag/vimtex'                                         " LaTeX support
Plugin 'majutsushi/tagbar'                                     " Toggle class outline viewer with <F8>

Plugin 'vim-pandoc/vim-pandoc'                                 " R Markdown support
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'

" Plugin 'einars/js-beautify'                                    " Beautify HTML, CSS, JS
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'scottmcginness/vim-foldtext'                            " Better folding text that respects indent

" Useful Vundle commands
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" ---- END VUNDLE STUFF ----

" My vimrc functions - easier to write python than vimscript
pyfile ~/.vim/py_functions.py

set term=xterm-256color

set guifont=Inconsolata\ LGC\ for\ Powerline:h12

" Basic set up as per: nvie.com/posts/how-i-boosted-my-vim/

" change <leader> from \ to ,
let mapleader=","

" Quickly edit/reload vimrc, + sets focus to the last line of the file
" (removed for now as it was annoying)
nnoremap <leader>ev :tabe ~/.vim/vimrc<CR>
nnoremap <leader>sv :so ~/.vim/vimrc<CR>
nnoremap <leader>et :tabe ~/.tmux.conf<CR>

set tabstop=4                            " a tab is four spaces
set softtabstop=4
set expandtab                            " Use spaced instead of tabs
set backspace=indent,eol,start           " allow backspacing over everything in insert mode
set autoindent                           " always set autoindenting on
set copyindent                           " copy the previous indentation on autoindenting
set number                               " always show line numbers
set shiftwidth=4                         " number of spaces to use for autoindenting
set shiftround                           " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                            " set show matching parenthesis
set ignorecase                           " ignore case when searching
set smartcase                            " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                             " insert tabs on the start of a line according to shiftwidth, not tabstop
set nohlsearch                           " don't highlight search terms
set incsearch                            " show search matches as you type
set history=1000                         " remember more commands and search history
set undolevels=1000                      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                                " change the terminal's title
set visualbell                           " don't beep
set noerrorbells                         " don't beep
set nojoinspaces                         " Single space only after period when using auto align
set nobackup                             " Don't create backups and swap files
set noswapfile
set lazyredraw                           " Stops macros etc lagging
set list                                 " Show whitespace
set listchars=tab:»·,trail:·
set foldmethod=syntax                    " Folding options
set foldlevelstart=99
set autochdir                            " Automatically cd to current file - may cause problems with some plugins: http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set cursorline                           " Enable highlight on current cursor row
set scrolloff=10                         " Gap at top/bottom of screen
" Don't auto-comment when pressing enter or o
" autocmd BufNewFile,BufRead * setlocal formatoptions-=r
autocmd BufNewFile,BufRead * setlocal formatoptions-=o

let g:indentLine_char = '|'            " Character to use for indentLine plugin, couldn't get unicode working
let g:indentLine_faster = 1            " Otherwise indentLine plugin is unusably slow
let g:indentLine_color_term = 0        " Fix colour for terminal vim
let g:indentLine_color_gui = '#223344' " Fix colour for macvim

" Colour scheme
" 2014-11-24: vim-css-color plugin doesn't work in terminal unless this is 256, but seems to work in mvim
" anyway - so I've left it as 16 but can probably be changed to 256 if
" needed (might screw up solarized exact colours though)
set t_Co=16
set background=dark
colorscheme solarized

syntax on " Syntax highlighting

" Easy pasting from other apps
" nnoremap <F2> :set invpaste paste?<CR>
" set pastetoggle=<F2>
" set showmode

" Swap : and ;
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

" Bubble text around with arrow keys in normal mode
" TODO these don't work on first or last line in file - not sure why
nnoremap <UP> ddkP==
nnoremap <DOWN> ddp==
vnoremap <UP> xkP`[V`]=gv
vnoremap <DOWN> xp`[V`]=gv

" Use left and right to change tabs
nnoremap <Left> :tabp<CR>
nnoremap <Right> :tabn<CR>
inoremap <Left> <Esc>:tabp<CR>
inoremap <Right> <Esc>:tabn<CR>

map <Home> <Nop>
map <End> <Nop>

" When line is wrapped don't jump over it
nnoremap j gj
nnoremap k gk

" Mouse support - this was causing weird behaviour when in insert mode and
" switching between applications - each time it sent a whole string of random
" commands
"set mouse=a
"map <ScrollWheelUp> <C-Y>
"map <ScrollWheelDown> <C-E>

" 80, 120 column markers
" let &colorcolumn="81,".join(range(121,999),",")

" TODO: autocmd below still doesn't work - randomly goes back to autoformatting
" lines. Have removed set textwidth until I can work out the problem
" Text wrapping, use eg :set textwidth=120 to make wider
" set textwidth=80
" Don't wrap automatically. `set formatoptions-=t` by itself doesn't work:
" http://stackoverflow.com/a/8748154/3707400
" autocmd BufNewFile,BufRead * setlocal formatoptions-=t

" Fix broken highlighting
"hi link markdownItalic Normal

set laststatus=2 " Show powerline status bar
" Prevent powerline colour delay after leaving insert mode - note that this may
" cause problems since some legitimate characters that start with the escape
" sequence will be misinterpreted (eg arrow keys)
"set noesckeys
set timeout ttimeoutlen=10 timeoutlen=2000

" Open line with blank line above and below
nnoremap <leader>o O<Esc>o

" Paste from system clipboard
nnoremap <leader>p :set paste<CR>"+p:set nopaste<CR>
nnoremap <leader>P :set paste<CR>"+P:set nopaste<CR>

" Make vim recognize italics: http://stackoverflow.com/a/21077380/692456
set t_ZH=[3m
set t_ZR=[23m

" For iTerm2 (OSX)
highlight Comment cterm=italic

" Alt mappings for gnome-terminal - screws up when you actually press <Esc>j etc
"inoremap h <C-o>h
"inoremap j <C-o>j
"inoremap k <C-o>k
"inoremap l <C-o>l
"inoremap w <C-o>w
"inoremap b <C-o>b
"inoremap a <C-o>a
"inoremap o <C-o>o

" ,<space> to toggle comment: http://stackoverflow.com/a/24046914/3707400
let s:comment_map = {
    \   "c": '//',
    \   "cpp": '//',
    \   "go": '//',
    \   "java": '//',
    \   "javascript": '//',
    \   "json": '//',
    \   "php": '//',
    \   "python": '#',
    \   "ruby": '#',
    \   "julia": '#',
    \   "vim": '"',
    \   "tex": '%',
    \   "plaintex": '%',
    \   "r": '#',
    \ }
function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^" . comment_leader
            " Uncomment the line
            " ! is just instead of / so it doesn't conflict with // comments
            execute "silent s!^" . comment_leader . " " . "!!"
        else
            " Comment the line
            execute "silent s!^!" . comment_leader . " " . "!"
        endif
    else
        " echo "No comment leader found for filetype"
        let comment_leader = '#'
        if getline('.') =~ "^" . comment_leader
            " Uncomment the line
            " ! is just instead of / so it doesn't conflict with // comments
            execute "silent s!^" . comment_leader . " " . "!!"
        else
            " Comment the line
            execute "silent s!^!" . comment_leader . " " . "!"
        endif
    end
endfunction
" This respects indent, but is really annoying because it uncomments legit
" comments when commenting out large blocks
" function! ToggleComment()
"     if has_key(s:comment_map, &filetype)
"         let comment_leader = s:comment_map[&filetype]
"         if getline('.') =~ "^[\\t ]*" . comment_leader
"             " Uncomment the line
"             execute "silent s/^\\([\\t ]*\\)" . comment_leader . "/\\1/"
"         else
"             " Comment the line
"             execute "silent s/^\\([\\t ]*\\)/\\1" . comment_leader . "/"
"         endif
"     else
"         echo "No comment leader found for filetype '" . &filetype . "'"
"     end
" endfunction

nnoremap <leader><Space> :call ToggleComment()<cr>
vnoremap <leader><Space> :call ToggleComment()<cr>

" Open new, empty files in insert mode
" Commented out because it also runs for readonly buffers (PluginInstall,
" CommandT etc
" au BufNewFile * startinsert

let g:auto_save = 1 " enable AutoSave

" Y should match behaviour of D, C i.e. yank to end of line not yank whole line
nnoremap Y y$

" Write with sudo if file not opened with sudo
cmap w!! w !sudo tee > /dev/null %

" Wrap function call to end of line
function! WrapToEnd()
    if getline('.')=~#":$"
        " If line ends with :, put the ) before it
        call inputsave()
        normal v$hhSf
        call inputrestore()
    else
        normal v$hSf
    endif
endfunction
nnoremap F :call WrapToEnd()<cr>
" Remove function wrapper (relies on s from surround.vim)
nmap <leader>df diwds)

" Copy current line/s and paste as comment
nnoremap <leader>cc yyP :call ToggleComment()<cr>j^
vmap <leader>cc <leader><Space>gvyPgv<leader><Space>gvo<Esc>

" Python: Wrap or unwrap for loop with enumerate
" This is not perfect but works most of the time
function! PyEnumerate()
    if getline('.')=~#"^.*enumerate(.*):"
        execute 'silent s/for (\=.\{-}, \(.\{-}\))\= in enumerate(\(.*\)):/for \1 in \2:/g'
    else
        execute 'silent s/for \(.*\) in \(.*\):/for i, \1 in enumerate(\2):/g'
        " Put cursor on i
        normal ^fi
    endif
endfunction
nnoremap <leader>en :call PyEnumerate()<cr>

" TODO Python: print a variable like print("varname=",varname)

inoremap jk <Esc>
" This is really annoying when using j to move because it lags and can't see
" the selection - use Control-c instead to exit visual mode
" vnoremap jk <Esc>

" Save view (code folding etc) on exit
" au BufWinLeave *.* mkview
" au BufWinEnter *.* silent loadview

" Cleaner folding text: http://www.gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/
fu! CustomFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf
set foldtext=CustomFoldText()

" Space to create/toggle folds for HTML - TODO why doesn't syntax folding work for HTML?
" nnoremap <Space> @=(foldclosed('.')==-1?'zfat':'zd')<cr>
" For syntax folding
nnoremap <Space> za

" Don't underline fold text
hi Folded cterm=bold

" Easier moving between splits
" Reason we use C-Arrow rather than C-HJKL is because C-HJKL, C-S-HJKL are bound
" in tmux (and I use this more often than vim splits)
" _ 'maximises the split within the current layout'
" Don't need these with 2 splits, just use C-W W
map [D <C-Left>
map [B <C-Down>
map [A <C-Up>
map [C <C-Right>
noremap <C-Left> <C-W>h<C-W>_
noremap <C-Down> <C-W>j<C-W>_
noremap <C-Up> <C-W>k<C-W>_
noremap <C-Right> <C-W>l<C-W>_

nnoremap <Tab> <C-W>W


" Show definition in new vsplit
nnoremap <leader>sd gd:vsp<cr><C-O>
" Close other split
nnoremap <leader>sc <C-W>W:q<cr>

function! GetInput(prompt)
    call inputsave()
    let text = input(a:prompt)
    call inputrestore()
    return text
endfunction

" Replace selected text with variable name, and assign that variable on line above
function! ReplaceWithVar()
    let varname = GetInput("Replace with variable name: ")
    execute "normal" "gvc" . varname
    execute "normal" "O" . varname . " = "
    execute "normal" "p"
endfunction
vnoremap <leader>vv :call ReplaceWithVar()<cr>

" Use the current line as a template. Expand
"   f(%) + %
" to
"   f(string1) + string1
"   f(string2) + string2
" By <leader>tt %,string1,string2
" TODO: Extend this to work in visual mode for multiline templates
function! ApplyTemplate()
    let data = split(GetInput("Comma separated list of data for template, first item is string to replace: "),",")
    for s in data
        normal yyP
        execute "silent s/" . data[0] . "/" . s . "/g"
        normal j
    endfor
    normal dd
endfunction
nnoremap <leader>tt :call ApplyTemplate()<cr>

" Pretty comments with borders, width = total width to fill
" TODO: Toggle off, also only works with comment_leader length 1 (eg python,
" not C)
function! ToggleCommentBox(width)
    if has_key(s:comment_map, &filetype)
        if (a:width < len(getline('.')) + 4)
            echo "Line too wide"
        else
            let comment_leader = s:comment_map[&filetype]
            let leading_chars = (a:width - len(getline('.'))) / 2 - 1
            execute "normal 0" . leading_chars . "i" . comment_leader
            normal a 
            normal A 
            execute "normal " . leading_chars . "A" . comment_leader
            if (len(getline('.')) < a:width)
                execute "normal 0i" . comment_leader
            end
            execute "normal yyppVr" . comment_leader . "kkVr" . comment_leader . "j"
        endif
    else
        echo "No comment leader found for filetype"
    endif
endfunction
nnoremap <leader>cb :call ToggleCommentBox(80)<cr>
" Move between sections starting with ##
" TODO This should apply to comment_leader for other file types too
" Also, this is super dodgy - fix
nnoremap <C-J> jj/^##<cr>jzz
nnoremap <C-K> kk?^##<cr>kzz

" Python debugging
nnoremap <leader>do :execute "normal! o" . "print(\"" . ( line(".") + 1 . "\")" )<esc>
nnoremap <leader>di :python test_py()<cr>

" Enable folding for vim-latex - see `help latex`
" let g:tex_fold_enabled=1

" Conceal (for rendering latex as unicode) conflicts with indentline plugin,
" and is a massive pain in general so we disable it. If trying to get it
" working, the problem is that conceal is used for the bars in indentline
" which should be almost invisible. So recoloring with `hi Conceal ctermfg=12`
" or whatever would need to be run for latex files only, after everything else
" (with an autocmd, since vimrc runs *before* plugins) and this still screws
" up vertical indent bars in these files
let g:tex_conceal=""

let g:tagbar_compact = 1
let g:tagbar_foldlevel = 0
nnoremap <F8> :TagbarToggle<CR>

nnoremap c_ ct_

" Disable conceal feature globally
set cole=0
au FileType * setl cole=0 

" Ctags
set tags=./tags;/
nnoremap <leader>st :set tags+=$HOME/uni/honours/libdai/tags<cr>
nnoremap <C-]> g<C-]>

" Quick tab switching
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <leader>0 :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <leader>0 :exe "tabn ".g:lasttab<cr>

" Temp for debugging honours project
nnoremap <leader>s /eliminating var 7<cr>:vsp<cr><c-w><c-w>/eliminating var 7<cr>

" TODO
"      Folding:
"          Julia foldmethod=syntax bug: https://github.com/JuliaLang/julia-vim/issues/41
"          HTML syntax folding
"      Add argument to current function (move to right spot in function definition)
"      Visual mode ,tt
"      C-i no longer works to go forward in history after installing tagbar
"      Make gd go to actual definition (using tags?) instead of first
"      occurrence
"      Debug if statement in python: for each ==, print both sides and whether
"      they are equal
"      Use python for this vimrc instead of vimscript
"
"      Fix tab label length change when siwtching tabs, maybe use airline
"      instead of powerline
"
"      Paste over word (to avoid velp)
"
