local opts = { silent = true, noremap = true }
local keymap = function(mode, keymap, cmd)
  vim.keymap.set(mode, keymap, cmd, opts)
end

keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("i", "jk", "<c-[>")
keymap("i", "kj", "<c-[>")

-- Window Keymap
keymap("n", "<C-q>", "<C-w>q")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-w>t", ":tabnew<cr>")

-- Netrw
vim.keymap.set("n", "<leader>.", vim.cmd.Ex, { silent = true, noremap = true })

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

keymap("n", "[c", ":cprev<cr>")
keymap("n", "]c", ":cnext<cr>")

keymap(
  "n",
  "<leader>so",
  function()
    local init_dot_lua = vim.fn.stdpath("config") .. "/init.lua"
    dofile(init_dot_lua)

    print("yummy1");
  end
)

vim.api.nvim_create_user_command(
  'SlurpMyKonfig', -- The name of the command
  function()
    for name, _ in pairs(package.loaded) do
      if name:match("^config") and not name:match("^config.lazy") then
        package.loaded[name] = nil
      end
    end

    -- Optionally clear existing keymaps (optional: only if needed)
    vim.cmd("silent! mapclear")
    vim.cmd("silent! mapclear!") -- for operator-pending

    local init_dot_lua = vim.fn.stdpath("config") .. "/init.lua"
    vim.cmd("source " .. init_dot_lua)
  end,
  {} -- Options (e.g., nargs, range)
)
