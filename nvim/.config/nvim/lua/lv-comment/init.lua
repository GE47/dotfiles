require('nvim_comment').setup(
    {
      comment_empty = false,
      create_mappings = false,
    }
)
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap=true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap=true, silent = true})
