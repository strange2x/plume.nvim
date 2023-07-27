local default_installed_languages = {
	"c",
	"lua",
	"javascript",
	"typescript",
}

local M = {}

M.config = function(treesitter_configs)
	treesitter_configs.setup({
		ensure_installed = default_installed_languages,
		sync_install = false,
		auto_install = true,
		ignore_install = {},
		highlight = {
			enable = true,
			disable = {},
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
	})
end

M.setup = function()
	local status, treesitter_configs = pcall(require, "nvim-treesitter.configs")
	if not status then
		print("Treesitter not found")
		return
	end
	M.config(treesitter_configs)
end

return M
