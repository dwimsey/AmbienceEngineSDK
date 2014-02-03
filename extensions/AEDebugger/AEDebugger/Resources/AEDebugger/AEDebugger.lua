function DebuggerInit(forceDebuggerEnabled)
	local prefs = AEEngine:GetPreferencesManager()

	if forceDebuggerEnabled then
		prefs:SetBoolean('AEDebugger/enabled', true)
	end

	if prefs:GetBoolean('AEDebugger/enabled', false) == false then
		return
	end



	print "AEDebugger attached."
	self = nil
end

DebuggerInit()
