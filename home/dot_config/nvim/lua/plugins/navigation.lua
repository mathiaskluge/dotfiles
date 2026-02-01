return {
	-- Telescope (fuzzy finder)
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		keys = {
			-- Find
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
			{ "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Grep word under cursor" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
			-- Shortcuts
			{ "<leader><leader>", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "<leader>/", "<cmd>Telescope live_grep<CR>", desc = "Grep" },
		},
		opts = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				layout_config = {
					horizontal = { preview_width = 0.5 },
				},
				file_ignore_patterns = { "node_modules", ".git/" },
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
						["<Esc>"] = "close",
					},
				},
			},
			pickers = {
				find_files = { hidden = true },
				buffers = {
					sort_lastused = true,
					mappings = {
						i = { ["<C-d>"] = "delete_buffer" },
					},
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			pcall(telescope.load_extension, "fzf")
		end,
	},

	-- Harpoon (quick file marks)
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon add" },
			{ "<leader>h", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },
			{ "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon 1" },
			{ "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon 2" },
			{ "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon 3" },
			{ "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon 4" },
		},
		opts = {},
	},

	-- Oil (file explorer as buffer)
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
		},
		opts = {
			default_file_explorer = true,
			columns = { "icon" },
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["q"] = "actions.close",
				["<Esc>"] = "actions.close",
			},
		},
	},

	-- Seamless tmux/nvim navigation
	{
		"christoomey/vim-tmux-navigator",
		event = "VeryLazy",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
		},
		keys = {
			{ "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Navigate left" },
			{ "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Navigate down" },
			{ "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Navigate up" },
			{ "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Navigate right" },
		},
	},
}
