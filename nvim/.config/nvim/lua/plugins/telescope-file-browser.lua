return {
  -- "nvim-telescope/telescope-fzf-native.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local function telescope_buffer_dir()
      return vim.fn.expand("%:p:h")
    end

    local keymap = vim.keymap -- for conciseness
    -- keymap.set("n", "<leader>rg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    -- keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>df", function()
      telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = true,
        initial_mode = "normal",
        layout_strategy = "horizontal",
        layout_config = {
          height = 15,
          width = 0.8,
          horizontal = {
            prompt_position = "top",
          },
        },
        mappings = {
          n = {
            ["q"] = actions.close,
          },
        },
      })
    end)
  end,
}
