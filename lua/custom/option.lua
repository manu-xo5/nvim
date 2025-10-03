vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.hlsearch = false -- highlight all matches on previous search pattern
vim.opt.ignorecase = true
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.number = true -- set numbered lines
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 14 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 6 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.pumheight = 10

vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.showmode = false
-- vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.cursorline = true -- highlight the current line
vim.opt.signcolumn = "no"
vim.opt.whichwrap:append("h,l") -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.iskeyword:remove("=")
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
vim.opt.wildignorecase = true -- case insensitive completion
vim.opt.wildignore =
	".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"

vim.g.netrw_banner = 0 -- disable that anoying Netrw banner
vim.g.netrw_browser_split = 4 -- open in a prior window
vim.g.netrw_altv = 1 -- open splits to the right

vim.g.netrw_list_hide = "^\\./\\?$,^\\.\\./\\?$" -- hide ./ and ../

return {}
