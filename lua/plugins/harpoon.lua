return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local harpoon_ui = require("harpoon.ui")
        vim.keymap.set("n", "<leader>ht", harpoon_ui.toggle_quick_menu, { desc = "[H]arpoon [T]oggle UI" })
        vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "[H]arpoon [A]dd Current File" })
        vim.keymap.set("n", "<leader>hn", harpoon_ui.nav_next, { desc = "[H]arpoon [N]ext File" })
        vim.keymap.set("n", "<leader>hp", harpoon_ui.nav_prev, { desc = "[H]arpoon [P]revious File" })
    end,
}
