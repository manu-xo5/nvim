local defaultConfig = function()
  vim.o.background = "dark"
  vim.cmd.colorscheme("visual_studio_code")
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "#333333" })
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "askfiy/visual_studio_code",
    priority = 100,
    opts = {
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
    },
    config = defaultConfig,
  },
  {
    "tjdevries/colorbuddy.nvim",
    lazy = false,
    priority = 1000,
    config = defaultConfig,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = defaultConfig,
  },
  {
    "ramojus/mellifluous.nvim",
    opts = {
      dim_inactive = false,
      color_set = "mountain",
    },
    config = defaultConfig,
  },
  {
    "ntk148v/habamax.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    opts = {},
    config = defaultConfig,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = defaultConfig,
  },
  {
    "luisiacc/gruvbox-baby",
    lazy = false,
    priority = 1000,
    config = defaultConfig,
  },
}
