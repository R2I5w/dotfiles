local ddu_custom_patch_global = vim.fn["ddu#custom#patch_global"]
local ddu_custom_patch_local = vim.fn["ddu#custom#patch_local"]


ddu_custom_patch_global({
	ui = "filer",
	uiParams = {
		filer = {
			split = "floating",
			floatingBorder = "rounded",
		},
	},
	sourceOptions = {
		file = {
			columns = { 'icon_filename' },
		},
	},
	kindOptions = {
		_ = {
			defaultAction = "open",
		}
	}
})

ddu_custom_patch_local("filer", {
	sources = {
		{
			name = "file",
		},
	},
})
--

vim.api.nvim_create_autocmd({ "TabEnter", "CursorHold", "FocusGained" }, {
	pattern = "<buffer>",
	callback = function()
		vim.fn["ddu#ui#do_action"]('checkItems')
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "ddu-filer",
	callback = function()
		local opts = { noremap = true, silent = true, buffer = true }

		vim.keymap.set('n', '<CR>', function()
			local item = vim.fn['ddu#ui#get_item']()
			if item.isTree then
				vim.fn['ddu#ui#do_action']('itemAction', { name = 'narrow' })
			else
				vim.fn['ddu#ui#do_action']('itemAction',
					{ name = 'open' })
			end
		end, opts)

		vim.keymap.set("n", "q", "<Cmd>call ddu#ui#do_action('quit')<CR>", opts)
		vim.keymap.set('n', 'h',
			"<Cmd>call ddu#ui#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<CR>",
			opts)
		vim.keymap.set('n', 'd', "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'delete'})<CR>", opts)
		vim.keymap.set('n', 'r', "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'rename'})<CR>)",
			opts)
		vim.keymap.set('n', 't', "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'newFile'})<CR>)",
			opts)
		vim.keymap.set('n', 'mk',
			"<Cmd>call ddu#ui#do_action('itemAction', {'name': 'newDirectory'})<CR>", opts)
		vim.keymap.set('n', 'i', "<Cmd>call ddu#ui#do_action('openFilterWindow')<CR>", opts)
	end,
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "ff",
-- 	callback = function()
-- 		local opts = { noremap = true, silent = true, buffer = true }
--
-- 		vim.keymap.set("n", "q", "<Cmd>call ddu#ui#do_action('quit')<CR>", opts)
-- 		vim.keymap.set('n', '<Cr>', "<Cmd>call ddu#ui#do_action('itemAction')<CR>)", opts)
-- 		vim.keymap.set('n', 'i', "<Cmd>call ddu#ui#do_action('openFilterWindow')<CR>", opts)
-- 	end,
-- })
--
-- ddu_custom_patch_local("ff", {
-- 	ui = "ff",
-- 	sources = {
-- 		{
-- 			name = "file_rec",
-- 		},
-- 	},
-- })
