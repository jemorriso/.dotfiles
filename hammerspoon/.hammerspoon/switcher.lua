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

function obj:previousWindow(onlyCurrentApp)
	local windowChoices = obj:list_window_choices(onlyCurrentApp)
	if #windowChoices == 0 then
		-- if onlyCurrentApp then
		-- 	hs.alert.show("no other window for this application ")
		-- else
		-- 	hs.alert.show("no other window available ")
		-- end
		return
	end
	local v = windowChoices[1]["win"]
	if v then
		v:focus()
	end
end

local meh = { "ctrl", "shift", "alt" }
local hyper = { "ctrl", "shift", "alt", "cmd" }

-- cycles through all widows of the frontmost app.
function switcherfunc()
	return obj:switchWindow(true)
end

-- Alt-tab replacement to go to last window
hs.hotkey.bind(meh, "b", function()
	obj:previousWindow(false)
end)

hs.hotkey.bind(hyper, "b", function()
	obj:previousWindow(true)
end)

-- return obj

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

-- local meh = { "ctrl", "shift", "alt" }
-- local hyper = { "ctrl", "shift", "alt", "cmd" }

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
