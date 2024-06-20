return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local harpool_ui = require("harpoon.ui")
        vim.keymap.set("n", "<leader>ht", harpool_ui.toggle_quick_menu )
    end
}
