--------------------------------
-- cycle all windows
--------------------------------
local lastTapTime = 0
local lastIndex = 1
local allWindows = nil
local tapThreshold = 0.8

local meh = { "ctrl", "shift", "alt" }

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
