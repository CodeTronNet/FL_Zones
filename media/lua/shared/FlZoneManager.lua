require("FlZone")

FlZoneManager = {}

FlZoneManager.new = function()
	local self = {}

	self.zones = {}

	function self.addZone(zone)
		self.zones[zone.key] = zone
	end

	function self.contains(x, y)

		for k, v in pairs(self.zones) do
			if v.contains(x, y) then
				return true
			end
		end

		return false
	end

	return self
end

FlZones = FlZoneManager.new()
