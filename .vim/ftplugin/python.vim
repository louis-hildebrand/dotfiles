" Replace tabs with spaces
set expandtab

augroup python_autoformat
	autocmd!
	autocmd BufWritePost * silent !isort --quiet %
	autocmd BufWritePost * silent !black --quiet %
	" Automatically reload: https://stackoverflow.com/a/64403990
	autocmd BufWritePost * edit
	autocmd BufWritePost * redraw!
augroup end
