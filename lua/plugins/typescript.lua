return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  config = function()
    vim.keymap.set("n", "<leader>lR", vim.cmd.TSToolsRenameFile)

    vim.keymap.set("n", "<leader>ai", vim.cmd.TSToolsAddMissingImports)

    vim.keymap.set("n", "<leader>ru", vim.cmd.TSToolsRemoveUnusedImports)

    vim.keymap.set("n", "<leader>oi", vim.cmd.TSToolsOrganizeImports)
  end,
}
