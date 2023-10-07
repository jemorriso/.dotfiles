--------------------------------
-- cycle app windows
--------------------------------
-- modified from https://www.mortensoncreative.com/blog/break-up-with-your-mouse-2#hammerspoon-app-switcher
--
-- still has problems if window in non-visible space
--
local lastTapTime = 0
local lastIndex = 1
local allWindows = nil
local tapThreshold = 0.8
local lastName = nil

local hyper = { "ctrl", "shift", "alt", "cmd" }

appWindowFilter = hs.window.filter.new():setDefaultFilter({})

-- TODO leaving unbound for now because it's just cmd+`
-- hs.hotkey.bind(hyper, "n", function()
-- 	cycleAppWindows(1)
-- end)
--
-- hs.hotkey.bind(hyper, "p", function()
-- 	cycleAppWindows(-1)
-- end)

function getAppWindows(appName)
	local currentWindows = {}
	local savedWindows = appWindowFilter:getWindows()
	for _, v in ipairs(savedWindows) do
		if v:application():name() == appName then
			table.insert(currentWindows, v)
		end
	end

	return currentWindows
end

function cycleAppWindows(direction)
	local keyTime = hs.timer.secondsSinceEpoch()
	local currentWin = hs.window.focusedWindow()
	local current = currentWin:application()
	local currentName = current:name()
	print(currentName)
	-- new sequence
	if keyTime - lastTapTime > tapThreshold or lastName == nil or appWindowFilter == nil or lastName ~= currentName then
		lastIndex = 1
		appWindowFilter = hs.window.filter.new()
		-- windowFilter:setFilter(currentName)
		-- allWindows = windowFilter:getWindows()
		allWindows = getAppWindows(currentName)
		lastName = currentName

		print("------")
		for _, v in ipairs(allWindows) do
			print(v:application():name())
		end
		print("------")
	end

	lastIndex = lastIndex + direction
	-- print(lastIndex)
	if lastIndex > #allWindows then
		lastIndex = 1
	elseif lastIndex < 1 then
		lastIndex = #allWindows
	end
	print(lastIndex)
	allWindows[lastIndex]:focus()

	lastTapTime = keyTime
end
