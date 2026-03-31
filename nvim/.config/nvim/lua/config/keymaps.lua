-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

-- Modes:
--     normal_mode = "n"
--     insert_mode = "i"
--     visual_mode = "v"
--     visual_block_mode = "x"
--     term_mode = "t"
--     command_mode = "c"

-- server side mappings
keymap("n", "D-i", "<C-i>", opts)
keymap("n", "D-o", "<C-o>", opts)

-- host side mappings
-- keymap("n", "<ESC>i", "<C-i>", opts)
-- keymap("n", "<ESC>o", "<C-o>", opts)
-- keymap("n", "<C-i>", "<C-i>", opts)

keymap("n", "q", [[:lua if vim.fn.empty(vim.fn.expand('%:t')) == 1 then vim.cmd('q') end<CR>]], opts)

keymap("n", "<leader>er", ":nohl<CR>", { desc = "Clear search highlights" }, opts)

keymap("c", "<leader>k", "\\(.*\\)", opts)
keymap("c", "<leader>qq", "q!", opts)

keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

keymap("n", "gl", "$", { desc = "Split window vertically" }, opts)
keymap("n", "gh", "^", { desc = "Split window vertically" }, opts)
keymap("n", "gi", "<S-i>", { desc = "Split window vertically" }, opts)
keymap("n", "ga", "<S-a>", { desc = "Split window vertically" }, opts)
keymap("n", "ff", "<S-f>", { desc = "Split window vertically" }, opts)

keymap("v", "gl", "$", { desc = "Split window vertically" }, opts)
keymap("v", "gh", "^", { desc = "Split window vertically" }, opts)

-- Mapping to delete in the 'black hole' registry
keymap("n", "<leader>d", '"_d', opts)
keymap("x", "<leader>d", '"_d', opts)

-- Nice remap to move lines around
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
-- Split window
keymap("n", "ss", ":split<Return>", { desc = "Split window vertically" }, opts)
keymap("n", "sv", ":vsplit<Return>", { desc = "Split window vertically" }, opts)
keymap("n", "se", "<C-w>=", { desc = "Make splits equal size" }, opts) -- make split windows equal width & height
keymap("n", "sx", "<cmd>close<CR>", { desc = "Close current split" }, opts) -- close c

-- Move between windows
-- keymap("n", "sh", "<C-w>h", { desc = "Switch to left window" }, opts)
-- keymap("n", "sk", "<C-w>k", { desc = "Switch to top window" }, opts)
-- keymap("n", "sj", "<C-w>j", { desc = "Switch to bottom window" }, opts)
-- keymap("n", "sl", "<C-w>l", { desc = "Switch to right window" }, opts)

-- keymap("n", "<leader>te", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
