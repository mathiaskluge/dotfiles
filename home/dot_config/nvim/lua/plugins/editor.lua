return {
	-- Auto pairs
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		opts = {},
	},

	-- Surround
	{
		"echasnovski/mini.surround",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			mappings = {
				add = "sa", -- Add surrounding
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (right)
				find_left = "sF", -- Find surrounding (left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update n_lines
			},
		},
	},

	-- Comments
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
}
