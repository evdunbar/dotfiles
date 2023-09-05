return {
    "ms-jpq/coq_nvim",
    branch = "coq",
    dependencies = {
        {
            "ms-jpq/coq.artifacts",
            branch = "artifacts",
        },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        {
            "neovim/nvim-lspconfig",
            keys = {
                {
                    'gd',
                    function()
                        return require('telescope.builtin').lsp_definitions()
                    end,
                    desc = 'Goto Definition',
                },
                {
                    'gr',
                    function()
                        return require('telescope.builtin').lsp_references()
                    end,
                    desc = 'References',
                },
                {
                    'gD',
                    vim.lsp.buf.declaration,
                    desc = 'Goto Declaration',
                },
                {
                    'gI',
                    function()
                        return require('telescope.builtin').lsp_implementations()
                    end,
                    desc = 'Goto Implementation',
                },
                {
                    'gy',
                    function()
                      return require('telescope.builtin').lsp_type_definitions()
                    end,
                    desc = 'Goto T[y]pe Definition',
                },
            },
        },
    },
    event = { "VeryLazy", "BufEnter *.c", "BufEnter *.cpp", "BufEnter *.lua", "BufEnter *.py", "BufEnter *.rs" },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

        local lsp = require 'lspconfig'
        local coq = require 'coq'

        lsp.clangd.setup{coq.lsp_ensure_capabilities()}
        lsp.lua_ls.setup{coq.lsp_ensure_capabilities()}
        lsp.pyright.setup{coq.lsp_ensure_capabilities()}
        lsp.rust_analyzer.setup{coq.lsp_ensure_capabilities{settings = {['rust-analyzer'] = {checkOnSave = {command = 'clippy'}}}}}

        vim.cmd("LspStart")
        vim.cmd("COQnow -s")
    end
}
