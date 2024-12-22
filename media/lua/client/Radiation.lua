require("FlZoneManager")
require("FlZone")
require("MF_ISMoodle");

MF.createMoodle("FlZoneRadiation")

local function updateRadiation(player)
	local x = player:getX()
	local y = player:getY()

	local isInZone = FlZones.contains(x, y)
	local moodle = MF.getMoodle("FlZoneRadiation");

	if moodle ~= nil then
		if isInZone then
			moodle:setValue(0.25);
		else
			moodle:setValue(0.5);
		end
	end
end

local function initRadiation()
	local zone = FlZone.new("test", 6392, 6396, 5444, 5448)
	FlZones.addZone(zone)
end

initRadiation()

Events.OnPlayerUpdate.Add(updateRadiation);
