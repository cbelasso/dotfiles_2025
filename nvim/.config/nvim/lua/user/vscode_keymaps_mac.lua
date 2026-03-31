local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes:
--     normal_mode = "n"
--     insert_mode = "i"
--     visual_mode = "v"
--     visual_block_mode = "x"
--     term_mode = "t"
--     command_mode = "c"

-- Jump backward/forward in jumplist
keymap("n", "<D-o>", "<C-o>", opts) -- Command+o => jump back
keymap("n", "<D-i>", "<C-i>", opts) -- Command+i => jump forward

-- Use <leader>o / <leader>i instead of Cmd
keymap("n", "<leader>o", "<C-o>", { noremap = true, silent = true })
keymap("n", "<leader>i", "<C-i>", { noremap = true, silent = true })

keymap("n", "gl", "$", opts)
keymap("n", "gh", "^", opts)
keymap("n", "gi", "<S-i>", opts)
keymap("n", "ga", "<S-a>", opts)
keymap("n", "ff", "<S-f>", opts)

keymap({ "n", "v" }, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
keymap({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ "n", "v" }, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")

-- VSCode LSP actions (uncommented and using vscode actions)
keymap(
  "n",
  "gd",
  "<cmd>lua require('vscode').action('editor.action.revealDefinition')<CR>",
  { desc = "Go to definition" }
)
keymap(
  "n",
  "gD",
  "<cmd>lua require('vscode').action('editor.action.revealDeclaration')<CR>",
  { desc = "Go to declaration" }
)
keymap(
  "n",
  "gr",
  "<cmd>lua require('vscode').action('editor.action.goToReferences')<CR>",
  { desc = "Go to references" }
)
-- keymap(
--   "n",
--   "gi",
--   "<cmd>lua require('vscode').action('editor.action.goToImplementation')<CR>",
--   { desc = "Go to implementation" }
-- )

keymap("n", "K", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>", { desc = "Show hover" })
keymap("n", "<leader>rn", "<cmd>lua require('vscode').action('editor.action.rename')<CR>", { desc = "Rename symbol" })
keymap("n", "<leader>ca", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>", { desc = "Code actions" })

-- Additional useful VSCode actions
keymap(
  "n",
  "]d",
  "<cmd>lua require('vscode').action('editor.action.marker.nextInFiles')<CR>",
  { desc = "Next diagnostic" }
)
keymap(
  "n",
  "[d",
  "<cmd>lua require('vscode').action('editor.action.marker.prevInFiles')<CR>",
  { desc = "Previous diagnostic" }
)
keymap(
  "n",
  "<leader>e",
  "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>",
  { desc = "Show file explorer" }
)
