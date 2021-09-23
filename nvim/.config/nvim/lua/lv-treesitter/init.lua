require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {"haskell"},
    highlight = {
        enable = true -- false will disable the whole extension
    },
	rainbow = {
	    enable = true,
        disable = {"html"},
	    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
	    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
	},
    indent = {enable = {"javascriptreact"}},
    autotag = {enable = true},
}

