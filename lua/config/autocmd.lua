-- [[ Basic Autocommands ]]

local function run_fnm_use()
	local run = vim.fn.system("fnm use --install-if-missing $(fnm list-remote --latest)")
	vim.notify(string.format("output: %s", run), vim.log.levels.INFO)
end

-- List of file patterns that should trigger "fnm use ..."
local target_patterns = {
	"*.js",
	"*.jsx",
	"*.ts",
	"*.tsx",
	"*.json",
	"*.yaml",
	"*.yml",
	"*.html",
	"*.htm",
	"*.css",
	"*.scss",
	"*.less",
	"*.svelte",
	"*.vue",
	"*.astro",
	"*.md",
	"*.markdown",
}

-- make sure node is in use with fnm
-- https://github.com/Schniz/fnm/
vim.api.nvim_create_autocmd("BufRead", {
	desc = "Basic autocmd that runs Nvm use node command on some files",
	pattern = target_patterns,
	callback = function()
		run_fnm_use()
	end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Enable bash LS for .sh files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function()
		vim.lsp.start({
			name = "bash-language-server",
			cmd = { "bash-language-server", "start" },
		})
	end,
})

-- Clear jumps on Vim Enter (Ctrl I/O was taking me to other projects)
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	command = "clearjumps",
})
