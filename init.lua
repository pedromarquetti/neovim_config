if vim.g.vscode then
	require("config.options")
	require("config.autocmd")
	require("config.mappings")
else
	require("config.options")
	require("config.autocmd")
	require("config.lazy")
	require("config.mappings")
end
