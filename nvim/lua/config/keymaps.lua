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
keymap("n", "df",
	"<cmd>call deol#start({ 'cwd': '%'->expand()->fnamemodify(':h'), 'split': 'floating', 'floating_border': 'rounded'})<CR>",
	opts)
keymap("n", "db", "<cmd>call deol#start({ 'cwd': '%'->expand()->fnamemodify(':h') })<CR>", opts)
keymap('x', 'p', 'P', opts)
keymap('x', 'y', 'mzy`z', opts)
keymap('x', '<', '<gv', opts)
keymap('x', '>', '>gv', opts)
keymap('n', 'U', '<C-r>', opts)
keymap('n', 'ds', '<cmd>GitDiff<cr>', opts)

-- w3m.vim
keymap('n', '<leader>w', ':W3mVSplit google ', opts)
vim.api.nvim_create_autocmd("FileType", {
	pattern = "w3m",
	callback = function()
		keymap('n', '<CR>', '<Plug>(w3m-click)', opts)
		keymap('n', '<S-CR> ', '<Plug>(w3m-shift-click)', opts)
		keymap('n', '<C-S-CR> ', '<Plug>(w3m-shift-ctrl-click)', opts)
		keymap('n', '=', '<Plug>(w3m-show-link)', opts)
		keymap('n', '/', '<Plug>(w3m-search-start)', opts)
		keymap('n', '<m-d>', '<Plug>(w3m-address-bar)', opts)
		keymap('n', '<leader>h', '<Plug>(w3m-back)', opts)
		keymap('n', '<leader>l', '<Plug>(w3m-forward)', opts)
		keymap('n', '<leader>s', '<Plug>(w3m-toggle-syntax)', opts)
		keymap('n', '<leader>c', '<Plug>(w3m-toggle-use-cookie)', opts)
		keymap('n', '<C-n>', '<Plug>(w3m-next-link)', opts)
		keymap('n', '<C-p>', '<Plug>(w3m-prev-link)', opts)
	end
})

-- test
vim.keymap.set("n", "<leader>k", function() print("Hop!") end)
