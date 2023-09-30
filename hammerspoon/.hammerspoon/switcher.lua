-- from https://github.com/Porco-Rosso/PorcoSpoon/blob/891afa4acf2c7dc088b8f749b6e152ec8d903b23/switcher.lua

local obj = {}
obj.__index = obj

-- using defaultFilter because the app filter doesn't work across spaces from what I've seen
theWindows = hs.window.filter.new()
theWindows:setDefaultFilter({})
theWindows:setSortOrder(hs.window.filter.sortByFocusedLast)
obj.currentWindows = {}

-- Start by saving all windows
for i, v in ipairs(theWindows:getWindows()) do
	table.insert(obj.currentWindows, v)
end

function obj:list_window_choices(onlyCurrentApp)
	local windowChoices = {}
	local currentWin = hs.window.focusedWindow()
	local currentApp = currentWin:application()
	for i, w in ipairs(obj.currentWindows) do
		if w ~= currentWin then
			local app = w:application()
			local appImage = nil
			local appName = "(none)"
			if app then
				appName = app:name()
				appImage = hs.image.imageFromAppBundle(w:application():bundleID())
			end
			if (not onlyCurrentApp) or (app == currentApp) then
				table.insert(windowChoices, {
					text = w:title() .. "--" .. appName,
					subText = appName,
					uuid = i,
					image = appImage,
					win = w,
				})
			end
		end
	end
	return windowChoices
end

function obj:switchWindow(onlyCurrentApp)
	local windowChoices = obj:list_window_choices(onlyCurrentApp)
	if #windowChoices == 0 then
		-- if onlyCurrentApp then
		-- 	hs.alert.show("no other window for this application ")
		-- else
		-- 	hs.alert.show("no other window available ")
		-- end
		return
	end
	local c = #windowChoices
	local v = windowChoices[c]["win"]
	if v then
		v:focus()
	end
end

-- cycles through all widows of the frontmost app.
function switcherfunc()
	return obj:switchWindow(true)
end

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

local mods = { "ctrl", "shift", "cmd" }

hs.hotkey.bind(mods, "a", function()
	openswitch("Arc")()
end)

hs.hotkey.bind(mods, "f", function()
	openswitch("Finder")()
end)

hs.hotkey.bind(mods, "k", function()
	openswitch("kitty")()
end)

hs.hotkey.bind(mods, "m", function()
	openswitch("Messages")()
end)

hs.hotkey.bind(mods, "o", function()
	openswitch("Obsidian")()
end)

hs.hotkey.bind(mods, "p", function()
	openswitch("Preview")()
end)

hs.hotkey.bind(mods, "s", function()
	openswitch("Spotify")()
end)
