-----------------------------------
--
-- Zone: Moh Gates
--
-----------------------------------
local ID = require("scripts/zones/Moh_Gates/IDs")
require("scripts/globals/status")
require("scripts/globals/zone")
-----------------------------------

local miningPoint =
{
	{139.8798,  20.0241,  88.9825}, -- Map 1 G-5
	{145.3748,  20.9677,  55.0203}, -- Map 1 H-5
	{190.3747,  19.9530,  -45.2183}, -- Map 1 H-7
	{79.2062,  20.1500,  -11.2957}, -- Map 1 G-6
	{80.6445,  30.5000,  -71.3527}, -- Map 1 G-7
	{69.8838,  29.7920,  -374.9613}, -- Map 1 G-11
	{168.3535,  30.9142,  -387.8913}, -- Map 1 H-11
	{242.9664,  40.0965,  -189.6982}, -- Map 1 I-8
	{312.6441,  28.9426,  -135.9306}, -- Map 1 J-8
	{351.8693,  28.8050,  -51.3427}, -- Map 1 J-7
	{376.8394,  30.7051,  -57.3132}, -- Map 1 J-7
	{371.9161,  30.1519,  -20.9792}, -- Map 1 J-6
	{436.4122,  30.1007,  -34.3558}, -- Map 1 K-6
}

function onInitialize(zone)
	GetNPCByID(17879373):setPos(miningPoint[math.random(1, 13)])

	-- Knotted Roots @ G-8
	zone:registerRegion(1, 100.465, 5, -155.908, 0, 0, 0)
	zone:registerRegion(2, 100.339, 5, -165.636, 0, 0, 0)
	-- Knotted Roots @ I-7
	zone:registerRegion(3, 234.855, 5, -60.038, 0, 0, 0)
	zone:registerRegion(4, 243.805, 5, -60.053, 0, 0, 0)
end

function onZoneIn(player, prevZone)
    local cs = -1
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(107, 15, 135, 238)
    end
    return cs
end

function onRegionEnter(player, region)
	switch (region:GetRegionID()): caseof
    {
        [1] = function (x)
				player:setPos(104.696, 30.708, -180.024, 52)
		end,
		[2] = function (x)
				player:setPos(97.650, 35.341, -142.326, 126)
		end,
		[3] = function (x)
				player:setPos(250.064, 23.975, -64.363, 25)
		end,
		[4] = function (x)
				player:setPos(227.100, 20.256, -59.023, 127)
		end,
    }
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end