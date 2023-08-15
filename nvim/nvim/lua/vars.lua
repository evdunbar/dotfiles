local g = vim.g
g.t_co = 256
g.background = 'dark'
-- g.background = 'light'
g.mapleader = ' '

-- for markdown preview
vim.cmd [[
    function OpenMarkdownPreview(url)
        execute 'silent' '!firefox' '--new-window' shellescape(a:url)
    endfunction
]]

g.mkdp_auto_start = 1
g.mkdp_auto_close = 0
g.mkdp_browserfunc = 'OpenMarkdownPreview'
