return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")
			local parsers = {
				"bash", "css", "html", "javascript", "json", "lua", "markdown",
				"python", "rust", "toml", "tsx", "typescript", "vim", "yaml",
			}

			treesitter.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})
			treesitter.install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = vim.list_extend({ "sh" }, parsers),
				callback = function(event)
					pcall(vim.treesitter.start, event.buf)
					vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
