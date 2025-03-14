return {
  dir = vim.fn.stdpath("config") .. "/lua/todo-plugin",
  dev = true,
  cmd = "Todo",
  keys = {
    -- { "<leader>ts", "<cmd>Todo push<CR>" },
    { "<leader>to", "<cmd>Todo open<CR>" },
  },
  opts = {
    gist_id = "manu-xo5/2997af50d6a3764115e739809fd901e0.git"
  }
}
