vim.cmd([[ au BufNewFile,BufRead Jenkinsfile set ft=Jenkinsfile ]])

vim.cmd [[ au FileType gitconfig setlocal noet ]]

vim.cmd [[ au TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif ]]
