return {
  "NeogitOrg/neogit",
  cmd="Neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
  },
  keys = {
    { "<leader>G", ":Neogit<CR>" }
  },
  config = function() 
    require("neogit").setup({})
  end
}

