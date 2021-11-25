local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
return
end

local util = require "packer.util"

-- check if packer is installed, if not then clone and install it
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

-- Auto compile when there are changes in plugins.lua
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"


-- packer settings
packer.init {
    git = {
        clone_timeout = false
    },
    display = {
      open_fn = function()
        return util.float { border = "single" }
      end,
    },
}
----

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use 'wbthomason/packer.nvim'

        -- intellisense
        use {'neoclide/coc.nvim',opt = true}

        -- Navigation
        use 'unblevable/quick-scope'
        use 'phaazon/hop.nvim'
        use {'tpope/vim-surround',opt = true }
        use {'tpope/vim-repeat',opt = true}

        -- Terminal
        use {
            "akinsho/nvim-toggleterm.lua",
            commit="1f1bf3b3efd9b3d4bc1a47bcdee980ff554fbce4"
        }

        -- Telescope
        use {'nvim-lua/popup.nvim', opt = true}
        use {'nvim-lua/plenary.nvim', opt = true}
        use {'nvim-telescope/telescope.nvim', opt = true}
        use {'nvim-telescope/telescope-project.nvim', opt = true}

        -- Snippets
        use{'honza/vim-snippets', opt = true}
        use{
            'dsznajder/vscode-es7-javascript-react-snippets',
            opt=true,
            run="yarn install --frozen-lockfile && yarn compile"
        }

        use{"hrsh7th/nvim-compe", opt = true}
        -- org mode
        use {"kristijanhusak/orgmode.nvim",}


        -- Treesitter
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
        use {'windwp/nvim-ts-autotag', opt = true}
        use {'p00f/nvim-ts-rainbow'}

        -- Explorer
        use {'kyazdani42/nvim-tree.lua', opt = true}
        use 'kevinhwang91/rnvimr'

        --git
        use {'lewis6991/gitsigns.nvim', opt = true}

        --markdown
        use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}

        --indentlines
        use {'lukas-reineke/indent-blankline.nvim', opt = true}

        --Misc
        use {'folke/which-key.nvim', opt = true}
        use {'folke/zen-mode.nvim', opt = true}
        use {'ChristianChiarulli/dashboard-nvim', opt = true}
        use {'terrortylor/nvim-comment', opt = true}
        use {'kevinhwang91/nvim-bqf', opt = true}
        use {'turbio/bracey.vim', opt=true, run='npm install --prefix server'}
        use {'norcalli/nvim-colorizer.lua', opt = true}
        use {'lambdalisue/suda.vim', opt = true}

        -- theme
        use {'folke/tokyonight.nvim', opt = true}
        use {'tiagovla/tokyodark.nvim', opt = true}
        use {'navarasu/onedark.nvim', opt = true}
        use {'marko-cerovac/material.nvim', opt = true}
        use {'eddyekofo94/gruvbox-flat.nvim', opt = true}
        use {'EdenEast/nightfox.nvim', opt = true}

        -- Icons
        use {'kyazdani42/nvim-web-devicons', opt = true}

        -- Status Line and Bufferline
        use {'hoob3rt/lualine.nvim', opt = true}
        use {'romgrk/barbar.nvim', opt = true}


        require_plugin('nvim-tree.lua')
        require_plugin('coc.nvim')
        require_plugin('zen-mode.nvim')
        require_plugin('tokyonight.nvim')
        require_plugin('tokyodark.nvim')
        require_plugin('material.nvim')
        require_plugin('onedark.nvim')
        require_plugin('gruvbox-flat.nvim')
        require_plugin('nightfox.nvim')
        require_plugin('vim-snippets')
        require_plugin('vscode-es7-javascript-react-snippets')
        require_plugin('popup.nvim')
        require_plugin('plenary.nvim')
        require_plugin('telescope.nvim')
        require_plugin('telescope-project.nvim')
        require_plugin('nvim-dap')
        require_plugin('vim-vsnip')
        require_plugin('nvim-ts-autotag')
        require_plugin('gitsigns.nvim')
        require_plugin('which-key.nvim')
        require_plugin('dashboard-nvim')
        require_plugin('nvim-comment')
        require_plugin('nvim-bqf')
        require_plugin('nvim-web-devicons')
        require_plugin('lualine.nvim')
        require_plugin('barbar.nvim')
        require_plugin('indent-blankline.nvim')
        require_plugin('vim-repeat')
        require_plugin('vim-surround')
        require_plugin('nvim-colorizer.lua')
        require_plugin('bracey.vim')
        require_plugin('suda.vim')
        require_plugin("nvim-compe")

    end
)
