-----------------------------------
-- Area: Moh Gates
-- NPC: Mining Point
-- ID's: 17879373, 17879374, 17879375, 17879376, 17879377, 17879378
-----------------------------------
local ID = require("scripts/zones/Moh_Gates/IDs")
require("scripts/globals/helm")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------

local drops =
{
	{3000, 928}, -- Bomb Ash
--	{3000, 768}, -- Flint Stone
	{2000, 3918}, -- Midrium Ore
	{1800, 1108}, -- Sulfur
	{1500, 756}, -- Durium Ore
	{1400, 643}, -- Iron Ore
	{1250, 736}, -- Silver Ore
--	{1000, 4043}, -- Lavarion
	{920, 3920}, -- Vanadium Ore
	{875, 1703}, -- Kunwu Ore
	{2000, 741}, -- Palladian Brass Ore
	{1700, 734}, -- Thokcha Ore
}

local points =
{
	{139.8798,  20.0241,  88.9825}, -- Map 1 G-5
	{145.3748,  20.9677,  55.0203}, -- Map 1 H-5
	{190.3747,  19.9530,  -45.2183}, -- Map 1 H-7
	{79.2062,  20.1500,  -11.2957}, -- Map 1 G-6
	{80.6445,  30.5000,  -71.3527}, -- Map 1 G-7
	{69.8838,  29.7920,  -374.9613}, -- Map 1 G-11
	{168.3535,  30.9142,  -387.8913}, -- Map 1 H-11
	{242.9664,  40.0965,  -189.6982}, -- Map 1 I-8
--	{-42.9705,  -9.6283,  131.1130}, -- Map 1 J-9 -- Open space?
	{312.6441,  28.9426,  -135.9306}, -- Map 1 J-8
	{351.8693,  28.8050,  -51.3427}, -- Map 1 J-7
	{376.8394,  30.7051,  -57.3132}, -- Map 1 J-7
	{371.9161,  30.1519,  -20.9792}, -- Map 1 J-6
	{436.4122,  30.1007,  -34.3558}, -- Map 1 K-6
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