local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {"haskell"},
    highlight = {
        enable = true, -- false will disable the whole extension
        disable={'org'},
        additional_vim_regex_highlighting = {'org'},
    },
	rainbow = {
	    enable = true,
        disable = {"html","javascriptreact"},
	    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
	    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
	},
    indent = {enable = {"javascriptreact"}},
    autotag = {enable = true},
}

