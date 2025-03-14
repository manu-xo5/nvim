return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig"
  },
  keys = {
    {"n", "<leader>lR", vim.cmd.TSToolsRenameFile},
    {"n", "<leader>ai", vim.cmd.TSToolsAddMissingImports},
    {"n", "<leader>ru", vim.cmd.TSToolsRemoveUnusedImports},
    {"n", "<leader>oi", vim.cmd.TSToolsOrganizeImports},
  },
}

