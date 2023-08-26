--------------------------------
-- WINDOW SWITCHER
--------------------------------

-- Define a function to launch or switch to the "kitty" app
-- function launchOrSwitchToKitty()
-- 	local appName = "Spotify"
-- 	local app = hs.application.get(appName)
--
-- 	if not app then
-- 		-- If the app is not running, launch it
-- 		hs.application.launchOrFocus(appName)
-- 	else
-- 		-- If the app is running, activate its main window
-- 		local mainWindow = app:mainWindow()
-- 		if mainWindow then
-- 			mainWindow:focus()
-- 		else
-- 			app:activate()
-- 		end
-- 	end
-- end

-- Bind the key combination to the function
-- hs.hotkey.bind({ "ctrl", "cmd", "shift" }, "k", launchOrSwitchToKitty)
-- hs.hotkey.bind({ "ctrl", "cmd", "shift" }, "z", launchOrSwitchToKitty)

-- building it up
-- local mod = { "ctrl", "cmd", "shift" }
-- hs.hotkey.bind(mod, "z", function()
-- 	local app = hs.application.get("kitty")
-- 	if app then
-- 		app:activate(true)
-- 	else
-- 		hs.application.launchOrFocus("kitty")
-- 	end
-- end)

-- hs.hotkey.bind(mod, "z", function()
-- 	local app = hs.application.get("Spotify")
-- 	if app then
-- 		app:activate(true)
-- 	else
-- 		hs.application.launchOrFocus("Spotify")
-- 	end
-- end)

-- if you want to use a different keyboard combo, define it here.
local mod = { "cmd", "ctrl", "shift" }

-- define your own shortcut list here
local windows = {
	z = "Arc",
	-- C = "Google Chrome",
	-- E = "Emacs",
	-- F = "Finder",
	-- I = "Iterm",
	-- M = "Messages",
	-- N = "Notion",
	-- S = "Slack",
	-- V = "Visual Studio Code",
	-- V = "Code",
	-- ['\\'] = "Hammerspoon", -- opens the Hammerspoon console. useful
}

-- if the app has to be launched by a different name
-- than the one the windows are found by, this list
-- will take precedence when opening the app.
local windowLaunchNames = {
	-- currently just VS Code
	V = "Visual Studio Code",
}

local lastKey = ""
local lastKeyTime = 0
local lastWindowIndex = 1
local appWindows = nil
local doubleKeyThreshold = 0.8

-- set up the binding for each key combo
for key, appName in pairs(windows) do
	hs.hotkey.bind(mod, key, function()
		local keyTime = hs.timer.secondsSinceEpoch()
		-- for a repeated key press, cycle through windows
		if key == lastKey and keyTime - lastKeyTime < doubleKeyThreshold then
			if appWindows == nil then
				-- find the switchable windows
				local app = hs.application.find(appName)
				if app then
					-- appWindows = hs.fnutils.filter(app:allWindows(), function(w)
					-- 	return w:isStandard()
					-- end)
					appWindows = app:allWindows()
				end
			end

			if appWindows and #appWindows > 0 then
				-- increment and loop
				lastWindowIndex = lastWindowIndex % #appWindows + 1

				--cycle apps
				appWindows[lastWindowIndex]:focus()
			end
		else
			-- switch to window
			appWindows = nil
			lastWindowIndex = 1

			local app = hs.application.get(appName)
			if app then
				app:activate(true)
			else
				local launchName = windowLaunchNames[key] or appName
				hs.application.launchOrFocus(launchName)
			end
		end

		lastKey = key
		lastKeyTime = keyTime
	end)
end

-- Define a function to print information about all windows of a specific app
function printAllWindows(appName)
	local app = hs.application.get(appName)
	if app then
		local allWindows = hs.window.filter.new(app:allWindows())
		for _, window in ipairs(allWindows:getWindows()) do
			print("Window Title:", window:title())
			-- print("Window ID:", window:id())
			-- print("Window Role:", window:role())
			-- print("Window Subrole:", window:subrole())
			print("--------------------")
		end
	else
		print("Application not found:", appName)
	end
end

-- Call the function to print information about windows of the "Arc" app
printAllWindows("kitty")
