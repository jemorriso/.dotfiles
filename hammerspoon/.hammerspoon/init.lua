hs.loadSpoon("SpoonInstall")

--------------------------------
-- START VIM CONFIG
--------------------------------
local VimMode = hs.loadSpoon("VimMode")
local vim = VimMode:new()

vim:disableForApp("Code"):disableForApp("iTerm2"):disableForApp("PyCharm"):disableForApp("Terminal")

vim:shouldDimScreenInNormalMode(false)
vim:shouldShowAlertInNormalMode(true)
vim:setAlertFont("Courier New")
vim:enterWithSequence("kj")
vim:enableBetaFeature("block_cursor_overlay")
--------------------------------
-- END VIM CONFIG
--------------------------------

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "W", function()
	hs.alert.show("Hello World!")
end)
