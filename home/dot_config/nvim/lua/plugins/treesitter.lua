return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"bash", "sh", "css", "html", "javascript", "json", "lua",
					"markdown", "python", "rust", "toml", "tsx", "typescript",
					"vim", "yaml",
				},
				callback = function(event)
					pcall(vim.treesitter.start, event.buf)
					vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
