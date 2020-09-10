addEvent (resourceName..".onRequestSerial", true)
addEventHandler (resourceName..".onRequestSerial", root, function ()
	if source ~= client then return end
	triggerClientEvent ( source, resourceName..".onClientReceivedSerial", source, getPlayerSerial(source) )
end)

