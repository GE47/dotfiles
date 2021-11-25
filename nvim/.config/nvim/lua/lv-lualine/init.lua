local luaLine=require('lualine');

luaLine.setup{
 options = {
    icons_enabled = true,
    theme = 'nightfox',
    component_separators = {'', ''},
    section_separators = {' ', ' '},
    disabled_filetypes = {}

  },
  sections = {
    lualine_a = {'filename'},
    lualine_b = {'branch'},
    lualine_c = {
    {
    'diagnostics',
    sources = {'coc'},
    sections = {'error', 'warn', 'info', 'hint'},
      }
    },
    lualine_x = {},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'nvim-tree'}
}
