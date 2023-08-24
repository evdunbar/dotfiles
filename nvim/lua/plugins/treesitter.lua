return {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
}
