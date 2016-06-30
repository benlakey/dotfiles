" BEGIN Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Lokaltog/powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'ap/vim-css-color'
Plugin 'despo/vim-ruby-refactoring'
Plugin 'kovisoft/slimv'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'wting/rust.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'mileszs/ack.vim'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rbenv'
Plugin 'hwartig/vim-seeing-is-believing'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elixir-lang/vim-elixir'
call vundle#end()
" END Vundle

let mapleader=","
set guifont=Menlo\ for\ Powerline
syntax on
filetype plugin indent on
set encoding=utf-8
set t_Co=256
colorscheme railscasts
set number
set expandtab
set tabstop=2
set shiftwidth=2
set noswapfile
set ruler
set ttimeoutlen=20
autocmd VimResized * wincmd =

" javascript
autocmd BufRead,BufNewFile *.js setfiletype javascript.jsx
autocmd BufRead,BufNewFile *.es6 setfiletype javascript.jsx
autocmd BufRead,BufNewFile *.coffee setfiletype javascript.jsx
let g:jsx_ext_required = 0
let g:xml_syntax_folding = 0

" spell check in markdown/rdoc files
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.markdown setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.rdoc setlocal spell spelllang=en_us

" BEGIN Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"Always show status bar
set laststatus=2 
"Defer to Powerline instead of standard status bar
set noshowmode 
" END Powerline

" BEGIN NERDTree
" use ctrl-n to open
map <C-n> :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=38
" END NERDTree

" BEGIN Rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
" END Rainbow parens

" BEGIN Scheme
autocmd filetype lisp,scheme,art setlocal equalprg=~/scmindent.rkt
" END Scheme

" share clipboard between vim/osx
set clipboard=unnamed

" dont auto-insert comments on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Ctrl-P
let g:ctrlp_show_hidden = 1
nnoremap <Leader>fu :CtrlPFunky<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

" silver searcher
let g:ackprg = 'ag --nogroup --column'
let g:ctrlp_user_command = 'ag %s -l -g ""'
set grepprg=ag\ --nogroup\ --path-to-agignore\ $HOME/.agignore
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" some shortcuts
:command! -nargs=? Rt !bundle exec rake test <f-args>
:command! -nargs=? Rspec !bundle exec rspec <f-args>
:abbrev rt Rt
:abbrev rspec Rspec

" vim-ruby
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1
inoremap <Nul> <C-x><C-o>

" seeing is believing
nmap <buffer> <S-r> <Plug>(seeing-is-believing-mark-and-run)

" buffer switching
nnoremap ` :b#<CR>