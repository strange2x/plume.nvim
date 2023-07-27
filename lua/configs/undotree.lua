local M = {};

M.set_keymaps = function()
    vim.keymap.set('n', '<leader>U', vim.cmd.UndotreeToggle, {silent= true});
end


return M;

