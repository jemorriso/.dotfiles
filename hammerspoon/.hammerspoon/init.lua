-- k = hs.hotkey.modal.new({}, "f19")
--
-- k:bind("", "escape", function()
-- 	k:exit()
-- end)
--
-- k:bind("", "a", function()
-- 	hs.application.launchOrFocus("Arc")
-- 	k:exit()
-- end)
--
-- k:bind("", "c", function()
-- 	hs.application.launchOrFocus("Visual Studio Code")
-- 	k:exit()
-- end)
--
-- k:bind("", "f", function()
-- 	hs.application.launchOrFocus("Finder")
-- 	k:exit()
-- end)
--
-- k:bind("", "k", function()
-- 	hs.application.launchOrFocus("kitty")
-- 	k:exit()
-- end)
--
-- k:bind("", "l", function()
-- 	hs.application.launchOrFocus("Ableton Live 11 Suite")
-- 	k:exit()
-- end)
--
-- k:bind("", "m", function()
-- 	hs.application.launchOrFocus("Messages")
-- 	k:exit()
-- end)
--
-- k:bind("", "o", function()
-- 	hs.application.launchOrFocus("Obsidian")
-- 	k:exit()
-- end)
--
-- k:bind("", "p", function()
-- 	hs.application.launchOrFocus("Preview")
-- 	k:exit()
-- end)
--
-- k:bind("", "s", function()
-- 	hs.application.launchOrFocus("Spotify")
-- 	k:exit()
-- end)
--
-- k:bind("", "t", function()
-- 	hs.application.launchOrFocus("Todoist")
-- 	k:exit()
-- end)
--
--------------------------------
-- KEY REPEAT
--------------------------------
local outputKey = nil
local repeatKey = nil
local altKey = nil
local fromRepeat = false
local fromAltRepeat = false

local function getKey(key, otherKey)
	local toSend = key:copy()
	if otherKey ~= nil then
		-- TODO will this work with mods
		if otherKey:getKeyCode() == 125 then
			toSend:setKeyCode(126)
		end
		if otherKey:getKeyCode() == 126 then
			toSend:setKeyCode(125)
		end
	end
	return toSend
end

-- Event handler to capture key presses
local keyDownEvent = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
	local keyCode = event:getKeyCode()
	local flags = event:getFlags()
	local shifted = flags["shift"]
	-- hs.printf("shifted: %s", shifted)
	if keyCode == 79 and shifted == nil and outputKey ~= nil then -- Check for F18
		repeatKey = getKey(outputKey, altKey)
		-- repeatKey = outputKey:copy()
		-- if altKey ~= nil then
		-- 	-- TODO will this work with mods
		-- 	if altKey:getKeyCode() == 125 then
		-- 		repeatKey:setKeyCode(126)
		-- 	end
		-- 	if altKey:getKeyCode() == 126 then
		-- 		repeatKey:setKeyCode(125)
		-- 	end
		-- end
		fromRepeat = true
		repeatKey:post()
		return true
	elseif (keyCode == 80 or keyCode == 79 and shifted == true) and outputKey ~= nil then -- Check for F19
		local otherKey = outputKey
		if repeatKey then
			otherKey = repeatKey
		else
			repeatKey = outputKey:copy()
		end
		altKey = getKey(outputKey, otherKey)
		-- altKey = outputKey:copy()
		-- altKey = outputKey:copy()
		-- if repeatKey then
		-- 	altKey = repeatKey:copy()
		-- 	if repeatKey:getKeyCode() == 125 then
		-- 		altKey:setKeyCode(126)
		-- 	end
		-- 	if repeatKey:getKeyCode() == 126 then
		-- 		altKey:setKeyCode(125)
		-- 	end
		-- end
		fromAltRepeat = true
		altKey:post()
		return true
	else
		if fromRepeat == false and fromAltRepeat == false then
			altKey = nil
			repeatKey = nil
		end
		outputKey = event:copy()
		hs.printf("Output Key: %s, KeyCode: %d", outputKey:getCharacters(), outputKey:getKeyCode())
		hs.printf("From repeat: %s", fromRepeat)
		fromRepeat = false
		fromAltRepeat = false
	end
end)

-- Start the event handler
keyDownEvent:start()
