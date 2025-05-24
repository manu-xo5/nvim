function _G.custom_tagFunc(pattern, flags)
  local ok, results = pcall(vim.lsp.tagfunc, pattern, flags)
  if ok and type(results) == "table" and #results > 0 then
    return results
  end
  -- fallback to ctags or buffer search
  return vim.fn.taglist(pattern)
end

vim.opt.tagfunc = "v:lua.custom_tagFunc"

local customizations = {
  { rule = 'style/*',   severity = 'off', fixable = true },
  { rule = 'format/*',  severity = 'off', fixable = true },
  { rule = '*-indent',  severity = 'off', fixable = true },
  { rule = '*-spacing', severity = 'off', fixable = true },
  { rule = '*-spaces',  severity = 'off', fixable = true },
  { rule = '*-order',   severity = 'off', fixable = true },
  { rule = '*-dangle',  severity = 'off', fixable = true },
  { rule = '*-newline', severity = 'off', fixable = true },
  { rule = '*quotes',   severity = 'off', fixable = true },
  { rule = '*semi',     severity = 'off', fixable = true },
}

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

local on_attach = function(_, _bufnr)
  keymap("n", "gd", "<c-]>", opts)
  keymap("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
  keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "gl", vim.diagnostic.open_float, opts)
  keymap("n", "]d", vim.diagnostic.goto_next, opts)
  keymap("n", "[d", vim.diagnostic.goto_prev, opts)
  keymap("n", "<leader>la", vim.lsp.buf.code_action, opts)
  keymap("n", "<leader>lr", vim.lsp.buf.rename, opts)
  keymap("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
  keymap("n", "<leader>fs", "<cmd>Telescope lsp_workspace_symbols<CR>", opts)
  keymap("n", "<m-s-f>", vim.lsp.buf.format, opts)
end

return {
  "mason-org/mason-lspconfig.nvim",
  branch = "v1.x",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mason-org/mason.nvim",
    "nvim-lua/plenary.nvim",

    "nvimtools/none-ls.nvim",

    "pmizio/typescript-tools.nvim",

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    -- setup lsp servers
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "html",
        "cssls",
        "bashls",
        "tailwindcss",
        "ts_ls",
        "denols",
        "jsonls",
        "eslint",
        "prismals",

        "rust_analyzer",
        "lua_ls",
      },
      automatic_enable = true,

      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,

        ["ts_ls"] = function()
          -- typescript-tools will call `require("lspconfig").ts_ls.setup({})`
          require("typescript-tools").setup({
            root_dir = function(fname)
              if lspconfig.util.root_pattern("deno.json", "deno.jsonc")(fname) then
                return nil
              end

              return lspconfig.util.root_pattern("tsconfig.json")(fname)
            end,
            single_file_support = false,

            on_attach = function(client, bufnr)
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
              on_attach(client, bufnr)

              vim.keymap.set("n", "<leader>lR", vim.cmd.TSToolsRenameFile)
              vim.keymap.set("n", "<leader>ai", vim.cmd.TSToolsAddMissingImports)
              vim.keymap.set("n", "<m-s-o>", vim.cmd.TSToolsOrganizeImports)
            end,
          })
        end,
        ["denols"] = function()
          lspconfig.denols.setup({
            on_attach = on_attach,
            single_file_support = false,
            root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
          })
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
        ["eslint"] = function()
          require("lspconfig").eslint.setup(
            {
              filetypes = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
                "html",
                "astro",
                "svelte",
                "css",
              },
              settings = {
                rulesCustomizations = customizations,
              },
              root_dir = lspconfig.util.root_pattern("eslint.config.mjs", "eslint.config.js", "eslint.config.ts"),
              on_attach = function()
                keymap("n", "<m-s-f>", "<cmd>EslintFixAll<cr>")
              end
            }
          )
        end,

      },
    })

    -- setup linters
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting

    null_ls.setup({
      automatic_setup = true,
      automatic_installation = true,
      ensure_installed = {
        "prettier",
        "stylua"
      },

      debug = false,
      sources = {
        formatting.prettier
      },
    })

    -- setup completion menu
    local cmp = require("cmp")
    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true, behaviour = cmp.ConfirmBehavior.Replace }),
        ["<C-Space>"] = cmp.mapping.complete(), -- Ensure it's set up correctly
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
      }),
      experimental = {
        ghost_text = false,
        native_menu = false,
      },
    })
  end,
}
