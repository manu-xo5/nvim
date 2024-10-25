-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true, noremap = true }

--Map leader keys
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.b.maplocalleader = ";"

------------- Normal Mode -------------
-- Better move around
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Better Window Navigation
keymap("n", "k", "kzz", opts)
keymap("n", "j", "jzz", opts)
-- Window Keymap
keymap("n", "<C-q>", "<C-w>q", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-w>t", ":tabnew<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", vim.cmd.nohlsearch, opts)
keymap("n", "<leader>z", ":Telescope buffers<CR>", opts)

-- Netrw
vim.keymap.set("n", "<leader>.", vim.cmd.Ex, { silent = true, noremap = true })

------------- Visual Mode -------------
-- Stay in indent mode
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

keymap("x", "e", "oeo", opts)
keymap("x", "b", "obo", opts)
keymap("x", "l", "olo", opts)
keymap("x", "h", "oho", opts)
keymap("x", "<s-e>", "o<s-e>o", opts)
keymap("x", "<s-b>", "o<s-b>o", opts)

---- emacs ----
keymap("i", "<C-c>", "<Nop>", { noremap = true, silent = true, nowait = true })
keymap("n", "<s-h>", "<Nop>", { noremap = true, silent = true, nowait = true })
keymap("n", "<s-l>", "<Nop>", { noremap = true, silent = true, nowait = true })

---- better movement in insert mode ----
keymap("n", "<c-j>", "<c-e>j", opts)
keymap("n", "<c-k>", "<c-y>k", opts)

keymap("n", "gn", "*ggn", opts)
keymap("i", "<c-h>", "<c-[>bi", opts)
keymap("i", "<c-l>", "<c-[>lea", opts)
keymap({ "i", "n", "x", "v" }, "<Capslock>", "<c-[>", opts)

----- scratch pad --------
keymap("n", "<leader>to", "<cmd>e ~/.config/nvim_scratch_pad<cr>", opts)

---------

local ss = require("core.smartsnips")
keymap({ "n", "i" }, "<c-s>", "<cmd>:w<cr><cmd>:source %<cr>")
keymap("n", "<leader>aa", ss.SmartSnip)
keymap("n", "[m", function()
	local node = ss.GoToFunctionDefination()
	if not node then
		return
	end

	local rowStart = node:range()
	vim.cmd(":" .. (rowStart + 2))
end)

keymap("n", "]m", function()
	local node = ss.GoToFunctionDefination()
	if not node then
		return
	end

	local _, _, rowEnd = node:range()
	vim.cmd(":" .. rowEnd)
end)
