local opts = { silent = true }
local keymap = vim.keymap.set
vim.g.mapleader = " "

-- keymaps
keymap("i", "jj", "<ESC>", opts)
keymap("i", "jj", "<C-[><C-[>", opts)
keymap("n", "<C-[><C-[>", ":noh<CR>", opts)
keymap("n", "s", "<C-w>", opts)
keymap('n', 'sv', '<cmd>vs<CR>', opts)
keymap("n", "<c-p>", "{", opts)
keymap("n", "<c-n>", "}", opts)
keymap('n', 'te', ':tabedit', opts)
keymap('n', '<tab>', ':tabnext<Return>', opts)
keymap('n', '<s-tab>', ':tabprev<Return>', opts)
keymap('n', 'sf', function()
	local file_dir = vim.fn.expand('%:p:h')
	local cwd = vim.fn.getcwd()
	local search_path = file_dir ~= cwd and file_dir or cwd
	vim.fn['ddu#start']({
		name = 'filer',
		searchPath = search_path
	})
end, opts)
keymap('n', 'ff', function()
	vim.fn['ddu#start']({
		name = 'ff',
	})
end, opts)
keymap('n', 'fm', function()
	vim.fn['ddu#start']({
		name = 'ff-mr',
	})
end, opts)
-- keymap("n", "<C-j>", "<cmd>bprev<CR>")
-- keymap('n', '<C-k>', '<cmd>bnext<CR>')
keymap("t", "<Esc>", [[<C-\><C-n>]])
keymap("n", "np", "<cmd>NoNeckPain<CR>", opts)
keymap("n", "df", "<cmd>call deol#start({ 'cwd': '%'->expand()->fnamemodify(':h'), 'split': 'floating', 'floating_border': 'rounded'})<CR>", opts)
keymap("n", "db", "<cmd>call deol#start({ 'cwd': '%'->expand()->fnamemodify(':h') })<CR>", opts)
keymap('x', 'p', 'P', opts)
keymap('x', 'y', 'mzy`z', opts)
keymap('x', '<', '<gv', opts)
keymap('x', '>', '>gv', opts)
keymap('n', 'U', '<C-r>', opts)
keymap('n', 'ds', '<cmd>GitDiff<cr>', opts)

-- test
vim.keymap.set("n", "<leader>k", function() print("Hop!") end)
