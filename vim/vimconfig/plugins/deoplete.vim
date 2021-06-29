" -------------- deoplete ---------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!

let g:python3_host_prog = "/usr/bin/python3"
" let g:deoplete#enable_yarp = 1 # deprecated
call deoplete#custom#option('yarp', v:true)
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#file#enable_buffer_path=1 deprecated

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

autocmd InsertEnter * call deoplete#enable()


"call deoplete#enable()

