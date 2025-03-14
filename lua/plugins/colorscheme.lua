return {
  {
    "askfiy/visual_studio_code",
    priority = 100,
    config = function()
      require("visual_studio_code").setup({
        mode = "dark",
        dim_inactive = false,
        transparent = false,
        expand = {
          null_ls = true,
          nvim_cmp = true,
          lspconfig = true,
          telescope = true,
          bufferline = true,
          nvim_treesitter = true,
          vim_visual_multi = true,
        },
      })
    end,
  },
  {
    "tjdevries/colorbuddy.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "ramojus/mellifluous.nvim",
    config = function()
      require("mellifluous").setup({
        dim_inactive = false,
        color_set = "mountain",
      })
      vim.cmd("colorscheme mellifluous")
    end,
  }
}
