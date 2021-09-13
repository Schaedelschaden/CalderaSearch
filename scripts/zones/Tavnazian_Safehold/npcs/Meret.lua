-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Meret
-- !pos 83.166 -25.082 4.633 26
-----------------------------------
local ID = require("scripts/zones/Tavnazian_Safehold/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------

-- [tradedItemId] = rewardItemId
local trades =
{
    [1783] =  5410, -- Luminion Tissue      -> Virtue Stone Pouch
    [1784] =  5410, -- Phuabo Organ         -> Virtue Stone Pouch
    [1785] =  5410, -- Xzomit Organ         -> Virtue Stone Pouch
    [1786] =  5410, -- Aern Organ           -> Virtue Stone Pouch
    [1787] =  5410, -- Hpemde Organ         -> Virtue Stone Pouch
    [1788] =  5410, -- Yovra Organ          -> Virtue Stone Pouch
    [1818] =  5410, -- Euvhi Organ          -> Virtue Stone Pouch
    [1819] =  5410, -- Luminion Chip        -> Virtue Stone Pouch
    [1901] = 15471, -- Vice of Antipathy    -> Merciful Cape
    [1902] = 15472, -- Vice of Avarice      -> Altruistic Cape
    [1903] = 15473, -- Vice of Aspersion    -> Astute Cape
    [1911] = 14808, -- Aura of Adulation    -> Novio Earring
    [1912] = 14809, -- Aura of Voracity     -> Novia Earring
	[{1913, {"gil", 1}}] = 20820, -- Sin of Indignation   -> Hatxiik (Axe)
	[{1913, {"gil", 2}}] = 20826, -- Sin of Indignation   -> Hunahpu (Axe)
	[{1914, {"gil", 1}}] = 20872, -- Sin of Indolence     -> Ixtab (Great Axe)
	[{1914, {"gil", 2}}] = 20731, -- Sin of Indolence     -> Xiutleato (Sword)
    [{1915, {"gil", 1}}] = 20630, -- Sin of Indulgence    -> Atoyac (Dagger)
	[{1915, {"gil", 2}}] = 20543, -- Sin of Indulgence    -> Maochinoli (Hand-to-Hand)
    [{1916, {"gil", 1}}] = 20992, -- Sin of Invidiousness -> Taikogane (Katana)
	[{1916, {"gil", 2}}] = 21047, -- Sin of Invidiousness -> Azukinagamitsu (Great Katana)
    [{1917, {"gil", 1}}] = 20958, -- Sin of Insolence     -> Kuakuakait (Polearm)
	[{1917, {"gil", 2}}] = 20917, -- Sin of Insolence     -> Xbalanque (Scythe)
    [{1918, {"gil", 1}}] = 21125, -- Sin of Infatuation   -> Tamaxchi (Club)
	[{1918, {"gil", 2}}] = 21186, -- Sin of Infatuation   -> Baqil Staff (Staff)
    [{1919, {"gil", 1}}] = 21233, -- Sin of Intemperance  -> Ajjub Bow (Archery)
	[{1919, {"gil", 2}}] = 21253, -- Sin of Intemperance  -> Atetepeyorg (Marksmanship)
    -- [1913] = 15458, -- Sin of Indignation   -> Ninurta's Sash
    -- [1914] = 18245, -- Sin of Indolence     -> Aureole
    -- [1915] = 17810, -- Sin of Indulgence    -> Futsuno Mitama
    -- [1916] = 18398, -- Sin of Invidiousness -> Raphael Rod
    -- [1917] = 15548, -- Sin of Insolence     -> Mars Ring
    -- [1918] = 15549, -- Sin of Infatuation   -> Bellona Ring
    -- [1919] = 15550, -- Sin of Intemperance  -> Minerva Ring
}

local sinTrades =
{
	1913, -- Sin of Indignation
    1914, -- Sin of Indolence
    1915, -- Sin of Indulgence
    1916, -- Sin of Invidiousness
    1917, -- Sin of Insolence
    1918, -- Sin of Infatuation
    1919 -- Sin of Intemperance
}

function onTrade(player, npc, trade)
    if player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE) == QUEST_COMPLETED then
        for k, v in pairs(trades) do
            if npcUtil.tradeHasExactly(trade, k) then
                player:setLocalVar("meretReward", v)
                player:startEvent(586, k, v)
                break
            end
        end
		
		for i = 1, #sinTrades do
			if (npcUtil.tradeHasExactly(trade, sinTrades[i])) then
				player:PrintToPlayer(string.format("Meret : I offer two different weapons for that Sin. Choose which weapon to receive by trading me the Sin and either 1 or 2 gil."),tpz.msg.channel.NS_SAY)
			end
		end
		
		-- for a, b in pairs(sinTrades) do
			-- if (npcUtil.tradeHasExactly(trade, a)) then
				-- if (player:getFreeSlotsCount() > 1) then
					-- player:addItem(b, 1)
					-- player:messageSpecial(ID.text.ITEM_OBTAINED, b)
					-- player:confirmTrade()
				-- else
					-- player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, b)
					-- return
				-- end
			-- end
		-- end
    end
end

function onTrigger(player, npc)
    if player:getCurrentMission(COP) > tpz.mission.id.cop.THE_WARRIOR_S_PATH then
        if player:getQuestStatus(OTHER_AREAS_LOG, tpz.quest.id.otherAreas.IN_THE_NAME_OF_SCIENCE) == QUEST_COMPLETED then
            if math.random() < 0.5 then
                player:startEvent(582)
            else
                player:startEvent(583)
            end
        else
            player:startEvent(585)
        end
    else
        player:startEvent(584)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 586 and option == player:getLocalVar("meretReward") then
        player:setLocalVar("meretReward", 0)

        if npcUtil.giveItem(player, option) then
            player:confirmTrade()
        end
    end
end