local opts = { silent = true, noremap = true }
local keymap = function(mode, keymap, cmd)
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

------ tsc -------
keymap("n", "<leader>lc", function()
	vim.cmd.compiler("tsc")
	vim.opt_local.makeprg = "pnpm typecheck"
	vim.cmd.make()
end)
keymap("n", "gn", "*ggn")
