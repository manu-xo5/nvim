local defaultConfig = function()
  vim.o.background = "dark"

  vim.cmd.colorscheme "catppuccin"
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
  -- vim.api.nvim_set_hl(0, "StatusLine", { bg = "#333333" })
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        show_end_of_buffer = true,
        term_colors = false,
        dim_inactive = { enabled = false },
        no_italic = true,    -- Force no italic
        no_bold = true,      -- Force no bold
        no_underline = true, -- Force no underline
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })

      defaultConfig()
    end
  },
  {
    "joshdick/onedark.vim"
  },
  {
    "maxmx03/solarized.nvim"
  },
  {
    "folke/tokyonight.nvim"
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
