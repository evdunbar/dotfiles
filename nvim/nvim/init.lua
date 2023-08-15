-- IMPORTS
    require('vars')
    require('opts')
    -- require('keys')
    require('plug')


-- PLUGINS
    require('nvim-treesitter')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})

    vim.lsp.set_log_level("debug")
    local lsp = require 'lspconfig'
    local coq = require 'coq'

    lsp.pyright.setup{coq.lsp_ensure_capabilities()}
    lsp.ccls.setup{coq.lsp_ensure_capabilities()}
    lsp.rust_analyzer.setup{coq.lsp_ensure_capabilities{settings = {['rust-analyzer'] = {checkOnSave = {command = 'clippy'}}}}}

    require('coq')

    vim.cmd('COQnow -s')

-- THEME MANAGEMENT (DO NOT CHANGE)
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

