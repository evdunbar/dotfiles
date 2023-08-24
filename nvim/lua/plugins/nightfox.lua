return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nightfox").setup({options = { transparent = true }})

        local file = io.open("/home/evan/Code/void/themes/current_theme.txt", "r")

        if file then
            local content = file:read("*line")
            file:close()

            if content == "light" then
                COLOR_THEME = "dayfox"
                vim.cmd("colo dayfox")
            else
                COLOR_THEME = "duskfox"
                vim.cmd("colo duskfox")
            end
        end
    end,
}
