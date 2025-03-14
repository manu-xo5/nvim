local opts = { silent = true, noremap = true }
local keymap = function (mode, keymap, cmd)
	vim.keymap.set(mode, keymap, cmd, opts)
end


keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Better Window Navigation
keymap("n", "k", "kzz")
keymap("n", "j", "jzz")
-- Window Keymap
keymap("n", "<C-q>", "<C-w>q")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-w>t", ":tabnew<cr>")

-- Netrw
vim.keymap.set("n", "<leader>.", vim.cmd.Ex, { silent = true, noremap = true })

------------- Visual Mode -------------
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '>-2<CR>gv=gv")
-- Stay in indent mode
keymap("x", "<", "<gv")
keymap("x", ">", ">gv")

---- emacs ----
vim.keymap.set("i", "<C-c>", "<Nop>", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<s-h>", "<Nop>", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<s-l>", "<Nop>", { noremap = true, silent = true, nowait = true })

keymap("n", "gn", "*ggn")

----- scratch pad --------
keymap("n", "<leader>to", "<cmd>e ~/.config/nvim_scratch_pad<cr>")

---------

-- local ss = require("core.smartsnips")
-- keymap({ "n", "i" }, "<c-s>", "<cmd>:w<cr><cmd>:source %<cr>")
-- keymap("n", "<leader>aa", ss.SmartSnip)
-- keymap("n", "[m", function()
-- 	local node = ss.GoToFunctionDefination()
-- 	if not node then
-- 		return
-- 	end
--
-- 	local rowStart = node:range()
-- 	vim.cmd(":" .. (rowStart + 2))
-- end)
--
-- keymap("n", "]m", function()
-- 	local node = ss.GoToFunctionDefination()
-- 	if not node then
-- 		return
-- 	end
--
-- 	local _, _, rowEnd = node:range()
-- 	vim.cmd(":" .. rowEnd)
-- end)
--
