-- IMPORTS
    require('vars')
    require('opts')
    -- require('keys')
    require('plug')


-- PLUGINS
--[[
    require('rose-pine').setup({
        disable_background = true
    })

    vim.cmd('colorscheme rose-pine')
]]


--[[
    require('onedark').setup({
        style = 'deep',
        transparent = true
    })

    require('onedark').load()
]]


    require('nightfox').setup({
        options = {
            transparent = true
        }
    })

    vim.cmd('colorscheme duskfox')


    require('lualine').setup {
        options = {
            theme = 'duskfox',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' }
        }
    }


    require('nvim-treesitter')


    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})

--    require'lspconfig'.pyright.setup{}

    require'lspconfig'.pyright.setup{require'coq'.lsp_ensure_capabilities()}

    require'coq'

    vim.cmd('COQnow -s')
