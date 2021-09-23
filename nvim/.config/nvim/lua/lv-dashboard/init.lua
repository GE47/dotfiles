vim.g.dashboard_custom_header = {
	' ▄████████    ▄█    █▄     ▄█     ▄█   ▄█▄ ███    █▄     ▄████████    ▄█    █▄     ▄██████▄  ███    █▄  ',
	'███    ███   ███    ███   ███    ███ ▄███▀ ███    ███   ███    ███   ███    ███   ███    ███ ███    ███ ',
	'███    █▀    ███    ███   ███▌   ███▐██▀   ███    ███   ███    █▀    ███    ███   ███    ███ ███    ███ ',
	'███         ▄███▄▄▄▄███▄▄ ███▌  ▄█████▀    ███    ███   ███         ▄███▄▄▄▄███▄▄ ███    ███ ███    ███ ',
	'███        ▀▀███▀▀▀▀███▀  ███▌ ▀▀█████▄    ███    ███ ▀███████████ ▀▀███▀▀▀▀███▀  ███    ███ ███    ███ ',
	'███    █▄    ███    ███   ███    ███▐██▄   ███    ███          ███   ███    ███   ███    ███ ███    ███ ',
	'███    ███   ███    ███   ███    ███ ▀███▄ ███    ███    ▄█    ███   ███    ███   ███    ███ ███    ███ ',
	'████████▀    ███    █▀    █▀     ███   ▀█▀ ████████▀   ▄████████▀    ███    █▀     ▀██████▀  ████████▀  '
}

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    b = {description = {'  Recently Closed    '}, command = 'Telescope oldfiles'},
    c = {description = {'  Find File          '}, command = 'Telescope find_files'},
    a = {description = {'  Projects           '}, command = 'Telescope project'},
    d = {description = {'  Browse Directory   '}, command = 'Telescope file_browser'},
    e = {description = {'  Find by Word       '}, command = 'Telescope live_grep'},
    f = {description = {'  Settings           '}, command = 'SessionLoad neovim-config'},
    g = {description = {'  Zshrc              '}, command = ':e ~/.zshrc'},
}



-- vim.g.dashboard_session_directory = '~/.cache/nvim/session'
-- vim.cmd([[let g:dashboard_session_directory = '~/.cache/nvim/session']])
vim.g.dashboard_custom_footer = {'グラスめ          '}

require("utils").define_augroups {
    _dashboard = {
      {
        "FileType",
        "dashboard",
        "setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= ",
      },
      {
        "FileType",
        "dashboard",
        "set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2",
      },
    },
}
