return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- Essential languages only
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"typescript",
				"go",
				"html",
				"css",
				"json",
				"yaml",
				"markdown",
				"bash",
			},

			-- Auto-install languages when needed
			auto_install = true,

			-- Core functionality
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
