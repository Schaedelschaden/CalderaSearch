-----------------------------------
--
-- Zone: Dho Gates
--
-----------------------------------
local ID = require("scripts/zones/Dho_Gates/IDs")
-----------------------------------

local miningPoint =
{
	{-42.9705, -9.6283, 131.1130}, -- Map 1 J-9
	{-102.7290, -5.8036, 56.2637}, -- Map 1 I-10
	{-107.3074, 0.2733, -92.4597}, -- Map 1 I-12
	{45.0931, -0.3023, -132.6878}, -- Map 1 K-12
	{-212.7750, -1.5898, -50.7869}, -- Map 1 H-11
	{-132.0227, -0.4453, 57.3262}, -- Map 1 I-10
	{-164.1054, -20.6023, 186.5916}, -- Map 1 H-8
	{-207.2807, -20.3945, 266.9072}, -- Map 1 H-7
	{-334.4267, -31.1591, 236.1676}, -- Map 1 F-8
	{-281.9800, -39.3554, 327.9781}, -- Map 1 G-6
	{-93.6195, -20.4330, 280.3659}, -- Map 1 I-7
	{-15.7862, -20.6389, 264.6770}, -- Map 1 K-7
	{-33.7789, -19.3170, 327.3988}, -- Map 1 J-6
	{-129.7055, -20.3830, 424.5038}, -- Map 1 I-5
	{11.1792, -20.3860, 470.7080}, -- Map 1 K-5
	{103.5568, -0.8877, 407.2049}, -- Map 1 L-5
}

function onInitialize(zone)
	GetNPCByID(17891678):setPos(miningPoint[math.random(1, 16)])

	-- Knotted Roots obstruction @ H/I-7
	zone:registerRegion(1, -155.7168, 5, 300.7351, 0, 0, 0)
	zone:registerRegion(2, -165.6084, 5, 299.2388, 0, 0, 0)
	-- Knotted Roots obstruction @ J-9/10
	zone:registerRegion(3, -59.8610, 5, 75.9559, 0, 0, 0)
	zone:registerRegion(4, -61.8069, 5, 84.7884, 0, 0, 0)
end

function onZoneIn(player, prevZone)
    local cs = -1
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(62, -10, 83, 84)
    end
    return cs
end

function onRegionEnter(player, region)
	switch (region:GetRegionID()): caseof
	{
		-- Knotted Roots obstruction @ H/I-7
		[1] = function (x)
				player:setPos(-172.0345, -20.1812, 299.2067, 122)
		end,
		[2] = function (x)
				player:setPos(-148.0171, -20.5897, 301.0476, 255)
		end,
		-- Knotted Roots obstruction @ J-9/10
		[3] = function (x)
				player:setPos(-66.1539, -9.9939, 89.2405, 164)
		end,
		[4] = function (x)
				player:setPos(-60.8428, -9.8858, 70.6870, 70)
		end,
	}
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
