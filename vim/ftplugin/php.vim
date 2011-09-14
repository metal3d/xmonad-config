" Set php lint on save, ctags completion etc...

au! BufWriteCmd *.php call PHPsynCHK()

setl makeprg=php\ -l\ %
setl errorformat=%m\ in\ %f\ on\ line\ %l


noremap <silent> <F4> :!ctags -f ./tags --langmap="php:+.inc" -h ".php.inc" -R --totals=yes --tag-relative=yes --PHP-kinds=+cf-v .<CR>
setl tags=./tags,tags

function! PHPsynCHK()
    w
    silent make
    TlistClose
    cw
    Tlist
    TlistUpdate
endfunction

