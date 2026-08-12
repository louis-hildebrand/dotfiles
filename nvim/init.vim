set runtimepath^=~/.vim
set runtimepath+=~/.vim/after

let &packpath = &runtimepath

source ~/.vim/vimrc

colorscheme unokai

" When jumping to a mark, also move the screen so the mark is at the same
" position (relative to the top of the screen) as when it was set
set jumpoptions+=view
