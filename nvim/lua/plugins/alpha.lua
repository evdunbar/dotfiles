return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        local alpha = require"alpha"
        local startify = require"alpha.themes.startify"

        startify.section.header.val = {
            [[┌───────────────────────────────────────────────┐ ]],
            [[│ NEOVIM: hyperextensible Vim-based text editor │░]],
            [[└───────────────────────────────────────────────┘░]],
            [[ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░]],
        }

        alpha.setup(startify.config)
    end
}
