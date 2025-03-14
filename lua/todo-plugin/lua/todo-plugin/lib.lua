local M = {}

M.CmdWithLogs = function (name, command)
  vim.fn.system(command)

  print("Done: " .. name)
end

M.includes = function (target, source)
  for _, srcStr in ipairs(source) do
    if target == srcStr then
      return true
    end
  end

  return false
end

return M
