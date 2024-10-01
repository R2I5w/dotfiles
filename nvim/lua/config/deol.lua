vim.api.nvim_create_autocmd("FileType", {
	pattern = "deol",
	callback = function()
		local opts = { buffer = true, noremap = true, silent = true }
		local map = vim.keymap.set
		map('n', '<C-n>', '<Plug>(deol_next_prompt)', opts)
		map('n', '<C-p>', '<Plug>(deol_previous_prompt)', opts)
		map('n', '<CR>', '<Plug>(deol_execute_line)', opts)
		map('n', 'A', '<Plug>(deol_start_append_last)', opts)
		map('n', 'I', '<Plug>(deol_start_insert_first)', opts)
		map('n', 'a', '<Plug>(deol_start_append)', opts)
		map('n', 'e', '<Plug>(deol_edit)', opts)
		map('n', 'i', '<Plug>(deol_start_insert)', opts)
		map('n', 'q', '<Plug>(deol_quit)', opts)
		map('t', 'jj', [[<C-\><C-n>]], opts)
	end
})
