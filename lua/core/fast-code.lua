local cmp = require("cmp")
local M = {}

function M.get_completion_items(_, callback)
	local items = {
		{
			label = "translation",
			kind = cmp.lsp.CompletionItemKind.Function,
			textEdit = {
				newText = "const { t } = useTranslation()",
				range = {
					start = {
						line = 0,
						character = 0,
					},
					["end"] = {
						line = 0,
						character = 0,
					},
				},
			},
		},
		{ label = "Option2", kind = cmp.lsp.CompletionItemKind.Text },
	}
	callback({ items = items, isIncomplete = false })
end

function M.is_available()
	return true
end

function M.complete(x, y, callback)
	-- Call the completion items function
	M.get_completion_items(_, callback)
end

return M
