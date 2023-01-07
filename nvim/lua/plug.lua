return require('packer').startup(function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- Base plugins
    use 'nvim-lua/plenary.nvim'

    -- Colorschemes
    use 'navarasu/onedark.nvim'

    use 'catppuccin/nvim'

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })

    use 'EdenEast/nightfox.nvim'

    -- Appearance
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Functionality
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    use 'neovim/nvim-lspconfig'

    use {'ms-jpq/coq_nvim', branch = 'coq'}

    use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
end)
