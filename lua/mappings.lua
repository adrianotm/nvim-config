require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<C-x>", ":nohl<CR>")

local opts = { noremap = true, silent = true }
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)

map('n', '<leader>gs', ":Git<CR>", opts)
map('n', '<leader>gc', ":Gcommit<CR>", opts)
map('n', '<leader>gp', ":Git push origin<CR>", opts)
map('n', '<leader>ga', ":Gw<CR>", opts)
map('n', '<leader>gA', ":Git add .<CR>", opts)
map('n', '<leader>gf', ":Git pull<CR>", opts)
map('n', '<leader>gd', ":Gdiff<CR>", opts)
map('n', '<leader>gB', ":Git blame<CR>", opts)

map('n', '<leader>gr', ":Telescope lsp_references<CR>", opts)
