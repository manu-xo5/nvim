local M = {}

M.servers = {
	"lua_ls",
	"cssls",
	"html",
	"bashls",
	"jsonls",
	"tailwindcss",
	"eslint",
  "denols",
	"prismals"
	-- "rustls",
	-- "gopls"
}

M.linters = {
	"prettier",
	"stylua",
}

M.parsers = {
	"lua",
	"vim",
	"markdown",
	"markdown_inline",
	"bash",
	"python",
	"cpp",
	"c",
	"java",
	"javascript",
	"typescript",
	"tsx",
	"html",
	"css",
	"json",
	"yaml",
	"toml",
	"regex",
	"go",
	"rust",
	"dockerfile",
}

return M
