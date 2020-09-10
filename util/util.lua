thisResource = getThisResource()
resourceName = getResourceName(getThisResource())
resourceRoot = getResourceRootElement(thisResource)
isClient = isElement(localPlayer or false)

if isClient then
	function dxDrawTextLabel (text, leftX, topY, sizeX, sizeY, color, scaleXY, font,  alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation,  fRotationCenterX,  fRotationCenterY)
		local leftXend, topYend = leftX + sizeX, topY + sizeY
		dxDrawText ( text, leftX, topY, leftXend, topYend, color, scaleXY, font,  alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation,  fRotationCenterX,  fRotationCenterY )
	end
end