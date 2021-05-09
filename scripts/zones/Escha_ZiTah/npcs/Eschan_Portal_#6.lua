-----------------------------------
-- Zone: Escha - Zi'Tah
-- NPC: Eschan Portal #6
-- Note: Teleports players to other Eschan Portals
-- !pos 451.903 1.367 -343.121
-----------------------------------
local ID = require("scripts/zones/Escha_ZiTah/IDs")
-----------------------------------

-- Portals unlocked (converted from Hex)
-- Portal #1 = 1	Portal #2 = 2	Portal #3 = 4	Portal #4 = 8
-- Portal #5 = 16	Portal #6 = 32	Portal #7 = 64	Portal #8 = 128
-- All Portals = 255 (1 + 2 + 4 + 8 + 16 + 32 + 64 + 128)

local unlockStatus = {"EschaZitah_Portal1", "EschaZitah_Portal2", "EschaZitah_Portal3", "EschaZitah_Portal4", "EschaZitah_Portal5", "EschaZitah_Portal6", "EschaZitah_Portal7", "EschaZitah_Portal8"}
local portalValue = {1, 2, 4, 8, 16, 32, 64, 128}
local menuOptions = {0x00010001, 0x00020001, 0x00030001, 0x00040001, 0x00050001, 0x00060001, 0x00070001}

function onTrigger(player, npc)
	local csid = 9100
	local portalsUnlocked = 0
	
	for i = 1, #unlockStatus do
		if (player:getCharVar(unlockStatus[i]) == 1) then
			portalsUnlocked = portalsUnlocked + portalValue[i]
		end
	end
	
	local zone = 288 -- Escha Zi'Tah's zone number
	local currentPortal = 5 -- Removes the portal the player is currently interacting with from the selection list
	local currentUnlocked = 1 -- Reverse logic. Locked = 1, Unlocked = 0
	
	if (player:getCharVar("EschaZitah_Portal6") == 1) then
		currentUnlocked = 0
	end
	
	-- Get player's total Eschan Silt, use base portal cost, and calculate reduction based on vorseals
	local silt = player:getCurrency("escha_silt")
	local vorsealReduction = 1 - player:getCharVar("EschanPortalCostReduction")
	local portalCost = 50 * vorsealReduction
	
	-- csid, ?, portals unlocked, zone, current portal, current portal unlocked, silt, portal cost, ?
    player:startEvent(csid, 0, portalsUnlocked, zone, currentPortal, currentUnlocked, silt, portalCost, 0)
	player:setCharVar("EschaZitah_Portal6", 1)
end

function onEventUpdate(player, csid, option)
	-- Portal #1 to Portal #2: Option 65537 (0x00010001)
	-- Portal #1 to Portal #3: Option 131074 (0x00020001)
	-- Portal #1 to Portal #4: Option 196610 (0x00030001)
	-- Portal #1 to Portal #5: Option 262145 (0x00040001)
	-- Portal #1 to Portal #6: Option 327681 (0x00050001)
	-- Portal #1 to Portal #7: Option 393217 (0x00060001)
	-- Portal #1 to Portal #8: Option 458753 (0x00070001)
	
	for i = 1, #menuOptions do
		if (option == menuOptions[i]) then
			player:delCurrency("escha_silt", 50)
		end
	end
end

function onEventFinish(player, csid, option)
	
end