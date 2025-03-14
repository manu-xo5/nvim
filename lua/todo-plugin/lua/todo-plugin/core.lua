local cmd = require("todo-plugin.lib").CmdWithLogs
local M = {}

M.init = function (gist_id)
  local gist_url = "https://gist.github.com/" .. gist_id
  local command = "git clone " .. gist_url .. " ~/todo --quiet"

  cmd("Init", command)
end

M.pull = function()
  print("pulling...")
  local command = "cd ~/todo && git pull --rebase"
  cmd("Pull", command)
  vim.cmd("e");
end

M.push = function()
  vim.cmd(":w")
  local command = "cd ~/todo && git add -u && git commit --allow-empty-message -m '' && git push -f"
  cmd("Update", command)
end

M.open = function ()
  vim.cmd(":e ~/todo/todo.md")
end

return M
