call pathogen#infect()
call pathogen#helptags()

syntax on
set hlsearch
set foldmethod=syntax

colorscheme koehler

" Line numbers
set number
hi LineNr ctermbg=darkgrey

set showbreak=>\ wrap linebreak textwidth=0

" No tab characters, only spaces
set tabstop=4
set shiftwidth=4
set expandtab


highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

" Settings for plugin javascript-libraries-syntax.vim
let g:used_javascript_libs = 'underscore,jquery,backbone,requirejs'


"" Disabling while i test out the neocomplete
"Auto complete settings for plugin SyntaxComplete
"   if has("autocmd") && exists("+omnifunc") 
"autocmd Filetype * 
"    \   if &omnifunc == "" | 
"    \    setlocal omnifunc=syntaxcomplete#Complete | 
"    \   endif 
"    endif 

" Remapping for SyntaxComplete to work for ctrl-Space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Persistent undo history
set undodir=~/.vim/undohistory
set undofile

" Some personal remappings
map <S-Enter> O<Esc>j
imap jj <Esc> 

" Somehow this isn't automatic
set backspace=2


" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" This makes faster load time for when there is no XServer 
set clipboard=exclude:.*


