local M = {};

M.setup = function()
	local status, _ = pcall(require, 'midnight');
	if not status then
		print("Midnight colorscheme not found");
		vim.cmd.colorscheme 'default';
		return ;
	end
	vim.cmd.colorscheme 'midnight';
end

return M;
