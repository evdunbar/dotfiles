return {
    'nvim-telescope/telescope.nvim', branch = "0.1.x",
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            config = function()
                require('telescope').load_extension('fzf')
            end,
        },
    },
    lazy = true,
    keys = {
        {
            '<leader>ff',
            function()
                return require('telescope.builtin').find_files()
            end,
            desc = 'Find files',
        },
        {
            '<leader>fg',
            function()
                return require('telescope.builtin').live_grep()
            end,
            desc = 'Live grep',
        },
    },
}
