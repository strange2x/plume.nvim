-- Setting the <leader> as <Space>
vim.g.mapleader = " "

local local_opts = { silent = true }

-- Launching netrw when clicking on <leader>pv
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, local_opts)

vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
