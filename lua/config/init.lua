vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.wo.relativenumber = true

-- Normal Remaps

local local_opts = { silent = true }

-- Launching netrw when clicking on <leader>pv
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Lexplore, local_opts)

vim.keymap.set("n", "<C-h>", "<C-w>h", local_opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", local_opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", local_opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", local_opts)

-- Tab Remaps
vim.keymap.set("n", "<leader>tN", "<CMD>tabnew<CR><CMD>Ex<CR>", { desc = "[Window] Create new Tab", silent = true })
vim.keymap.set("n", "<leader>tp", "<CMD>tabprevious<CR>", { desc = "[Window] Goto Previous Tab", silent = true })
vim.keymap.set("n", "<leader>tn", "<CMD>tabnext<CR>", { desc = "[Window] Goto Next Tab", silent = true })
vim.keymap.set("n", "<leader>e", "<CMD>Lexplore<CR>", { desc = "Open Lexplore", silent = true })

vim.cmd([[
  set colorcolumn=80
]])


require("config.lazy")
