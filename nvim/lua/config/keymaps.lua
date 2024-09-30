local opts = { silent = true }
local keymap = vim.keymap.set

-- keymap
keymap("i", "jj", "<C-[><C-[>")
keymap("n", "<C-[><C-[>", ":noh<CR>")
keymap("n", "s", "<C-w>", opts)
keymap("i", "jj", "<ESC>", opts)
keymap("n", "<c-p>", "{", opts)
keymap("n", "<c-n>", "}", opts)
keymap("n", "<C-j>", "<cmd>bprev<CR>")
keymap('n', '<C-k>', '<cmd>bnext<CR>')
keymap("t", "<Esc>", [[<C-\><C-n>]])
keymap("n", "np", "<cmd>NoNeckPain<CR>", opts)
keymap("n", "df", "<cmd>call deol#start({ 'cwd': '%'->expand()->fnamemodify(':h'), 'split': 'floating' })<CR>", opts)
keymap("n", "db", "<cmd>call deol#start({ 'cwd': '%'->expand()->fnamemodify(':h') })<CR>", opts)
keymap("n", "sd", "<cmd>call deol#kill_editor()<CR>", opts)

vim.g.comfortable_motion_no_default_key_mappings = 1
