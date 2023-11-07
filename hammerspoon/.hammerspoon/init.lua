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
-- vim:enterWithSequence("en", 1000)
vim:bindHotKeys({ enter = { { "ctrl", "alt" }, "escape" } })
vim:enableBetaFeature("block_cursor_overlay")

--------------------------------
-- SWITCHERS
--------------------------------

k = hs.hotkey.modal.new({}, "f19")
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

-- require("window_cycle")
-- require("app_window_cycle")
-- require("switcher")

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

--------------------------------
-- key sequence handling
--------------------------------
local KeySequence = {}

function KeySequence:new(keys, maxDelayBetweenKeysMilliseconds, onSequencePressed)
	local sequence = {}

	setmetatable(sequence, self)
	self.__index = self

	-- sequence.keys = stringUtils.toChars(keys)
	-- sequence.keys = { string.char(0x0020), string.char(0x0020) }
	-- sequence.keys = { "z", "/" }
	-- sequence.keys = { "q", "q" }
	-- sequence.keys = { ";", ";" }
	-- sequence.keys = { "\\", "\\" }
	-- sequence.keys = { "\t", "\t" }
	-- sequence.keys = { "\t", "\t" }
	sequence.keys = { "space", "space" }
	sequence.maxDelayBetweenKeysMilliseconds = maxDelayBetweenKeysMilliseconds or 140
	sequence.onSequencePressed = onSequencePressed
	sequence.enabled = false
	sequence.timer = nil
	sequence.sequencePosition = 1
	sequence.typedEvents = {}
	sequence.alreadyTyped = ""
	sequence.alreadyTypedChars = {}
	sequence:resetTap()

	return sequence
end

function KeySequence:enable()
	if self.enabled then
		return
	end

	self.enabled = true
	self:reset()
	self.tap:start()

	return self
end

function KeySequence:disable()
	-- if not self.enabled then return end
	--
	-- self.enabled = false
	self:reset()
	-- self.tap:stop()
	--
	return self
end

function KeySequence:resetTap()
	self.tap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, self:buildEventHandler())
end

function KeySequence:reset()
	self:cancelTimer()
	self:resetEvents()
	self.sequencePosition = 1
	self.alreadyTyped = ""
end

function KeySequence:resetEvents()
	self.typedEvents = {}
	return self
end

function KeySequence:cancelTimer()
	if self.timer then
		self.timer:stop()
	end
end

function KeySequence:startTimer(fn)
	self.timer = hs.timer.doAfter(self.maxDelayBetweenKeysMilliseconds / 1000, fn)
end

function KeySequence:recordEvent(event)
	local currentModifiers = event:getFlags()
	local currentKey = event:getKeyCode()
	-- local currentCharacters = event:getCharacters()

	table.insert(self.typedEvents, hs.eventtap.event.newKeyEvent(currentModifiers, currentKey, true))

	table.insert(self.typedEvents, hs.eventtap.event.newKeyEvent(currentModifiers, currentKey, false))

	-- table.insert(self.alreadyTypedChars, currentCharacters)
	table.insert(self.alreadyTypedChars, currentKey)
end

function KeySequence:recordKey(key)
	self.alreadyTyped = self.alreadyTyped .. key
end

local function getTableSize(t)
	local count = 0
	for _, __ in pairs(t) do
		count = count + 1
	end

	return count
end

function KeySequence:buildEventHandler()
	return function(event)
		if not self.enabled then
			return
		end

		-- got another key, kill the abort timer
		self:cancelTimer()

		local position = self.sequencePosition
		local keyPressed = hs.keycodes.map[event:getKeyCode()]
		local keyToCompare = self.keys[position]

		if keyPressed == keyToCompare and getTableSize(event:getFlags()) == 0 then
			local typedFinalChar = position == #self.keys

			if typedFinalChar then
				self:disable()
				self.onSequencePressed()
			else
				self.sequencePosition = position + 1
				self:recordEvent(event)
				self:recordKey(keyPressed)

				self:startTimer(function()
					self.tap:stop()
					-- hs.eventtap.keyStrokes(self.alreadyTyped)

					-- for _, keyEvent in ipairs(self.typedEvents) do
					-- 	hs.eventtap.keyStrokes(keyEvent.modifiers, keyEvent.key)
					-- end
					-- for _, keyEvent in ipairs(self.alreadyTypedChars) do
					-- 	hs.eventtap.keyStroke({}, keyEvent)
					-- end
					hs.eventtap.keyStroke({}, self.alreadyTypedChars[1])
					self.tap:start()

					self:reset()
				end)
			end

			return true
		elseif self.sequencePosition > 1 then
			-- Abort the sequence and pass through any keys we already typed
			self:recordEvent(event)
			local events = self.typedEvents

			self:reset()

			return true, events
		end

		return false
	end
end

-- local KeySequence = dofile("/Users/jerry/.hammerspoon/Spoons/VimMode.spoon/lib/key_sequence.lua")
local testSequence = KeySequence:new("qq", 300, function()
	-- fn mod is necessary to send f19
	-- hs.eventtap.keyStroke({ "fn" }, "f19")
	k:enter()
	print("Sequence completed")
	-- Send the F19 key
	-- local f19Event = hs.eventtap.event.newKeyEvent({}, 80, true)
	-- f19Event:setType(hs.eventtap.event.types.keyDown)
	-- f19Event:post()
	-- f19Event:setType(hs.eventtap.event.types.keyUp)
	-- f19Event:post()
end)
testSequence:enable()
