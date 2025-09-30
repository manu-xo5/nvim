local M = {}

M.ts_ls = {}

M.eslint = {}

M.stylua = {}

M.tailwindcss = {}

M.lua_ls = {
	settings = {
		Lua = {
			-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
			diagnostics = { disable = { "missing-fields" } },
		},
	},
}

return M
