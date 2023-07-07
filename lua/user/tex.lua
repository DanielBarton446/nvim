vim.cmd([[ 
augroup LatexAutoCommands
  autocmd!
  au BufWritePost *.tex silent! execute '!pdflatex ' . expand('%:p') . ' >/dev/null 2>&1'
augroup END
]])
