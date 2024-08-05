return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node

    vim.keymap.set({ "i", "s" }, "<M-L>", function()
      ls.jump(1)
    end, { silent = true })

    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { "./snippets" },
    })

    local function copy(args)
      return args[1]
    end

    ls.add_snippets("all", {
      -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
      s("fn", {
        -- Simple static text.
        t("//Parameters: "),
        f(copy, 2),
        t({ "", "function " }),
        -- Placeholder/Insert.
        i(1),
        t("("),
        -- Placeholder with initial text.
        i(2, "int foo"),
        -- Linebreak
        t({ ") {", "\t" }),
        -- Last Placeholder, exit Point of the snippet.
        i(0),
        t({ "", "}" }),
      }),
    }, {
      key = "all",
    })
  end,
}
