return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			require("mini.ai").setup({ n_lines = 500 })

			-- mini.files
			require("mini.files").setup({
				windows = {
					-- Show preview of currently selected item in file
					preview = true,
				},
			})

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			require("mini.surround").setup()
			require("mini.icons").setup()
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({
				use_icons = true,
			})

			statusline.section_location = function()
				return "%*%2l:%-2v"
			end

			statusline.section_filename = function()
				return "%f%#UnsavedFile#%m%*%"
			end
		end,
	},
}

