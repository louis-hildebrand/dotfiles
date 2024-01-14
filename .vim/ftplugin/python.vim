" Replace tabs with spaces
set expandtab

let b:ale_linters = {'python': ['pyright']}

augroup python_autoformat
	autocmd!
	autocmd BufWritePost * call AutoformatPython()
augroup end

if !exists("*AutoformatPython")
	function AutoformatPython()
		echom "Autoformatting..."
		silent !isort --quiet %
		silent !black --quiet %
		" Automatically reload: https://stackoverflow.com/a/64403990
		edit
		redraw!
		echom "Done autoformatting."
	endfunction
endif
