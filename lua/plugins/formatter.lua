-- NOTE: conform-nvim

---Chek if formatters are installed and handle installation
---@param formatter_input string name of formatter
---@param cmd string command for formatter
---@param bufnr number num. of buffer, from conform
---@diagnostic disable
local function check_install_formatter(formatter_input, bufnr, cmd)
	if cmd == nil or cmd == "" then
		vim.notify("No install command supplied", vim.log.levels.ERROR)
		return
	end
	if not require("conform").get_formatter_info(formatter_input, bufnr).available then
		vim.notify(string.format("Installing formatter %s", formatter_input), vim.log.levels.INFO)
		local handle = io.popen(cmd)
		if handle then
			local output = handle:read("*a")
			handle:close()

			-- Create a new buffer and window for the output
			local buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(output, "\n"))
			local win = vim.api.nvim_open_win(buf, true, {
				relative = "editor",
				width = math.floor(vim.o.columns * 0.8),
				height = math.floor(vim.o.lines * 0.8),
				col = math.floor(vim.o.columns * 0.1),
				row = math.floor(vim.o.lines * 0.1),
				style = "minimal",
				border = "rounded",
			})

			-- Make the buffer dismissable
			vim.api.nvim_buf_set_keymap(buf, "n", "q", ":close<CR>", { noremap = true, silent = true })

			if handle.err then
				vim.notify(
					string.format("Error installing '%s', try running %s manually", formatter_input, cmd),
					vim.log.levels.ERROR
				)
			else
				vim.notify(string.format("Formatter %s installed!", formatter_input), vim.log.levels.INFO)
			end
		else
			vim.notify(
				string.format("Error installing '%s', try running %s manually", formatter_input, cmd),
				vim.log.levels.ERROR
			)
		end
	else
		return
	end
end

return {
	{ -- Autoformat - conform.nvim
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				local lsp_format_opt
				if disable_filetypes[vim.bo[bufnr].filetype] then
					lsp_format_opt = "never"
				else
					lsp_format_opt = "fallback"
				end
				return {
					timeout_ms = 500,
					lsp_format = lsp_format_opt,
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				python = function(bufnr)
					vim.defer_fn(function()
						check_install_formatter("autopep8", bufnr, "pip3 install autopep8")
					end, 0)
					return { "autopep8" }
				end,
				javascript = function()
					vim.defer_fn(function()
						check_install_formatter("deno_fmt", bufnr, "npm install -g deno")
					end, 0)
					return { "deno_fmt", stop_after_first = true }
				end,
				markdown = function()
					vim.defer_fn(function()
						check_install_formatter("deno_fmt", bufnr, "npm install -g deno")
					end, 0)
					return { "deno_fmt", stop_after_first = true }
				end,
				json = function()
					vim.defer_fn(function()
						check_install_formatter("deno_fmt", bufnr, "npm install -g deno")
					end, 0)
					return { "deno_fmt", stop_after_first = true }
				end,
				rust = function()
					vim.defer_fn(function()
						check_install_formatter("rustfmt", bufnr, "rustup component add rustfmt")
					end, 0)
					return { "rustfmt", lsp_format = "fallback" }
				end,
				zsh = function()
					vim.defer_fn(function()
						check_install_formatter("shellcheck", bufnr, "sudo apt install shellcheck")
					end, 0)
					return { "shellcheck" }
				end,
				sh = function()
					vim.defer_fn(function()
						check_install_formatter("shellcheck", bufnr, "sudo apt install shellcheck")
					end, 0)
					return { "shellcheck" }
				end,
			},
		},
	},
}
