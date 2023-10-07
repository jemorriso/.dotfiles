hs.loadSpoon("SpoonInstall")

--------------------------------
-- VIM
--------------------------------
local VimMode = hs.loadSpoon("VimMode")
local vim = VimMode:new()

vim:disableForApp("Code")
vim:disableForApp("Cursor")
vim:disableForApp("PyCharm")
vim:disableForApp("iTerm2")
vim:disableForApp("Terminal")
vim:disableForApp("Kitty")
vim:disableForApp("Wezterm")

vim:shouldDimScreenInNormalMode(false)
vim:shouldShowAlertInNormalMode(true)
vim:setAlertFont("Courier New")
-- vim:enterWithSequence("kj")
vim:bindHotKeys({ enter = { { "ctrl", "alt" }, "escape" } })
vim:enableBetaFeature("block_cursor_overlay")

--------------------------------
-- SWITCHERS
--------------------------------

require("window_cycle")
-- require("app_window_cycle")
require("switcher")
