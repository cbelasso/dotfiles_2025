local home = os.getenv("HOME")
local uname = vim.loop.os_uname().sysname

if vim.g.vscode then
  require("config.lazy")
  require("user.vscode_keymaps_mac")
elseif uname == "Darwin" then
  -- macOS
  -- pcall(require, "user.vscode_keymaps_mac")
  require("config.lazy")
elseif uname == "Linux" then
  -- Linux (remote)
  -- pcall(require, "user.vscode_keymaps_linux")
  require("config.lazy")
else
  require("config.lazy")
end
