local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Modes:
--     normal_mode = "n"
--     insert_mode = "i"
--     visual_mode = "v"
--     visual_block_mode = "x"
--     term_mode = "t"
--     command_mode = "c"

keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

keymap("n", "gl", "$", opts)
keymap("n", "gh", "^", opts)
keymap("n", "gi", "<S-i>", opts)
keymap("n", "ga", "<S-a>", opts)
keymap("n", "ff", "<S-f>", opts)
