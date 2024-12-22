require("FlZoneManager")
require("FlZone")

local SPRINTER = 1
local FAST_SHAMBLER = 2
local SHAMBLER = 3
local DEFAULT_SPEED_TYPE = FAST_SHAMBLER

local function getZombieSpeedType(zombie)
	local speedTypeField = getClassField(zombie, 51)
	return getClassFieldVal(zombie, speedTypeField)
end

local function updateZoneSprinters(zombie)
	local x = zombie:getX()
	local y = zombie:getY()

	local isInZone = FlZones.contains(x, y)
	local currentSpeedType = getZombieSpeedType(zombie)
	local targetSpeedType = FAST_SHAMBLER

	if isInZone then
		targetSpeedType = SPRINTER
	end

	if(currentSpeedType == targetSpeedType) then
		return
	end

	print("update zombie speed (" .. currentSpeedType .. "to" .. targetSpeedType .. ")")

	getSandboxOptions():set("ZombieLore.Speed", targetSpeedType)
	zombie:makeInactive(true)
	zombie:makeInactive(false)
	getSandboxOptions():set("ZombieLore.Speed", DEFAULT_SPEED_TYPE)
end

Events.OnZombieUpdate.Add(updateZoneSprinters);