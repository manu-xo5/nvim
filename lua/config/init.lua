require("config.keymap")
require("config.options")

if not vim.g.vscode then
	require("config.lazy")
end
