-- tokyonight theme
-- vim.g.tokyonight_style = 'night'
-- vim.g.tokyonight_transparent= true
-- vim.g.tokyonight_italic_functions=true
-- vim.g.tokyonight_italic_keywords=true
-- vim.g.tokyonight_lualine_bold= false
-- vim.g.tokyonight_dark_sidebar = false
-- vim.g.tokyonight_dark_float = true
-- vim.g.tokyonight_terminal_colors = true
-- require("tokyonight").colorscheme()
--------

-- nightfox
local nightfox = require('nightfox');

nightfox.setup({
 fox = "nightfox",
 transparent = true,
 alt_nc = true,
 terminal_colors = true,
  styles = {
    comments = "italic",
    keywords = "italic,bold",
    functions = "italic"
  },
  inverse = {
    match_paren = false,
    visual = false,
    search = false,
  },
})

nightfox.load()
---------

-- material theme
-- vim.g.material_disable_background = true
-- vim.g.material_contrast=false
-- vim.g.material_style = 'darker'
-- vim.cmd('colorscheme material')

---------
-- gruvbox theme
-- vim.g.gruvbox_flat_style = 'hard'
-- vim.cmd('colorscheme gruvbox-flat')
---------

--tokyodark theme
-- vim.g.tokyodark_transparent_background = true
-- vim.g.tokyodark_enable_italic_comment = true
-- vim.g.tokyodark_color_gamma = "1.2"
-- vim.cmd('colorscheme tokyodark')
--------

-- vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
-- vim.cmd('let g:nvcode_termcolors=256')
