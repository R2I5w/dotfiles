-- colorscheme
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("colorscheme solarized-osaka")
	end
})

-- Each time a file is opened, automatically navigate to the directory where the file resides
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		local dir = vim.fn.expand("%:p:h")
		vim.cmd("silent! lcd " .. vim.fn.fnameescape(dir))
	end
})

vim.api.nvim_create_user_command('GitDiff', function()
	vim.cmd([[
    new
    setlocal buftype=nofile bufhidden=delete noswapfile
    setfiletype gitcommit
    read !git diff #
    setlocal readonly nobuflisted
    syntax enable
    highlight gitcommitComment ctermfg=gray guifg=gray
    highlight gitcommitOnBranch ctermfg=blue guifg=blue
    highlight gitcommitSelectedFile ctermfg=green guifg=green
    highlight gitcommitDiscardedFile ctermfg=red guifg=red
    normal! gg
  ]])
end, {})
