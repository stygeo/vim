" Enable pathogen
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Enable line number
set number
" Highlight searches
set hlsearch

" Turn on syntax highlighting
syn on
" Autoindent new lines
set autoindent

" Use spaces instead of tabs
set expandtab
" Set tabs to 2 whitespaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
" Enable mouse support
set mouse=a


scriptencoding utf-8

" Set history to 1000
set history=1000

" Find as you type
set incsearch
" Case insensitive search
set ignorecase

" Bind NERDTreeToggle to \
map \ :NERDTreeToggle<CR>

" This mapping uses <cword> to get the word under the cursor, and searches for it in the current directory and all subdirectorie.
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

"This command based on VimTip483 uses <cword> to get the word under the cursor, but also uses % to limit the search to the current file only
command GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen

" Finally, this cabbrev uses CTRL-R CTRL-W to get the word under the cursor, limiting the search to files of the same type using expand("%:e")
cabbrev lvim
      \ lvim /\<lt><C-R><C-W>\>/gj
      \ **/*<C-R>=(expand("%:e")=="" ? "" : ".".expand("%:e"))<CR>
      \ <Bar> lw
      \ <C-Left><C-Left><C-Left>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

if has("autocmd")
  autocmd BufNewFile,BufRead Rakefile,Capfile,Gemfile,config.ru setfiletype ruby
  autocmd BufNewFile,BufRead *.styl setfiletype sass
  autocmd BufNewFile,BufRead *.jade setfiletype haml
  " Automatically delete fugitive buffers
  autocmd BufReadPost fugitive://* set bufhidden=delete

  autocmd User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif

endif

" Show branch in vim
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2


if has("gui_running")
  set guioptions=egmrt
  set guioptions-=r
  colorscheme solarized
  set bg=dark 

  " Highlight current line
  set cursorline
else
 " let g:solarized_termcolors=256
endif

