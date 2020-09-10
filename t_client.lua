local screenWidth, screenHeight = guiGetScreenSize()

local block = {
	size = {100,80},
	labelSizeY = 15
}

block.name = {
	position = {0,0},
	size = {block.size[1], block.labelSizeY}
}
block.date = {
	position = {0,block.labelSizeY},
	size = {block.size[1], block.labelSizeY}
}

block.serial = {
	position = {0,2*block.labelSizeY},
	size = {block.size[1], block.size[2]-2*block.labelSizeY}
}

local currentPosition = {0,0}
local userData = {
	name = "",
	serial = "",
	date = "",

	update = function(self)
		currentPosition[1], currentPosition[2] = math.random(0,screenWidth - block.size[1]), math.random(0,screenHeight - block.size[2])
		self.name = localPlayer.name
		
		self.date = os.time()
		self.date = os.date("*t",self.date)
		self.date = self.date.day.."."..self.date.month.."."..self.date.year
	end
	
}

userData.render = function (self)
	dxDrawRectangle ( currentPosition[1], currentPosition[2], block.size[1], block.size[2], tocolor(0,0,0,150), true )
	
	dxDrawTextLabel ( userData.serial, block.serial.position[1]+currentPosition[1], block.serial.position[2]+currentPosition[2], block.serial.size[1], block.serial.size[2], white, 1.0 , "default", "center", "center", true, true, true, false )
	dxDrawTextLabel ( userData.name, block.name.position[1]+currentPosition[1], block.name.position[2]+currentPosition[2], block.name.size[1], block.name.size[2], white, 1.0 , "default", "center", "center", false, false, true, false )
	dxDrawTextLabel ( userData.date, block.date.position[1]+currentPosition[1], block.date.position[2]+currentPosition[2], block.date.size[1], block.date.size[2], white, 1.0 , "default", "center", "center", false, false, true, false )
end

addEvent (resourceName..".onClientReceivedSerial", true)
addEventHandler (resourceName..".onClientReceivedSerial", localPlayer, function (serial)
	userData.serial = serial
	userData:update()	
end)

addEventHandler( "onClientResourceStart", resourceRoot, function ()
	addEventHandler ( "onClientRender", root, userData.render )
	
	userData:update()
	setTimer(userData.update, 8000, 0, userData)
	
	setTimer( triggerServerEvent, 3500, 1, resourceName..".onRequestSerial", localPlayer )
end)

