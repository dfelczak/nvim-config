local keymap = vim.keymap.set

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- =======================
-- Telescope Setup
-- =======================

local builtin = require("telescope.builtin")

-- Keymappings for Telescope pickers
keymap("n", "<leader>ff", builtin.find_files, {}) -- Find files
keymap("n", "<leader>fg", builtin.live_grep, {}) -- Live grep search
keymap("n", "<leader>fb", builtin.buffers, {}) -- Open buffers
keymap("n", "<leader>fh", builtin.help_tags, {}) -- Search help tags

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Split window to leader
map("n", "<leader>v", "<C-w>v")
map("n", "<leader>h", "<C-w>s")

-- Change split orientation
map("n", "<leader>tk", "<C-w>t<C-w>K") -- change vertical to horizontal
map("n", "<leader>th", "<C-w>t<C-w>H") -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Reload configuration without restart nvim
map("n", "<leader>r", ":so %<CR>")

-- Fast saving with <leader> and s
map("n", "<leader>s", ":w<CR>")

-- Close all windows and exit from Neovim with <leader> and q
map("n", "<leader>q", ":qa!<CR>")

-- =======================
-- LSP Configuration
-- =======================

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable LSP-powered omnicompletion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Keymaps local to the buffer with the attached LSP server
		local opts = { buffer = ev.buf }

		keymap("n", "gD", vim.lsp.buf.declaration, opts) -- Go to declaration
		keymap("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
		keymap("n", "K", vim.lsp.buf.hover, opts) -- Show documentation on hover
		keymap("n", "gi", vim.lsp.buf.implementation, opts) -- Go to implementation
		keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts) -- Show signature help

		-- Workspace folder management
		keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		keymap("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)

		-- Other LSP functionality
		keymap("n", "<space>D", vim.lsp.buf.type_definition, opts)
		keymap("n", "<space>rn", vim.lsp.buf.rename, opts)
		keymap({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		keymap("n", "gr", vim.lsp.buf.references, opts)
		keymap("n", "<space>f", function()
			vim.lsp.buf.format({ async = true }) -- Async formatting
		end, opts)
	end,
})

-- =======================
-- Spectre Setup
-- =======================

keymap("n", "<leader>ss", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
keymap("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word (normal mode)", -- Added description
})
keymap("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word (visual mode)", -- Added description
})
keymap("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search in current file", -- Changed "on" to "in"
})

-- =======================
-- Other Configurations
-- =======================

vim.o.updatetime = 300 -- Adjust how frequently signs/highlights update

-- Diagnostics setup
vim.api.nvim_set_keymap("n", "<Leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>n", ":lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>p", ":lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
