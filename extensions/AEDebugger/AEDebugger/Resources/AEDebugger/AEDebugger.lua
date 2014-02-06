function DebuggerInit(forceDebuggerEnabled)
	local prefs = AEEngine:GetPreferencesManager()

	if forceDebuggerEnabled then
		prefs:SetBoolean('AEDebugger/enabled', true)
	end

	if prefs:GetBoolean('AEDebugger/enabled', false) == false then
		return
	end

	AEDebuggerRocketContext = rocket.contexts["AEViewportContext"]
	if AEDebuggerRocketContext == nil then
		AEError("Could not find default viewport for AEDebugger librocket context.");
		return
	end

	local dConsoleURL = "FILE://AEDebugger/GUI/console.rml"
	AEDebuggerRocketConsole = AEDebuggerRocketContext:LoadDocument(dConsoleURL)
	if AEDebuggerRocketConsole == nil then
		AEError("Could not load debugger console: " .. dConsoleURL);
		return
	end
	AEDebuggerRocketConsole:Show()

	print "AEDebugger attached2."
	self = nil
end

DebuggerInit()
