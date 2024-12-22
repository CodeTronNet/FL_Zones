FlZone = {}

FlZone.new = function(key, x1, x2, y1, y2)
	local self = {};

	self.key = key
	self.x1 = x1
	self.x2 = x2
	self.y1 = y1
	self.y2 = y2

	function self.contains(x, y)

		if x < x1 or x > (x2 + 1) then
			return false
		end

		if y < y1 or y > (y2 + 1) then
			return false
		end

		return true
	end

	return self
end
