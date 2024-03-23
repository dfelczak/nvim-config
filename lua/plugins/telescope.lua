require("telescope").setup({
	defaults = {
		-- Better fuzzy matching, ignores 'node_modules' and '.git'
		file_ignore_patterns = { "node_modules", ".git" },
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- Enable fuzzy matching
			override_generic_sorter = true, -- Better default sorter
			override_file_sorter = true, -- Better file sorter
		},
	},
})
