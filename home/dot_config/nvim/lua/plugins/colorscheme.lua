return {
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			require("ayu").setup({
				mirage = false, -- Set to true for mirage variant
				terminal = true,
				overrides = {
					-- Make background slightly transparent for terminal blending
					Normal = { bg = "NONE" },
					NormalFloat = { bg = "NONE" },
					SignColumn = { bg = "NONE" },
					-- Subtle cursor line
					CursorLine = { bg = "#1a1f29" },
				},
			})
			vim.cmd.colorscheme("ayu-dark")
		end,
	},
}
