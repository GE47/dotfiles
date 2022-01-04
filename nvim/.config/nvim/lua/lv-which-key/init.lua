local wk = require('which-key')

------------------------------ setup
wk.setup {
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = ">-", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 10, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

---------------------------presets settings
local presets = require("which-key.plugins.presets")
presets.operators["v"] = nil

------------------------ mappings

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

-- General mappings
wk.register({
        ["<leader>/"] = {"Comment Toggle"},
        ["<leader>;"] = {"<cmd>Dashboard<cr>", "Dashboard"},
        ["<leader>?"] = {"<cmd>NvimTreeFindFile<cr>", "Current File in Explorer"},
        ["<leader>e"] = {"<cmd>lua require'lv-nvimtree'.toggle_tree()<cr>", "Explorer"},
        ["<leader>h"] = {"<cmd>split<cr>", "Split Window Horizontal"},
        ["<leader>v"] = {"<cmd>vsplit<cr>", "Split Window Vertical"},
        ["<leader>H"] = {"<cmd>let @/ = ''<cr>", "No Highlight"},
        ["<leader>,"] = {"<cmd>BufferPick<cr>","Pick Buffer"},
        ["<leader>q"] = {"QuickFix Diagnostic"},
})


local mappings = {
    -- b for buffer
    b = {
        name = "Buffer",
        l = {"<cmd>BufferNext<cr>","Next Buffer"},
        h = {"<cmd>BufferPrevious<cr>","Previous Buffer"},
        d = {"<cmd>BufferClose<cr>", "Delete Buffer"},
        i = {"<cmd>BufferPick<cr>","Pick Buffer"},
    },
    -- c for code
    c = {
        name = "Code",
        a = {
            name ="Actions",
            q = {"<Plug>(coc-fix-current)","Quick Fix"},
            b = {"<Plug>(coc-codeaction)","Buffer"},
            n = {"<Plug>(coc-rename)","Rename"},
            },
    },
    -- f for find
    f = {
        name = "find",
        f = { "<cmd>Telescope find_files<cr>", "File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
        c = {"<cmd>Telescope colorscheme<cr>","Color Schemes"},
        t = {"<cmd>Telescope live_grep<cr>","Text"},
        m = {"<cmd>Telescope keymaps<cr>","Marks"},
        M = {"<cmd>Telescope marks<cr>","Marks"},
        R = {"<cmd>Telescope registers<cr>","Registers"},
        o = {"<cmd>Telescope vim_options<cr>","vim options"},
        b = {"<cmd>Telescope git_branches<cr>","Git Branches"},
        p = {"<cmd>Telescope project<cr>","Projects"},
    },
    -- t for toggle
    t = {
        name = "Toggle",
        t = {"<cmd>ToggleTermOpenAll<cr>" ,"All Terminals" },
        g = {"<cmd>lua require('toggle-term')._lazygit_toggle()<cr>", "Lazygit" },
        z = { "<cmd>ZenMode<cr>", "ZenMode" },
        r = { "<cmd>RnvimrToggle<cr>", "Ranger" },
        m = { "<Plug>MarkdownPreviewToggle", "Markdown Preview" },
        b={
          name = "Bracey",
          r = {"<cmd>Bracey<cr>","Run"},
          s = {"<cmd>BraceyStop<cr>","Stop"},
        }
    },
    -- d for debug
    d = {
        name = "Debug",
        b = {"<cmd>DebugToggleBreakpoint<cr>","Toggle Breakpoint"},
        c = {"<cmd>DebugContinue<cr>","Continue"},
        i = {"<cmd>DebugStepInto<cr>","Step Into"},
        o = {"<cmd>DebugStepOver<cr>","Step Over"},
        r = {"<cmd>DebugToggleRepl<cr>","Toggle Repl"},
        s = {"<cmd>DebugStart<cr>","Start Debugging"},
        f = {
            name = "flutter",
            r = {"<cmd>CocCommand flutter.run<cr>","Run"},
            R = {"<cmd>CocCommand flutter.dev.hotRestart<cr>","Hot Restart"},
            q = {"<cmd>CocCommand flutter.dev.quit<cr>","Quit"},
            o = {"<cmd>CocCommand flutter.dev.openDevLog<cr>","Open Dev Log"},
            l = {"<cmd>CocCommand flutter.dev.debugPaintSizeEnabled<cr>","Toggle Construction Lines"},
            e = {"<cmd>CocCommand flutter.emulators<cr>","Select Emulators"},
            w = {"<cmd>CocCommand flutter.dev.showWidgetInspectorOverride<cr>","Toggle Widget Inspector"},
            d = {"<cmd>CocCommand flutter.dev.openDevToolsProfiler<cr>","Open DevTools in Browser"},

        }
    },
    -- g for git
    g = {
        d = {"<cmd>lua require'gitsigns'.diffthis()<cr>","Diff"},
        r = {"<cmd>lua require'gitsigns'.reset_hunk()<cr>","Reset Hunk"},
        n = {"<cmd>lua require'gitsigns.actions'.next_hunk()<cr>","Next Hunk"},
        p = {"<cmd>lua require'gitsigns.actions'.prev_hunk()<CR>","Previous Hunk"},
    },

}

wk.register(mappings,opts)

-- h for hop visual mode
wk.register({
    ["<leader>"]= {
        h = { "<cmd>:lua require'hop'.hint_words()<cr>", "hop Pattern" },
    }
},{mode="v"})

-- a for code action visual
wk.register({
    ["<leader>"]= {
        a = {"<Plug>(coc-codeaction-selected)","Line Code Action"},
    }
},{mode="v"})

