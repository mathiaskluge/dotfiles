local function telescope_picker(name, opts)
	return function()
		local ok, builtin = pcall(require, "telescope.builtin")
		if not ok then
			vim.notify("Telescope is unavailable", vim.log.levels.ERROR)
			return
		end

		builtin[name](opts or {})
	end
end

return {
	-- Telescope (fuzzy finder)
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>ff",
				telescope_picker("find_files", { hidden = true }),
				desc = "Find files",
			},
			{
				"<leader>fg",
				telescope_picker("live_grep"),
				desc = "Live grep",
			},
			{
				"<leader>fb",
				telescope_picker("buffers"),
				desc = "Buffers",
			},
			{
				"<leader>fr",
				telescope_picker("oldfiles"),
				desc = "Recent files",
			},
			{
				"<leader>fw",
				telescope_picker("grep_string"),
				desc = "Grep word under cursor",
			},
			{
				"<leader>fh",
				telescope_picker("help_tags"),
				desc = "Help",
			},
			{
				"<leader><leader>",
				telescope_picker("buffers"),
				desc = "Buffers",
			},
			{
				"<leader>/",
				telescope_picker("current_buffer_fuzzy_find"),
				desc = "Search current buffer",
			},
		},
		opts = {
			defaults = {
				prompt_prefix = "  ",
				selection_caret = "  ",
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
					horizontal = { preview_width = 0.5 },
				},
				file_ignore_patterns = { ".git/", "node_modules/" },
			},
			pickers = {
				buffers = {
					sort_lastused = true,
				},
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
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
}
