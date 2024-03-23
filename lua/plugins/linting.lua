local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "eslint_d", "codespell", "cspell" },
	typescript = { "eslint_d", "codespell", "cspell" },
	javascriptreact = { "eslint_d", "codespell", "cspell" },
	typescriptreact = { "eslint_d", "codespell", "cspell" },
	svelte = { "eslint_d", "codespell" },
	python = { "pylint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })
