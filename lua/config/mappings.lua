-- INFO: [[ My Custom Keymaps ]]

local function remap(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

remap("i", "<C-e>", "<C-o>de")

vim.keymap.set("n", "<leader>om", "<cmd>:Mason<CR>", {
	desc = "[O]pen [M]ason",
})

vim.keymap.set("n", "<leader>ol", "<cmd>:Lazy<CR>", {
	desc = "[O]pen [L]azy",
})

vim.keymap.set("n", "<leader>rp", "<cmd>:MurenToggle<CR>", {
	desc = "[R]e[P]lace",
})

vim.keymap.set("n", "<leader>n", "<cmd>:bnext<CR>", {
	desc = "Go to next buffer",
})

vim.keymap.set("n", "<leader>st", "<cmd>:TodoTelescope<CR>", {
	desc = "[S]earch [T]odo-comment in workspace",
})

vim.keymap.set("n", "<leader>p", "<cmd>:bprevious<CR>", {
	desc = "Go to previous buffer",
})

vim.keymap.set("n", "<leader>dq", "<cmd>:bd<CR>", {
	desc = "[D]ocument [Q]uit",
})

vim.keymap.set("n", "<leader>dw", "<cmd>:w<CR>", {
	desc = "[D]ocument [W]rite",
})

vim.keymap.set("n", "<F2>", "<cmd>RunCode<CR>", {
	desc = "Run RunCode command",
})

vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true, desc = "jump upwards on context" })

-- Open mini-files
vim.keymap.set("n", "\\", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open file explorer" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
