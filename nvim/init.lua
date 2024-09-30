if vim.loader then
	vim.loader.enable()
end

local dpp_src = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp.vim"
-- プラグイン内のLuaモジュールを読み込むため、先にruntimepathに追加する必要があります。
vim.opt.runtimepath:prepend(dpp_src)
local dpp = require("dpp")

local dppBase = "~/.cache/dpp/"
local dpp_config = "~/.config/nvim/dpp.ts"

local denops_src = "$HOME/.cache/dpp/repos/github.com/vim-denops/denops.vim"

local ext_toml = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml"
local ext_lazy = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-ext-lazy"
local ext_installer = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer"
local ext_git = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git"

vim.opt.runtimepath:append(ext_toml)
vim.opt.runtimepath:append(ext_git)
vim.opt.runtimepath:append(ext_lazy)
vim.opt.runtimepath:append(ext_installer)

if dpp.load_state(dppBase) then
	vim.opt.runtimepath:prepend(denops_src)

	vim.api.nvim_create_autocmd("User", {
		pattern = "DenopsReady",
		callback = function()
			vim.notify("vim load_state is failed")
			dpp.make_state(dppBase, dpp_config)
		end
	})
end

-- dpp_alias
vim.api.nvim_create_user_command("DppInstall", "call dpp#async_ext_action('installer', 'install')", { nargs = 0 })
vim.api.nvim_create_user_command("DppUpdate", "call dpp#async_ext_action('installer', 'update')", { nargs = 0 })
vim.api.nvim_create_user_command("DppMakestate", function(val)
	dpp.make_state(dppBase, dpp_config)
end, { nargs = 0 })

-- key_autocmd
vim.api.nvim_create_autocmd({ "BufRead", "CursorHold", "InsertEnter" }, {
	callback = function()
		vim.opt.clipboard = "unnamedplus"
		require("config/keymaps")
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("colorscheme solarized-osaka")
	end
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		local dir = vim.fn.expand("%:p:h")
		vim.cmd("silent! lcd " .. vim.fn.fnameescape(dir))
	end
})

-- key_maps
vim.cmd("inoremap jj <C-[>")
vim.cmd("nnoremap <C-[><C-[> <cmd>noh<CR>")
vim.cmd("nnoremap sv <cmd>vs<CR>")
vim.cmd("nnoremap s <C-w>")
vim.keymap.set("n", "te", ":tabedit")
vim.keymap.set("n", "<tab>", ":tabnext<Return>")
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>")
vim.keymap.set('n', 'sf', function()
	local file_dir = vim.fn.expand('%:p:h')
	local cwd = vim.fn.getcwd()
	local search_path = file_dir ~= cwd and file_dir or cwd
	vim.fn['ddu#start']({
		name = 'filer',
		searchPath = search_path
	})
end, { silent = true })

-- vim.keymap.set('n', 'ff', function()
-- 	vim.fn['ddu#start']({
-- 		name = 'ff',
-- 	})
-- end, { silent = true })


-- test
vim.cmd([[const mapleader = " "]])
vim.keymap.set("n", "<leader>k", function() print("Hop!") end)

-- opt.settings
vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.virtualedit = "none"

-- cmd.settings
vim.cmd("set ignorecase")
vim.cmd("set completeopt=menuone,noinsert")
vim.cmd([[let maplocalleader = ' ']])
vim.cmd("filetype indent plugin on")
vim.cmd("syntax on")
vim.cmd("set termguicolors")
