local isRunningOnClient = tostring(isElement(localPlayer or false))

local eventsNames = {
	["true"] = "Client",
	["false"] = "",
	["nil"] = ""
}

-- [name] = {started = true/false}
local includeData = {}

addEventHandler( "on"..eventsNames[isRunningOnClient].."ResourceStart", root,	function ( startedRes )
	includeData[getResourceName( startedRes )] = {
		started = true
	}
end)
		
addEventHandler( "on"..eventsNames[isRunningOnClient].."ResourceStop", root,	function ( startedRes )
	includeData[getResourceName( startedRes )] = {
		started = false
	}
end)

isRunningOnClient, eventsNames = nil, nil

function include(name)

	if not name then 
		return false
	end
	
	if not includeData[name] then
		
		includeData[name] = {
			started = false
		}

		local targetResource = getResourceFromName(name)
		
		if type(targetResource) == "userdata" then
			includeData[name].started = (tostring(getResourceState (targetResource)) == "running")
		end

	end
	
	if includeData[name].started then
		return exports[name]
	else	
		return false
	end		
end
----------------MODUL INCLUDE SYSTEM----------------------
----------------------------------------------------------