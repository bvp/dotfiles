set nocompatible

" colorscheme desert

" GUI settings {{{
if has('gui')
    if has('win32') || has('win64')
        let windows=1
        let vimfiles=$HOME . "/.vim"
        let $MYVIMRC="~/_vimrc"
        let sep = ";"
        set guifont=Lucida_console:h8:cRUSSIAN
        set langmenu=en_US
        let $LANG = 'en_US'
        source $VIMRUNTIME/menu.vim
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/vimrc_example.vim
        source $VIMRUNTIME/mswin.vim
        behave mswin
        set keymap=russian-jcukenwin
        set iminsert=0
    else
        let windows=0
        let vimfiles=$HOME . "/.vim"
        let $MYVIMRC="~/.vimrc"
        let sep = ":"
        set guifont=Terminus\ 10
    endif
endif

set guioptions-=T " Remove the tool bar
set guioptions-=r " Remove the right-hand scroll bar
set guioptions-=L " Remove the left-hand scroll bar
set guioptions-=m " Menu
set guioptions+=c " Отключаем графические диалоги
set guioptions-=e " Отключаем графические табы
" }}}
" UI settings {{{
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp866
set statusline=%<%f%h%m%r%{fugitive#statusline()}\ [%{getcwd()}]%=[%{&fileformat}/%Y]\ [%{&fileencoding}/%{&encoding}]\ [%l,%c%V\ %L]\ %p%%
" set statusline=%<%f%h%m%r\ %y%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ ascii:%b\ 0x%B\ pos:%o\ line:%l\/%L\ col:%c%V\ %P
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set tabpagemax=15
set showmode
set history=256  " Number of things to remember in history
set autowrite  " Writes on make/shell commands
set autoread
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed  " Yanks go on clipboard instead.
set pastetoggle=<F10> "  toggle between paste and normal: for 'safer' pasting from keyboard
set tags=./tags;$HOME " walk directory tree upto $HOME looking for tags
set cursorline
" }}}
" Modeline {{{
set modeline
set modelines=5 " default numbers of lines to read for modeline instructions
" }}}
" Backup {{{
set nowritebackup
set nobackup
set noswapfile
set directory=~/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
" }}}
" Buffers {{{
set hidden " The current buffer can be put to the background without writing to disk
" }}}
" Match and search {{{
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase   " be sensitive when there's a capital letter
set incsearch
" }}}
" Formatting "{{{
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0         " Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set backspace=indent,eol,start  " more powerful backspacing

set tabstop=2    " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

syntax on               " enable syntax
filetype plugin indent on             " Automatically detect file types.
" }}}
" Visual "{{{
set number  " Line numbers off
set showmatch  " Show matching brackets.
set hlsearch    " Highlight search
set matchtime=5  " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
set vb t_vb= " disable any beeps or flashes on error
set ruler  " Show ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI " Shortens messages
set anti
set showtabline=1
set gtl=%t gtt=%F
set t_Co=256
set nolist " Display unprintable characters f12 - switches
set listchars=tab:?\ ,eol:?,trail:?,extends:?,precedes:? " Unprintable chars mapping
" set listchars=tab:??
" set list
" set mouse-=a   " Disable mouse
" set mousehide  " Hide mouse after chars typed

set splitbelow
set splitright
" }}}
" Folding {{{
set foldenable " Turn on folding
set foldcolumn=1
set foldmethod=marker " Fold on the marker
set foldlevel=1 " Don't autofold anything (but I can still fold manually)
set foldlevelstart=1
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

" au FileType go,c,cpp setlocal foldmarker=/*,*/
au Syntax c,cpp,go,vim,xml,html,xhtml setlocal foldmethod=syntax
au Syntax c,cpp,vim,go,xml,html,xhtml,perl normal zR
" }}}
" Command and Auto commands " {{{
" Sudo write
" comm! W exec 'w !sudo tee % > /dev/null' | e!

" "Auto commands
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}                                set ft=gitcommit

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif " restore position in file

" au BufWinLeave ?* mkview
" au BufWinEnter ?* silent loadview
" au BufWritePost,BufLeave,WinLeave ?* mkview
" au BufReadPre ?* silent loadview

au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict
" }}}
" Key mappings " {{{
" Shortcut to rapidly togle `set list
" map <F2> :retab <CR> :w<CR>
nmap <leader>l :set list!<CR>

nnoremap <silent> <LocalLeader>rs :source $MYVIMRC<CR>
nnoremap <silent> <LocalLeader>rt :tabnew $MYVIMRC<CR>
nnoremap <silent> <LocalLeader>re :e $MYVIMRC<CR>
nnoremap <silent> <LocalLeader>rd :e ~/.vim/ <CR>

" Save
nmap <F4> :w!<CR>
imap <F4> <Esc>:w!<CR>
vmap <F4> <Esc>:w!<CR>

" Tabs
nnoremap <silent> <LocalLeader>[ :tabprev<CR>
nnoremap <silent> <LocalLeader>] :tabnext<CR>
" Duplication
vnoremap <silent> <LocalLeader>= yP
nnoremap <silent> <LocalLeader>= YP
" Buffers
nnoremap <silent> <LocalLeader>- :bd<CR>
nnoremap <F5> :buffers<CR>:buffer<space>
" Split line(opposite to S-J joining line)
nnoremap <silent> <C-J> gEa<CR><ESC>ew

set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
"nnoremap <F10> :b <C-Z>

" map <silent> <C-W>v :vnew<CR>
" map <silent> <C-W>s :snew<CR>

nnoremap # :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap * #

map <S-CR> A<CR><ESC>

" Control+S and Control+Q are flow-control characters: disable them in your terminal settings.
" $ stty -ixon -ixoff
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" show/Hide hidden Chars
map <silent> <F12> :set invlist<CR>

" generate HTML version current buffer using current color scheme
map <silent> <LocalLeader>2h :runtime! syntax/2html.vim<CR>

map <C-Y> set paste<CR>

" Moving around windows {{{
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h
" }}}

" Easier split navigation {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
" }}}
" Setting up Vundle {{{
" Install if not installed {{{
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif
" }}}
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Git {{{
Plugin 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>
Plugin 'mattn/gist-vim'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'
" }}}
" (HT|X)ml tool {{{
Plugin 'tpope/vim-ragtag' " }}}
" Utility {{{
"Plugin 'L9'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'bogado/file-line'
Plugin 'vim-scripts/Align'
Plugin 'kien/ctrlp.vim'
" Plugin 'joonty/vim-taggatron'
Plugin 'godlygeek/tabular'
Plugin 'thinca/vim-quickrun'
Plugin 'thinca/vim-poslist'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} 
Plugin 'uarun/vim-protobuf'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
" }}}
" BufExplorer {{{
Plugin 'jlanzarotta/bufexplorer'
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>
" }}}
"Plugin 'vim-scripts/FuzzyFinder' {{{
"let g:fuf_modesDisable = [] " 
"nnoremap <silent> <LocalLeader>h :FufHelp<CR>
"nnoremap <silent> <LocalLeader>2 :FufFileWithCurrentBufferDir<CR>
"nnoremap <silent> <LocalLeader>@ :FufFile<CR>
"nnoremap <silent> <LocalLeader>3 :FufBuffer<CR>
"nnoremap <silent> <LocalLeader>4 :FufDirWithCurrentBufferDir<CR>
"nnoremap <silent> <LocalLeader>$ :FufDir<CR>
"nnoremap <silent> <LocalLeader>5 :FufChangeList<CR>
"nnoremap <silent> <LocalLeader>6 :FufMruFile<CR>
"nnoremap <silent> <LocalLeader>7 :FufLine<CR>
"nnoremap <silent> <LocalLeader>8 :FufBookmark<CR>
"nnoremap <silent> <LocalLeader>* :FuzzyFinderAddBookmark<CR><CR>
"nnoremap <silent> <LocalLeader>9 :FufTaggedFile<CR>
" }}}
" Zoomwin {{{
Plugin 'ZoomWin'
noremap <LocalLeader>o :ZoomWin<CR>
vnoremap <LocalLeader>o <C-C>:ZoomWin<CR>
inoremap <LocalLeader>o <C-O>:ZoomWin<CR>
noremap <C-W>+o :ZoomWin<CR>
" }}}
" Ack {{{
Plugin 'mileszs/ack.vim'
noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>
" }}}
" tComment {{{
Plugin 'vim-scripts/tComment'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>
" }}}
" Command-T {{{
Plugin 'wincent/command-t'
let g:CommandTMatchWindowAtTop=1 " show window at top
" }}}
" Navigation {{{
Plugin 'gmarik/vim-visual-star-search'
" }}}
" Syntax {{{
Plugin 'scrooloose/syntastic'
" Plugin 'digitaltoad/vim-jade'
" Plugin 'wavded/vim-stylus'
"Plugin 'vim-scripts/vim-json-line-format'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'plasticboy/vim-markdown'
Plugin 'octol/vim-cpp-enhanced-highlight'
" }}}
" Themes {{{
Plugin 'spf13/vim-colors'
Plugin 'fatih/molokai'
Plugin 'morhetz/gruvbox'
let g:molokai_original = 1
let g:rehash256 = 1
" }}}
" TagBar {{{
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
" nnoremap <silent> <leader>tt :TagbarToggle<CR>
" }}}
" GoLang {{{
Plugin 'fatih/vim-go'
Plugin 'garyburd/go-explorer'
Plugin 'dgryski/vim-godef'
Plugin 'Blackrush/vim-gocode'

au BufRead,BufNewFile *.go set filetype=go
au BufNewFile *.go setlocal filetype=go fileencoding=utf-8 fileformat=unix
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>r :GoRun %<CR>

au FileType go nmap <Leader>i <Plug>(go-import)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

"let g:tagbar_type_go = { {{{
"            \ 'ctagstype' : 'go',
"            \ 'kinds'     : [
"            \ 'p:package',
"            \ 'i:imports:1',
"            \ 'c:constants',
"            \ 'v:variables',
"            \ 't:types',
"            \ 'n:interfaces',
"            \ 'w:fields',
"            \ 'e:embedded',
"            \ 'm:methods',
"            \ 'r:constructor',
"            \ 'f:functions'
"],
"            \ 'sro' : '.',
"            \ 'kind2scope' : {
"            \ 't' : 'ctype',
"            \ 'n' : 'ntype'
"            \ 
"},
"            \ 'scope2kind' : {
"            \ 'ctype' : 't',
"            \ 'ntype' : 'n'
"            \ 
"},
"            \ 'ctagsbin'  : 'gotags',
"            \ 'ctagsargs' : '-sort -silent'
"            \ 
"} }}}

" }}}
" NeoComplete {{{
Plugin 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
" }}}
" NeoSnippet {{{
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif
" }}}
" NERDTree {{{
Plugin 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 0
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode=0
let g:NERDTreeKeepTreeInNewTab = 1
" }}}
" NERD Commenter {{{
Plugin 'scrooloose/nerdcommenter'
" }}}
" Sauce {{{
Plugin 'joonty/vim-sauce'
let g:sauce_path = "~/.vimsauce"
" }}}
" BufferList {{{
Plugin 'roblillack/vim-bufferlist'
map <silent> <F3> :call BufferList()<CR>
" }}}
" GeekNote {{{
Plugin 'neilagabriel/vim-geeknote'
" }}}
call vundle#end()

syntax on
filetype plugin indent on     " required!

if iCanHazVundle == 0
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" }}}

" colorscheme gruvbox
colorscheme molokai

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Переключение раскладок и индикация выбранной в данный момент раскладки. {{{
" Переключение раскладок будет производиться по <C-F>
"
" При английской раскладке статусная строка текущего окна будет зеленого
" цвета, а при русской - красного.
function MyKeyMapHighlight()
    if &iminsert == 0
        hi StatusLine ctermfg=DarkGreen guifg=DarkGreen
    else
        hi StatusLine ctermfg=Red guifg=Red
    endif
endfunction

" Вызываем функцию, чтобы она установила цвета при запуске Vim'a
"call MyKeyMapHighlight()

" При изменении активного окна будет выполняться обновление
" индикации текущей раскладки
"au WinEnter * :call MyKeyMapHighlight()

"cmap <silent> <C-F> <C-^>
"imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
"nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
"vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
" }}}

" Задаем собственные функции для назначения имен заголовкам табов {{{
function! MyTabLine()
    let tabline = ''

    " Формируем tabline для каждой вкладки -->
    for i in range(tabpagenr('$'))
        " Подсвечиваем заголовок выбранной в данный момент вкладки.
        if i + 1 == tabpagenr()
            let tabline .= '%#TabLineSel#'
        else
            let tabline .= '%#TabLine#'
        endif

        " Устанавливаем номер вкладки
        let tabline .= '%' . (i + 1) . 'T'

        " Получаем имя вкладки
        let tabline .= ' %{MyTabLabel(' . (i + 1) . ')} |'
    endfor
    " Формируем tabline для каждой вкладки <--

    " Заполняем лишнее пространство
    let tabline .= '%#TabLineFill#%T'

    " Выровненная по правому краю кнопка закрытия вкладки
    if tabpagenr('$') > 1
        let tabline .= '%=%#TabLine#%999XX'
    endif

    return tabline
endfunction

function! MyTabLabel(n)
    let label = ''
    let buflist = tabpagebuflist(a:n)

    " Имя файла и номер вкладки -->
    let label = substitute(bufname(buflist[tabpagewinnr(a:n) - 1]), '.*/', '', '')

    if label == ''
        let label = '[No Name]'
    endif

    let label .= ' (' . a:n . ')'
    " Имя файла и номер вкладки <--

    " Определяем, есть ли во вкладке хотя бы один
    " модифицированный буфер.
    " -->
    for i in range(len(buflist))
        if getbufvar(buflist[i], "&modified")
            let label = '[+] ' . label
            break
        endif
    endfor
    " <--

    return label
endfunction

function! MyGuiTabLabel()
    return '%{MyTabLabel(' . tabpagenr() . ')}'
endfunction

set tabline=%!MyTabLine()
set guitablabel=%!MyGuiTabLabel()
" Задаем собственные функции для назначения имен заголовкам табов }}}

" Горячие клавиши скрытия/отображения меню {{{
function MyToggleMenu()
    let old_guioptions = &guioptions

    " Если меню в данный момент видимо
    if stridx(old_guioptions, 'm') != -1
        set guioptions-=m
    else
        set guioptions+=m
    endif
endfunction

cmap <F9> <ESC>:call MyToggleMenu()<CR>
imap <F9> <ESC>:call MyToggleMenu()<CR>
nmap <F9> :call MyToggleMenu()<CR>
vmap <F9> <ESC>:call MyToggleMenu()<CR>
" Горячие клавиши скрытия/отображения меню <--
" Меню }}}
