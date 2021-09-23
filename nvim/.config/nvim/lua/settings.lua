local opt = vim.opt
local cmd = vim.cmd

----------- VIM CMD
TERMINAL = vim.fn.expand('$TERMINAL')
cmd('filetype plugin on')               -- filetype detection
cmd('let &titleold="'..TERMINAL..'"')
cmd('set inccommand=split')             -- show what you are substituting in real time
cmd('set iskeyword+=-')                 -- treat dash as a separate word
cmd('set whichwrap+=<,>,[,],h,l')       -- move to next line with theses keys
cmd('command! W noa w')                 -- save file even when W is typed instead of w
-----------

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

opt.colorcolumn     = "99999"                   -- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
opt.backup          = false                     -- creates a backup file
opt.writebackup     = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.shell           = "/usr/bin/bash"           -- set default shell
opt.clipboard       = "unnamedplus"             -- allows neovim to access the system clipboard
opt.cmdheight       = 2                         -- more space in the neovim command line for displaying messages
opt.completeopt     = {'menuone', 'noselect'}
opt.conceallevel    = 0                         -- so that `` is visible in markdown files
opt.fileencoding    = "utf-8"                   -- the encoding written to a file
opt.guifont         = "monospace:h17"           -- the font used in graphical neovim applications
opt.hidden          = true                      -- required to keep multiple buffers and open multiple buffers
opt.hlsearch        = true                      -- highlight all matches on previous search pattern
opt.ignorecase      = true                      -- ignore case in search patterns
opt.mouse           = "a"                       -- allow the mouse to be used in neovim
opt.pumheight       = 10                        -- pop up menu height
opt.showmode        = false                     -- we don't need to see things like -- INSERT -- anymore
opt.showtabline     = 2                         -- always show tabs
opt.smartindent     = true                      -- make indenting smarter again
opt.splitbelow      = true                      -- force all horizontal splits to go below current window
opt.splitright      = true                      -- force all vertical splits to go to the right of current window
opt.swapfile        = false                     -- creates a swapfile
opt.termguicolors   = true                      -- set term gui colors (most terminals support this)
opt.timeoutlen      = 300                       -- time to wait for a mapped sequence to complete (in milliseconds)
opt.title           = true                      -- set the title of window to the value of the titlestring
opt.titlestring     = "%<%F%=%l/%L - nvim"      -- what the title of the window will be set to
-- opt.undodir         = CACHE_PATH .. '/undo'     -- set an undo directory
-- opt.undofile        = true                      -- enable persisten undo
opt.updatetime      = 300                       -- faster completion
opt.expandtab       = true                      -- convert tabs to spaces
opt.shiftwidth      = 4                         -- the number of spaces inserted for each indentation
opt.shortmess:append("c")                       -- don't pass messages to |ins-completion-menu|
opt.tabstop         = 4                         -- insert 4 spaces for a tab
opt.cursorline      = true                      -- highlight the current line
opt.number          = true                      -- set numbered lines
opt.relativenumber  = false                     -- set relative numbered lines
opt.signcolumn      = "yes"                     -- always show the sign column, otherwise it would shift the text each time
opt.wrap            = false                     -- wrap lines
opt.scrolloff       = 8
opt.sidescrolloff   = 8
