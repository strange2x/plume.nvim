-- Setting the <leader> as <Space>
vim.g.mapleader = " ";

local local_opts = {silent=true}

-- Launching netrw when clicking on <leader>pv
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, local_opts)
