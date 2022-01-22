-----------------------------------
-- Area: Sih Gates
-- NPC: Mining Point
-- ID's: 17875283, 17875284, 17875285, 17875286, 17875287, 17875288
-----------------------------------
local ID = require("scripts/zones/Sih_Gates/IDs")
require("scripts/globals/helm")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------

local drops =
{
	{3230, 17296}, -- Pebble
	{1620,   644}, -- Mythril Ore
	{2000,  2126}, -- Orpiment
	{2000,   642}, -- Zinc Ore
	{1500,   641}, -- Tin Ore
	{1000,   647}, -- Molybdenum Ore
	{1000,  3922}, -- Rhodium Ore
}

local points =
{
	-- {-59.243,  -21.252,  -59.163}, -- Map 1 I-6
	
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
		local zoneId = 268
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