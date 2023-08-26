hs.loadSpoon("SpoonInstall")

--------------------------------
-- START VIM CONFIG
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
vim:bindHotKeys({ enter = { { "ctrl", "alt" }, "i" } })
vim:enableBetaFeature("block_cursor_overlay")
--------------------------------
-- END VIM CONFIG
--------------------------------

local switcher = require("switcher")

-- ======================================= Switcher

--  function to either open apps or switch through them using switcher
function openswitch(name)
	return function()
		if hs.application.frontmostApplication():name() == name then
			switcherfunc()
		else
			hs.application.launchOrFocus(name)
		end
	end
end

k = hs.hotkey.modal.new({ "ctrl", "shift", "alt" }, "a")
-- function k:entered()
-- 	hs.alert("Entered mode")
-- end
-- function k:exited()
-- 	hs.alert("Exited mode")
-- end
k:bind("", "escape", function()
	k:exit()
end)

k:bind("", "a", function()
	openswitch("Arc")()
	k:exit()
end)

k:bind("", "f", function()
	openswitch("Finder")()
	k:exit()
end)

k:bind("", "k", function()
	openswitch("kitty")()
	k:exit()
end)

k:bind("", "m", function()
	openswitch("Messages")()
	k:exit()
end)

k:bind("", "o", function()
	openswitch("Obsidian")()
	k:exit()
end)

k:bind("", "p", function()
	openswitch("Preview")()
	k:exit()
end)

k:bind("", "s", function()
	openswitch("Spotify")()
	k:exit()
end)

k:bind("", "w", function()
	openswitch("WezTerm")()
	k:exit()
end)

k:bind("", "f", function()
	openswitch("Firefox")()
	k:exit()
end)
