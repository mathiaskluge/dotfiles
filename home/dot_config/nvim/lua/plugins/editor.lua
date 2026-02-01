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

	-- Flash (navigation)
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				char = { enabled = false }, -- Don't override f/F/t/T
			},
		},
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		},
	},

	-- Better text objects
	{
		"echasnovski/mini.ai",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			n_lines = 500,
		},
	},

	-- Which-key (keybinding hints)
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			delay = 500,
			spec = {
				{ "<leader>b", group = "buffer" },
				{ "<leader>f", group = "find" },
				{ "<leader>g", group = "git" },
				{ "<leader>l", group = "lsp" },
				{ "<leader>x", group = "diagnostics" },
			},
		},
	},
}
