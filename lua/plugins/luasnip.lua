return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { "./snippets" },
    })
  end,
}
