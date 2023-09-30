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
vim:bindHotKeys({ enter = { { "ctrl", "alt" }, "i" } })
vim:enableBetaFeature("block_cursor_overlay")

--------------------------------
-- SWITCHERS
--------------------------------

--------------------------------
-- different keybinding for each app
--------------------------------
local switcher = require("switcher")

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

local meh = { "ctrl", "shift", "alt" }
local hyper = { "ctrl", "shift", "alt", "cmd" }

k = hs.hotkey.modal.new(meh, "a")
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

--------------------------------
-- cycle all windows
--------------------------------
local lastTapTime = 0
local lastIndex = 1
local allWindows = nil
local tapThreshold = 0.8

-- include invisible windows by using {} as defaultFilter
-- seems to be a bit buggy when including spaces that aren't visible but good enough
windowFilter = hs.window.filter.new():setDefaultFilter({})
-- windowFilter.forceRefreshOnSpaceChange = true

hs.hotkey.bind(meh, "n", function()
	cycleWindows(1)
end)

hs.hotkey.bind(meh, "p", function()
	cycleWindows(-1)
end)

function cycleWindows(direction)
	local keyTime = hs.timer.secondsSinceEpoch()
	-- new sequence
	if keyTime - lastTapTime > tapThreshold then
		lastIndex = 1
		allWindows = windowFilter:getWindows()
	end

	lastIndex = lastIndex + direction
	if lastIndex > #allWindows then
		lastIndex = 1
	elseif lastIndex < 1 then
		lastIndex = #allWindows
	end
	allWindows[lastIndex]:focus()

	lastTapTime = keyTime
end

--------------------------------
-- cycle app windows
--------------------------------
-- modified from https://www.mortensoncreative.com/blog/break-up-with-your-mouse-2#hammerspoon-app-switcher
--
-- still has problems if window in non-visible space
--
local lastTapTimeApp = 0
local lastIndexApp = 1
local allWindowsApp = nil
local tapThresholdApp = 0.8
local lastAppName = nil

windowFilterApp = hs.window.filter.new():setDefaultFilter({})

hs.hotkey.bind(hyper, "n", function()
	cycleWindowsApp(1)
end)

hs.hotkey.bind(hyper, "p", function()
	cycleWindowsApp(-1)
end)

function getWindows(appName)
	local currentAppWindows = {}
	local savedWindows = windowFilterApp:getWindows()
	for _, v in ipairs(savedWindows) do
		if v:application():name() == appName then
			table.insert(currentAppWindows, v)
		end
	end

	return currentAppWindows
end

function cycleWindowsApp(direction)
	local keyTime = hs.timer.secondsSinceEpoch()
	local currentWin = hs.window.focusedWindow()
	local currentApp = currentWin:application()
	local currentAppName = currentApp:name()
	print(currentAppName)
	-- new sequence
	if
		keyTime - lastTapTimeApp > tapThresholdApp
		or lastAppName == nil
		or windowFilterApp == nil
		or lastAppName ~= currentAppName
	then
		lastIndexApp = 1
		windowFilterApp = hs.window.filter.new()
		-- windowFilterApp:setAppFilter(currentAppName)
		-- allWindowsApp = windowFilterApp:getWindows()
		allWindowsApp = getWindows(currentAppName)
		lastAppName = currentAppName

		print("------")
		for _, v in ipairs(allWindowsApp) do
			print(v:application():name())
		end
		print("------")
	end

	lastIndexApp = lastIndexApp + direction
	-- print(lastIndexApp)
	if lastIndexApp > #allWindowsApp then
		lastIndexApp = 1
	elseif lastIndexApp < 1 then
		lastIndexApp = #allWindowsApp
	end
	print(lastIndexApp)
	allWindowsApp[lastIndexApp]:focus()

	lastTapTimeApp = keyTime
end
