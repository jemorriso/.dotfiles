hs.loadSpoon("SpoonInstall")

--------------------------------
-- VIM
--------------------------------
local VimMode = hs.loadSpoon("VimMode")
local vim = VimMode:new()

vim:shouldDimScreenInNormalMode(false)
vim:shouldShowAlertInNormalMode(true)
vim:setAlertFont("Courier New")
-- vim:enterWithSequence("en", 1000)
vim:bindHotKeys({ enter = { { "ctrl", "alt" }, "escape" } })
vim:enableBetaFeature("block_cursor_overlay")

--------------------------------
-- SWITCHERS
--------------------------------

k = hs.hotkey.modal.new({}, "f19")

k:bind("", "escape", function()
	k:exit()
end)

k:bind("", "a", function()
	hs.application.launchOrFocus("Arc")
	k:exit()
end)

k:bind("", "f", function()
	hs.application.launchOrFocus("Finder")
	k:exit()
end)

k:bind("", "k", function()
	hs.application.launchOrFocus("kitty")
	k:exit()
end)

k:bind("", "l", function()
	hs.application.launchOrFocus("Ableton Live 11 Suite")
	k:exit()
end)

k:bind("", "m", function()
	hs.application.launchOrFocus("Messages")
	k:exit()
end)

k:bind("", "o", function()
	hs.application.launchOrFocus("Obsidian")
	k:exit()
end)

k:bind("", "p", function()
	hs.application.launchOrFocus("Preview")
	k:exit()
end)

k:bind("", "s", function()
	hs.application.launchOrFocus("Spotify")
	k:exit()
end)

k:bind("", "t", function()
	hs.application.launchOrFocus("Todoist")
	k:exit()
end)

--------------------------------
-- KEY REPEAT
--------------------------------
local savedKey = nil

-- Event handler to capture key presses
local keyDownEvent = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
	if event:getKeyCode() == 79 then -- Check for F18
		if savedKey then
			savedKey:post()
			return true
		end
	else
		savedKey = event:copy()
		-- hs.printf("Saved Key: %s, KeyCode: %d", savedKey:getCharacters(), savedKey:getKeyCode())
	end
end)

-- Start the event handler
keyDownEvent:start()
