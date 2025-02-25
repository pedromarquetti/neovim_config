-- [[ Setting options ]]
-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.opt.foldmethod = "expr"

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Make line numbers default
vim.opt.number = true

vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- setting scrolloff to 0 to fix window scrolling
vim.opt.scrolloff = 0

-- vim.opt.conceallevel = 2

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.opt.cursorcolumn = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- settings some options for tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- Creating a custom UnsavedFile highlight group to be used as unsaved file flag
local Unsaved_hl_name = "UnsavedFile"
local unsaved_bg_hl = vim.api.nvim_get_hl(0, {
	name = Unsaved_hl_name,
})
local unsaved_fg_hl = vim.api.nvim_get_hl(0, {
	name = Unsaved_hl_name,
})
vim.api.nvim_set_hl(0, Unsaved_hl_name, {
	bold = true,
	bg = ("yellow"):format(unsaved_bg_hl.bg),
	fg = ("black"):format(unsaved_fg_hl.fg),
})
