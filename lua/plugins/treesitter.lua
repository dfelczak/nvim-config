require("nvim-treesitter.configs").setup({
	ensure_installed = {
		-- List of parsers for supported languages
		"bash",
		"comment",
		"css",
		"html",
		"javascript",
		"jsdoc",
		"jsonc",
		"lua",
		"markdown",
		"regex",
		"scss",
		"toml",
		"typescript",
		"yaml",
	},
	highlight = {
		enable = true, -- Enable syntax highlighting
	},
})
