return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nightfox").setup({
            options = {
                transparent = true,
                styles = {
                    comments = "italic",
                    conditionals = "bold",
                    keywords = "italic",
                    types = "italic,bold",
                },
            }
        })

        if vim.o.background == "light" then
            vim.cmd("colo dayfox")
            COLOR_THEME = "dayfox"
        else
            vim.cmd("colo duskfox")
            COLOR_THEME = "duskfox"
        end
    end,
}
