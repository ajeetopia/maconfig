-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Cmd-S saves current buffer
vim.keymap.set('n', '\\<C-s>', ':w<CR>', { desc = "Save current buffer", noremap = true, silent = true })
vim.keymap.set('i', '\\<C-s>', '<Esc>:w<CR>a', { desc = "Save current buffer", noremap = true, silent = true })

-- Remap <leader>ss to configure wider symbol column
vim.keymap.set("n", "<leader>ss",
    function() require("telescope.builtin").lsp_document_symbols({symbol_width = 60}) end,
    { desc = "Find Symbols" })

-- Paste over selection without affecting clipboard contents
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over selection" })

-- Move selected text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down", noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up", noremap = true })

-- Join lines and restore cursor position
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines", noremap = true })

-- Integration with tmux
vim.keymap.set('n', '<C-h>', require("nvim-tmux-navigation").NvimTmuxNavigateLeft,  { desc = "Go to left pane" })
vim.keymap.set('n', '<C-j>', require("nvim-tmux-navigation").NvimTmuxNavigateDown,  { desc = "Go to pane below" })
vim.keymap.set('n', '<C-k>', require("nvim-tmux-navigation").NvimTmuxNavigateUp,    { desc = "Go to pane above" })
vim.keymap.set('n', '<C-l>', require("nvim-tmux-navigation").NvimTmuxNavigateRight, { desc = "Go to right pane" })
