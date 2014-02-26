function DebuggerInit(forceDebuggerEnabled)
	local prefs = AEEngine:GetPreferencesManager()

    local isVerboseDebug = false
    if prefs:GetBoolean('AEDebugger/verbose', false) == true then
        isVerboseDebug = true
        print "AEDebugger: VERBOSE"
    end

    if forceDebuggerEnabled then
        if isVerboseDebug then
            print "AEDebugger: Forcably ENABLED."
        end
        prefs:SetBoolean('AEDebugger/enabled', true)
    else
        if forceDebuggerDisabled then
            if isVerboseDebug then
                print "AEDebugger: Forcably DISABLED."
            end
            prefs:SetBoolean('AEDebugger/enabled', false)
        end
    end

    if prefs:GetBoolean('AEDebugger/enabled', false) == false then
        if isVerboseDebug then
            print "AEDebugger: Disabled, not attaching."
        end
		return
	end
    if isVerboseDebug then
        print "AEDebugger: Attaching ..."
    end

	AEDebuggerRocketContext = rocket.contexts["AEViewportContext"]
	if AEDebuggerRocketContext == nil then
		AEError("Could not find default viewport for AEDebugger librocket context.");
		return
	end
    if isVerboseDebug then
        print("AEDebugger: GUI context:", AEDebuggerRocketContext)
    end

	local dConsoleURL = "FILE://AEDebugger/GUI/console.rml"
	AEDebuggerRocketConsole = AEDebuggerRocketContext:LoadDocument(dConsoleURL)
	if AEDebuggerRocketConsole == nil then
		AEError("Could not load debugger console: " .. dConsoleURL);
		return
	end
    if isVerboseDebug then
        print("AEDebugger: Console window:", AEDebuggerRocketConsole)
    end
	AEDebuggerRocketConsole:Show()

    if isVerboseDebug then
        print "AEDebugger: Attached."
    end

	AEDebuggerRocketConsole:Hide()

	self = nil
end

DebuggerInit()
