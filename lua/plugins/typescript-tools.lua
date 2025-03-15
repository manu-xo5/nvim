return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig"
  },
  keys = {
    {"<leader>lR", vim.cmd.TSToolsRenameFile},
    {"<leader>ai", vim.cmd.TSToolsAddMissingImports},
    {"<leader>ru", vim.cmd.TSToolsRemoveUnusedImports},
    {"<leader>oi", vim.cmd.TSToolsOrganizeImports},
  },
}

