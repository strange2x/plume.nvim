vim.g.mapleader = " "

-- Lazy Installation
-- It bootstraps
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Loading plugins from "Plugins" folder

require("lazy").setup("plugins")

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

vim.cmd([[
  set colorcolumn=80
]])

-- Netrw Customization
vim.cmd([[ let g:netrw_banner=0 ]])
vim.cmd([[ let g:netrw_keepdir=0 ]])
vim.cmd([[ let g:netrw_winsize=20 ]])
vim.cmd([[ let g:netrw_localcopydircmd='cp -r' ]])

vim.cmd([[
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <C-E> :call ToggleNetrw()<CR>
]])

vim.filetype.add({
	extension = {
		yml = "yaml.ansible",
	},
})
