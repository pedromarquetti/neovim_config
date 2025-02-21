-- [[ Basic Autocommands ]]

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
