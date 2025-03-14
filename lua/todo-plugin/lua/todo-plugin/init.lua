local core = require("todo-plugin.core")
local lib = require("todo-plugin.lib")
local M = {}

local cliOptions = { "push", "pull", "open" }

M.setup = function (arg)
  core.init(arg.gist_id)

  vim.api.nvim_create_user_command(
  "Todo",
  function (a)
    local option = a.args
    if not lib.includes(option, cliOptions) then
      print("unknown option: " .. option)
      return
    end

    core[option]()
  end,
  {
    nargs = 1,
    complete = function ()
      return cliOptions
    end
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = vim.fn.expand("$HOME") .. "/todo/todo.md",
    callback = function()
      core.push()
    end,
  })

end

return M
