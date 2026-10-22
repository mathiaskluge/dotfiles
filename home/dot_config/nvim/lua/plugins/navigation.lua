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
		tag = "v0.2.2",
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
}
