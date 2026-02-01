return {
	-- Statusline (minimal, complementing tmux-dotbar)
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "ayu_dark",
				component_separators = "",
				section_separators = "",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "lazy" } },
			},
			sections = {
				lualine_a = {}, -- No mode block (too bulky)
				lualine_b = {},
				lualine_c = {
					-- Mode indicator (minimal)
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1) -- Just first letter: N, I, V, C
						end,
						color = { gui = "bold" },
					},
					-- Git branch
					{
						"branch",
						icon = "",
						color = { fg = "#5c6773" },
					},
					-- File path (relative)
					{
						"filename",
						path = 1, -- Relative path
						symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" },
					},
				},
				lualine_x = {
					-- Diagnostics
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
					},
					-- LSP indicator (minimal)
					{
						function()
							local clients = vim.lsp.get_clients({ bufnr = 0 })
							if #clients > 0 then
								return "LSP"
							end
							return ""
						end,
						color = { fg = "#5c6773" },
					},
					-- Filetype (no icon)
					{
						"filetype",
						icons_enabled = false,
						color = { fg = "#5c6773" },
					},
				},
				lualine_y = {},
				lualine_z = {
					-- Position (line:col)
					{
						"location",
						color = { fg = "#5c6773" },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		},
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = { "help", "lazy", "mason", "notify", "oil" },
			},
		},
	},

	-- Better notifications
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			notification = {
				window = { winblend = 0 },
			},
		},
	},
}
