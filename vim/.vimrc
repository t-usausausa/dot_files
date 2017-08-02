set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set number
set backspace=start,eol,indent
set hlsearch
set ambiwidth=double
syntax on

if has("autocmd")
    filetype on

    " set filetype=perl
    autocmd FileType php  setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType perl setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType rst setlocal ts=3 sts=3 sw=3 expandtab

    autocmd BufNewFile,BufRead *.rss setfiletype xml
    autocmd BufNewFile,BufRead *.psgi setfiletype perl
    autocmd BufNewFile,BufRead *.t setfiletype perl
    autocmd BufNewFile,BufRead *.psgi setfiletype perl
    autocmd BufNewFile,BufRead *.rst setfiletype rst
endif

"---------------------------
"" Start Neobundle Settings.
"---------------------------
"bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

"Required:
call neobundle#begin(expand('~/.vim/bundle/'))
  
"neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache.vim'

NeoBundle 'scrooloose/syntastic.git'

" color
NeoBundle 'sjl/badwolf'
call neobundle#end()

"Required:

colorscheme desert

filetype plugin indent on
 
"
"未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
"毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
  
"-------------------------
" End Neobundle Settings.
"-------------------------

"" neocomplcache

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"Use flake8 check
let g:syntastic_python_checkers = ["flake8"]

let NeoComplCache_EnableCursorHoldI = 0

" For cursor moving in insert mode(Not recommended)
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
