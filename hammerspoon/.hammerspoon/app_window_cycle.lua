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

local meh = { "ctrl", "shift", "alt" }
local hyper = { "ctrl", "shift", "alt", "cmd" }

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
