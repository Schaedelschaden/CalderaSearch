-----------------------------------
-- Area: Dho Gates
-- NPC: Mining Point
-- ID's: 17891678, 17891679, 17891680, 17891681, 17891682, 17891683
-----------------------------------
local ID = require("scripts/zones/Dho_Gates/IDs")
require("scripts/globals/helm")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------

local drops =
{
	{3230, 17296}, -- Pebble
	{1620,   644}, -- Mythril Ore
	{1310,  3928}, -- Velkk Necklace
	{1010,   881}, -- Crab Shell
	{910,   4044}, -- Atramenterrane
	{810,    737}, -- Gold Ore
	{710,    738}, -- Platinum Ore
	{400,   4023}, -- Snowsteel Ore
}

local points =
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

local function doMove(npc, x, y, z)
    return function(entity)
--		printf("Mining_Point.lua doMove X: [%f] Y: [%f] Z: [%f]", x, y, z)
        entity:setPos(x, y, z, 0)
    end
end

local function movePoint(npc, zoneId, info)
    local point = points[math.random(#points)]
    npc:hideNPC(20)
    npc:queue(3000, doMove(npc, unpack(point)))
end

function onTrade(player, npc, trade)
	local uses = npc:getLocalVar("uses")

	if (npcUtil.tradeHasExactly(trade, 605)) then
		local zoneId = 272
		local breakChance = 33
		local broke = math.random(100)
		local full = (player:getFreeSlotsCount() == 0) and 1 or 0
		
		-- sum weights
		local sum = 0
		for i = 1, #drops do
			sum = sum + drops[i][1]
		end

		-- pick weighted result
		local item = 0
		local pick = math.random(sum)
		sum = 0
		for i = 1, #drops do
			sum = sum + drops[i][1]
			if sum >= pick then
				item = drops[i][2]
				break
			end
		end
		
		-- success! reward item and decrement number of remaining uses on the point
        if (broke > breakChance and item ~= 0 and full == 0) then
            player:addItem(item)
			player:messageSpecial(ID.text.ITEM_OBTAINED, item)

            local uses = (npc:getLocalVar("uses") - 1) % 4
            npc:setLocalVar("uses", uses)
            if uses == 0 then
                movePoint(npc, zoneId, info)
            end
		elseif (full ~= 0) then
			player:messageSpecial(ID.text.INVENTORY_FULL)
		elseif (broke < breakChance) then
			player:messageSpecial(ID.text.PICKAXE_BROKE, 605)
			player:delItem(605, 1, tpz.inv.INVENTORY)
        end
	end
end

function onTrigger(player, npc)
	tpz.helm.onTrigger(player, tpz.helm.type.MINING)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end