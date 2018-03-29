set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

call plug#begin('~/.local/share/nvim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
call plug#end()

" Sync vim clipboard to desktop
set cb=unnamedplus

" Faster grep using pt
set grepprg=pt\ --nogroup\ --nocolor

" CTRLP config
let g:ctrlp_user_command = 'pt %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" vim-go
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

" Enable deoplete autocomplete
let g:deoplete#enable_at_startup = 1

" NERDTREE config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Lightline configuration
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ }

" vim-markdown-preview
let vim_markdown_preview_github=1
