-----------------------------------
--
--     Functions for Besieged system
--
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/status")
require("scripts/globals/teleports")
-----------------------------------

tpz = tpz or {}
tpz.besieged = tpz.besieged or {}

tpz.besieged.onTrigger = function(player, npc, eventBase)
    local mercRank = tpz.besieged.getMercenaryRank(player)
    if mercRank == 0 then
        player:startEvent(eventBase + 1, npc)
    else
        local maps = getMapBitmask(player)
        player:startEvent(eventBase, player:getCurrency("imperial_standing"), maps, mercRank, 0, unpack(getImperialDefenseStats()))
    end
end

tpz.besieged.onEventUpdate = function(player, csid, option)
    local itemId = getISPItem(option)
    if itemId and option < 0x40000000 then
        local maps = getMapBitmask(player)
        player:updateEvent(player:getCurrency("imperial_standing"), maps, tpz.besieged.getMercenaryRank(player), player:canEquipItem(itemId) and 2 or 1, unpack(getImperialDefenseStats()))
    end
end

tpz.besieged.onEventFinish = function(player, csid, option)
    local zoneID = zones[player:getZoneID()]
    if option == 0 or option == 16 or option == 32 or option == 48 then
        -- Sanction
        if option ~= 0 then
            player:delCurrency("imperial_standing", 100)
        end

        player:delStatusEffectsByFlag(tpz.effectFlag.INFLUENCE, true)
        local duration = getSanctionDuration(player)
        local subPower = 0 -- getImperialDefenseStats()
        player:addStatusEffect(tpz.effect.SANCTION, option / 16, 0, duration, subPower)
        player:messageSpecial(zoneID.text.SANCTION)
    elseif bit.band(option, 0xFF) == 17 then
        -- Player bought a map
        local ki = tpz.ki.MAP_OF_MAMOOK + bit.rshift(option, 8)
        npcUtil.giveKeyItem(player, ki)
        player:delCurrency("imperial_standing", 1000)
    elseif option < 0x40000000 then
        -- Player bought an item
        local item, price = getISPItem(option)
        if item then
            if npcUtil.giveItem(player, item) then
                player:delCurrency("imperial_standing", price)
            end
        end
    end
end

-----------------------------------------------------------------
-- Variable for addTeleport and getRegionPoint
-----------------------------------------------------------------
LEUJAOAM_ASSAULT_POINT = 0
MAMOOL_ASSAULT_POINT = 1
LEBROS_ASSAULT_POINT = 2
PERIQIA_ASSAULT_POINT = 3
ILRUSI_ASSAULT_POINT = 4
NYZUL_ISLE_ASSAULT_POINT = 5

tpz.besieged.addRunicPortal = function(player, portal)
    player:addTeleport(tpz.teleport.type.RUNIC_PORTAL, portal)
end

tpz.besieged.hasRunicPortal = function(player, portal)
    return player:hasTeleport(tpz.teleport.type.RUNIC_PORTAL, portal)
end

tpz.besieged.hasAssaultOrders = function(player)
    local event = 0
    local keyitem = 0

    for i = 0, 4 do
        local ki = tpz.ki.LEUJAOAM_ASSAULT_ORDERS + i
        if player:hasKeyItem(ki) then
            event = 120 + i
            keyitem = ki
            break
        end
    end

    return event, keyitem
end

-- TODO: Implement Astral Candescence
tpz.besieged.getAstralCandescence = function()
    return 1 -- Hardcoded to 1 for now
end

tpz.besieged.badges = { 780, 783, 784, 794, 795, 825, 826, 827, 894, 900, 909 }

tpz.besieged.getMercenaryRank = function(player)
    local rank = 11

    -- -- Disabled due to unavailability of assault
    -- for _, v in ipairs(tpz.besieged.badges) do
        -- if player:hasKeyItem(v) then
            -- rank = rank + 1
        -- end
    -- end

    return rank
end

local assaultLevels =
{
    50, 50, 60, 60, 60, 70, 70, 70, 70, 70,
    60, 60, 70, 60, 70, 50, 70, 70, 70, 70,
    50, 60, 70, 70, 70, 60, 70, 70, 70, 70,
    70, 70, 70, 60, 70, 50, 60, 70, 70, 70,
    60, 70, 70, 50, 60, 70, 60, 70, 70, 70,
    75, 99
}

function getRecommendedAssaultLevel(assaultid)
    return assaultLevels[assaultid]
end

function getMapBitmask(player)
    local mamook = player:hasKeyItem(tpz.ki.MAP_OF_MAMOOK) and 1 or 0 -- Map of Mammok
    local halvung = player:hasKeyItem(tpz.ki.MAP_OF_HALVUNG) and 2 or 0 -- Map of Halvung
    local arrapago = player:hasKeyItem(tpz.ki.MAP_OF_ARRAPAGO_REEF) and 4 or 0 -- Map of Arrapago Reef
    local astral = bit.lshift(tpz.besieged.getAstralCandescence(), 31) -- Include astral candescence in the top byte

    return bit.bor(mamook, halvung, arrapago, astral)
end

-----------------------------------------------------------------------------------
-- function getSanctionDuration(player) returns the duration of the sanction effect
-- in seconds. Duration is known to go up with mercenary rank but data published on
-- ffxi wiki (http://wiki.ffxiclopedia.org/wiki/Sanction) is unclear and even
-- contradictory (the page on the AC http://wiki.ffxiclopedia.org/wiki/Astral_Candescence
-- says that duration is 3-8 hours with the AC, 1-3 hours without the AC while the Sanction
-- page says it's 3-6 hours with th AC.)
--
-- I decided to use the formula duration (with AC) = 3 hours + (mercenary rank - 1) * 20 minutes.
-----------------------------------------------------------------------------------
function getSanctionDuration(player)
    local duration = 10800 + 1200 * (tpz.besieged.getMercenaryRank(player) - 1)

    if tpz.besieged.getAstralCandescence() == 0 then
        duration = duration / 2
    end

    return duration
end

-----------------------------------------------------------------------------------
-- function getImperialDefenseStats() returns:
-- *how many successive times Al Zahbi has been defended
-- *Imperial Defense Value
-- *Total number of imperial victories
-- *Total number of beastmen victories.
-- hardcoded constants for now until we have a Besieged system.
-----------------------------------------------------------------------------------
function getImperialDefenseStats()
    local successiveWins = 0
    local defenseBonus = 0
    local imperialWins = 0
    local beastmanWins = 0
    return { successiveWins, defenseBonus, imperialWins, beastmanWins }
end

------------------------------------------------------------------------------
-- function getISPItem(i) returns the item ID and cost of the imperial standing
-- points item indexed by i (the same value  as that used by the vendor event.)
-------------------------------------------------------------------------------
function getISPItem(i)
    local IS_item =
    {
        -- Common Items
        [1] = {id = 4182, price = 7}, -- scroll of Instant Reraise
        [4097] = {id = 4181, price = 10}, -- scroll of Instant Warp
        [8193] = {id = 2230, price = 100}, -- lambent fire cell
        [12289] = {id = 2231, price = 100}, -- lambent water cell
        [16385] = {id = 2232, price = 100}, -- lambent earth cell
        [20481] = {id = 2233, price = 100}, -- lambent wind cell
        [24577] = {id = 19021, price = 20000}, -- katana strap
        [28673] = {id = 19022, price = 20000}, -- axe grip
        [32769] = {id = 19023, price = 20000}, -- staff strap
        [36865] = {id = 3307, price = 5000}, -- heat capacitor
        [40961] = {id = 3308, price = 5000}, -- power cooler
        [45057] = {id = 3309, price = 5000}, -- barrage turbine
        [53249] = {id = 3311, price = 5000}, -- galvanizer
        [57345] = {id = 6409, price = 50000},
        -- Private Second Class
        -- Map Key Items (handled separately)
        -- Private First Class
        [33] = {id = 18689, price = 2000}, -- volunteer's dart
        [289] = {id = 18690, price = 2000}, -- mercenary's dart
        [545] = {id = 18691, price = 2000}, -- Imperial dart
        -- Superior Private
        [49] = {id = 18692, price = 4000}, -- Mamoolbane
        [305] = {id = 18693, price = 4000}, -- Lamiabane
        [561] = {id = 18694, price = 4000}, -- Trollbane
        [817] = {id = 15810, price = 4000}, -- Luzaf's ring
        -- Lance Corporal
        [65] = {id = 15698, price = 8000}, -- sneaking boots
        [321] = {id = 15560, price = 8000}, -- trooper's ring
        [577] = {id = 16168, price = 8000}, -- sentinel shield
        -- Corporal
        [81] = {id = 18703, price = 16000}, -- shark gun
        [337] = {id = 18742, price = 16000}, -- puppet claws
        [593] = {id = 17723, price = 16000}, -- singh kilij
        -- Sergeant
        [97] = {id = 15622, price = 24000}, -- mercenary's trousers
        [353] = {id = 15790, price = 24000}, -- multiple ring
        [609] = {id = 15981, price = 24000}, -- haten earring
        -- Sergeant Major
        [113] = {id = 15623, price = 32000}, -- volunteer's brais
        [369] = {id = 15982, price = 32000}, -- priest's earring
        [625] = {id = 15983, price = 32000}, -- chaotic earring
        -- Chief Sergeant
        [129] = {id = 17741, price = 40000}, -- perdu hanger
        [385] = {id = 18943, price = 40000}, -- perdu sickle
        [641] = {id = 18850, price = 40000}, -- perdu wand
        [897] = {id = 18717, price = 40000}, -- perdu bow
        -- Second Lieutenant
        [145] = {id = 16602, price = 48000}, -- perdu sword
        [401] = {id = 18425, price = 48000}, -- perdu blade
        [657] = {id = 18491, price = 48000}, -- perdu voulge
        [913] = {id = 18588, price = 48000}, -- perdu staff
        [1169] = {id = 18718, price = 48000}, -- perdu crossbow
        -- First Lieutenant
        [161] = {id = 16271, price = 56000}, -- lieutenant's gorget
        [417] = {id = 15912, price = 56000}, -- lieutenant's sash
        [673] = {id = 16230, price = 56000} -- lieutenant's cape
    }
    local item = IS_item[i]
    if item then
        return item.id, item.price
    end

    return nil
end

-----------------------------------------------------------------
-- Caldera custom Besieged NPC's/Fights
-----------------------------------------------------------------

local startingNPCs  = {ID.npc.MIHLI_ALIAPOH, ID.npc.GADALAR, ID.npc.NAJELITH, ID.npc.ZAZARG, ID.npc.RUGHADJEEN}

local besiegedName =
{
    "Lamiae Swarm",
    "Mamool Ja Savages",
    "Troll Mercenaries",
    "Monster Leaders",
    "Serpent Generals",
}

-- Beseiged effect power matches the besiegedWaves NPC position and determines the "instance"
-- Mihli is effect power 1 and besiegedWaves position 1, Gadalar is effect power 2 and position 2, etc
local besiegedWaves =
{
    -- Mihli Aliapoh (Lamiae Swarm)
    -- !pos -40 -0.4 -115 48
    {
        {ID.mob.LAMIA_NO_3, ID.mob.LAMIA_NO_34,  ID.mob.LAMIA_NO_21},
        {ID.mob.LAMIA_NO_2, ID.mob.LAMIA_NO_9,   ID.mob.LAMIA_NO_15},
        {ID.mob.MEDUSA,     ID.mob.MERROW_NO_12, ID.mob.MERROW_NO_11},
    },
    -- Gadalar (Mamool Ja Savages)
    -- !pos 39 0 -38 48
    {
        {ID.mob.SEARING_VOGAAL_JA,  ID.mob.THUNDERCLAP_SAREEL_JA, ID.mob.DECIMATER_MABEL_JA},
        {ID.mob.SCALDING_FAFOOL_JA, ID.mob.SAGELORD_MOLAAL_JA,    ID.mob.PANURGIC_RYUBOOL_JA},
        {ID.mob.GULOOL_JA_JA,       ID.mob.EIDOLIC_QUFEEL_JA,     ID.mob.STRIFELORD_BAKOOL_JA},
    },
    -- Najelith (Troll Mercenaries)
    -- !pos 40 -0.4 115 48
    {
        {ID.mob.XARHORKUR_THE_CLAVIGER, ID.mob.GIRZORHOR_THE_IMPRUDENT, ID.mob.WORDORBOR_THE_ARTIFICER},
        {ID.mob.ZURMURWUR_THE_RUTHLESS, ID.mob.DARTORGOR_THE_AUSTERE,   ID.mob.SURMERDAR_THE_UNBRIDLED},
        {ID.mob.GURFURLUR_THE_MENACING, ID.mob.VORJIRZUR_THE_VALIANT,   ID.mob.VORPORLOR_THE_BARBARIC},
    },
    -- Zazarg (Monster Leaders)
    -- !pos -60.3 -8 40 48
    {
        {ID.mob.NEMEAN_LION, ID.mob.PINING_ABAZOHN, ID.mob.BHOOT_INVADER},
        {ID.mob.GERE,        ID.mob.KILLING_CLAW,   ID.mob.AERIAL_TORPEDO},
        {ID.mob.ILLUYANKAS,  ID.mob.BRONTOBUGARD,   ID.mob.BATTERINGBUGARD},
    },
    -- Rughadjeen (Serpent Generals)
    -- !pos 80 0 40 48
    {
        {ID.mob.GENERAL_MIHLI,    ID.mob.IMPERIAL_TROOPER_MIHLI_1,    ID.mob.IMPERIAL_TROOPER_MIHLI_2},
        {ID.mob.GENERAL_GADALAR,  ID.mob.VOLUNTEER_GADALAR_1,         ID.mob.VOLUNTEER_GADALAR_2},
        {ID.mob.GENERAL_NAJELITH, ID.mob.QIQIRN_FREELANCE_NAJELITH_1, ID.mob.QIQIRN_FREELANCE_NAJELITH_2},
        {ID.mob.GENERAL_ZAZARG,   ID.mob.GOBLIN_LASQUENET_ZAZARG_1,   ID.mob.GOBLIN_LASQUENET_ZAZARG_2},
        {ID.mob.GENERAL_RUGHA,    ID.mob.IMMORTAL_GUARD_RUGHA_1,      ID.mob.IMMORTAL_GUARD_RUGHA_1},
    },
}

local bossDropLists =
{
    {3296, 3297}, -- Medusa,       6-man party/alliance drop list
    {3298, 3299}, -- Gulool Ja Ja, 6-man party/alliance drop list
    {3300, 3301}, -- Gurfurlur,    6-man party/alliance drop list
    {3302, 3303}, -- Illuyankas,   6-man party/alliance drop list
    {3304, 3305}, -- Rughadjeen,   6-man party/alliance drop list
}

local npcTradeMessages =
{
    "%s : The trial begins. Speak to me when you're ready to begin the first wave.", -- NPC name
    "%s : Someone already started my event.",                                        -- NPC name
    "%s : This is not %i gil...",                                                    -- NPC name, Gil cost
    "%s : I'm not sure you're ready for this.",                                      -- NPC name
    "%s : You can't participate in multiple Besieged events at the same time.",      -- NPC name
}

local npcTriggerMessages =
{
    "%s : You're on your own until you complete the wave.",               -- NPC name
    "%s : Someone has already started my event.",                         -- NPC name
    "%s : Will you face the %s? For a mere %i gil you may fight my pets." -- NPC name, Besieged name, Gil cost
}

local npcWaveMessages =
{
    {
        "%s : Shall we begin?",                                 -- NPC name
        "%s : This one should be more of a challenge.",         -- NPC name
        "%s : Can you finish the trial?",                       -- NPC name
    },
    {
        "%s : Mihli has claimed the first right of challenge.", -- NPC name
        "%s : Gadalar challenges you next!",                    -- NPC name
        "%s : Najelith joins the fight!",                       -- NPC name
        "%s : Zazarg approaches!",                              -- NPC name
        "%s : Can you finish the trial?",                       -- NPC name
    }
}

local npcSuccessMessage = "%s : I'm impressed a mercenary could accomplish that." -- NPC name

-----------------------------------------------------------------
--    LOCAL FUNCTIONS
-----------------------------------------------------------------

function checkBesiegedEffectMob(mob)
    local zone           = mob:getZone()
    local besiegedEffect = mob:getStatusEffect(tpz.effect.BESIEGED)
    local instanceID     = 0
    local besiegedActive = false

    -- Besieged effect found
    if besiegedEffect then
        instanceID = besiegedEffect:getPower()

        -- Check if any players in the zone have a Besieged effect with matching power/"instance"
        for _, player in pairs(zone:getPlayers()) do
            local besiegedEffectPlayer = player:getStatusEffect(tpz.effect.BESIEGED)

            -- Player with matching Besieged power/"instance" found
            if
                besiegedEffectPlayer and
                besiegedEffectPlayer:getPower() == instanceID
            then
                besiegedActive = true
                break
            end
        end
    end

    return besiegedActive
end

function checkBesiegedEffectPlayer(player, instanceID)
    local zone           = player:getZone()
    local besiegedActive = false

    -- Check if any players in the zone have a Besieged effect with matching power/"instance"
    for _, playerChar in pairs(zone:getPlayers()) do
        local besiegedEffect = playerChar:getStatusEffect(tpz.effect.BESIEGED)

        -- Player with matching Besieged power/"instance" found
        if
            besiegedEffect and
            besiegedEffect:getPower() == instanceID
        then
            besiegedActive = true
            break
        end
    end

    return besiegedActive
end

function getFixedNPCName(npc)
    local name = npc:getName()
	local fixedName = string.gsub(name, "_", " ")

	return fixedName
end

-----------------------------------------------------------------
--    NPC FUNCTIONS
-----------------------------------------------------------------

tpz.besieged.onSpawnCaldera = function(npc)
    -- Sets up a periodic trigger that checks if the NPC's mobs are still actively engaged
    -- Mobs should despawn and NPC should reset when there are no Players with an active Besieged "instance"

    -- triggerID is an ID unique to the NPC
    -- period is the time in vanadiel minutes that separates two triggers of the event
    -- minute offset is the time in vanadiel minutes after the se epoch that the trigger period should synchronize to
    -- npc:addPeriodicTrigger(triggerID, period, minuteOffset)
    npc:addPeriodicTrigger(0, 25, 0) -- Checks every 60s
end

tpz.besieged.onTradeCaldera = function(player, npc, trade)
    local npcName
    local gmLevel       = player:getGMLevel()
    local effectPower   = 0

    for i = 1, #startingNPCs do
        if npc:getID() == startingNPCs[i] then
            effectPower = i
            npcName = getFixedNPCName(npc)
        end
    end

    -- Determine the gil cost for starting Besieged
    local gilCost = 1000000
    -- Set the total duration (default is 30 min, highest tier fights 45 min)
    local eventDuration = 1800 -- 30 minutes; Total time allowed per Besieged event (in seconds)

    if effectPower >= 4 then
        gilCost       = 2500000
        eventDuration = 2700 -- 45 minutes
    end

    -- GM/Dev testing only!
    -- Trading char must be a T1 or higher GM and trade 1 gil to the NPC
    -- Sets gil cost to 1g and final boss drop list to 0
    if
        gmLevel >= 1 and
        trade:getGil() == 1
    then
        gilCost = 1
        npc:setLocalVar("GM_Override", 1)
    end

    -- Prevent one player from starting multiple Besieged "instances"
    if checkBesiegedEffectPlayer(player, effectPower) == true then
        player:PrintToPlayer(string.format(npcTradeMessages[5], npcName),tpz.msg.channel.NS_SAY)
    -- Check if the player has cleared the prerequisites
    elseif
        player:getCharVar("KillCounter_Kirin") > 0 and
        player:getCharVar("KillCounter_JailOfLove") > 0 or
        npc:getLocalVar("GM_Override") > 0
    then
        -- Check that the trade contained the appropriate amount of gil
		if
            trade:getGil() == gilCost and
            npc:getLocalVar("Besieged_Active") == 0
        then
            local allianceList = player:getAlliance()
            local memberName = {}

            -- Set all NPC variables to "active"
            npc:setLocalVar("Besieged_End_Time", os.time() + eventDuration)
			npc:setLocalVar("Besieged_Active", 1)
            npc:setLocalVar("wave", 1)
            npc:setLocalVar("size", 1)

            -- Set up timer to despawn all mobs and reset Besieged
            -- npc:timer(eventDuration * 1000, function(npcArg)
                
            -- end)

            -- Get all alliance members in the zone
            for i, v in ipairs(allianceList) do
                memberName[i] = v:getName()
            end

            -- Give alliance members who have fulfilled the prerequisites the Besieged status effect
			for i = 1, #memberName do
                local member = GetPlayerByName(memberName[i])

				if
                    member:getZoneID() == 48 and
                    not member:hasStatusEffect(tpz.effect.BESIEGED) and
                    player:getCharVar("KillCounter_Kirin") > 0 and
                    player:getCharVar("KillCounter_JailOfLove") > 0
                then
					member:addStatusEffect(tpz.effect.BESIEGED, effectPower, 0, eventDuration)
				end
			end

            -- Parties greater than 6 members will spawn additional monsters
			if #memberName > 6 then
				npc:setLocalVar("size", 2)
			end

            player:tradeComplete()

			player:PrintToPlayer(string.format(npcTradeMessages[1], npcName),tpz.msg.channel.NS_SAY)
		elseif npc:getLocalVar("Besieged_Active") == 1 then
            player:PrintToPlayer(string.format(npcTradeMessages[2], npcName),tpz.msg.channel.NS_SAY)
        else
			player:PrintToPlayer(string.format(npcTradeMessages[3], npcName, gilCost),tpz.msg.channel.NS_SAY)
		end
	else
		player:PrintToPlayer(string.format(npcTradeMessages[4], npcName),tpz.msg.channel.NS_SAY)
	end
end

tpz.besieged.onTriggerCaldera = function(player, npc)
    local npcName
    local effectPower  = 0
    local waveMessages = 1

    -- Validate the starting NPC and determine Besieged "instance" based on NPC's number (1-5)
    for i = 1, #startingNPCs do
        if npc:getID() == startingNPCs[i] then
            effectPower = i
            npcName = getFixedNPCName(npc)
        end
    end

    -- Determine the gil cost for starting Besieged
    local gilCost = 1000000

    if effectPower >= 4 then
        gilCost = 2500000
    end

    -- Determine the wave messages (Rughadjeen has 5 waves, all others have 3)
    if effectPower == 5 then
        waveMessages = 2
    end

    -- Determine the monsters to be spawned
    local waves = besiegedWaves[effectPower]

    -- Confirm triggering player has the Besieged status effect and a Besieged "instance" is running
	if
        player:hasStatusEffect(tpz.effect.BESIEGED) and
        npc:getLocalVar("Besieged_Active") == 1 and
        npc:getLocalVar("Besieged_Wave_Alive") == 0
    then
        -- Spawns the next wave if the "wave" variable is 0-3 or 0-5
        if npc:getLocalVar("wave") > 0 and npc:getLocalVar("wave") <= #waves then
            -- Get the wave message and choose the monsters which will be spawned based off their mob ID's
            for i = 1, #waves do
                if npc:getLocalVar("wave") == i then
                    player:PrintToPlayer(string.format(npcWaveMessages[waveMessages][i], npcName),tpz.msg.channel.NS_SAY)

                    SpawnMob(waves[i][1]) -- Wave "leader"

                    if npc:getLocalVar("size") == 2 then
                        SpawnMob(waves[i][2]) -- Wave "buddy" 1
                        SpawnMob(waves[i][3]) -- Wave "buddy" 2
                    end
                end
            end

            -- Assign spawned monsters to the waveMob variable
            local waveMob =
            {
                GetMobByID(waves[npc:getLocalVar("wave")][1]), -- Wave "leader"
                GetMobByID(waves[npc:getLocalVar("wave")][2]), -- Wave "buddy" 1
                GetMobByID(waves[npc:getLocalVar("wave")][3]), -- Wave "buddy" 2
            }
            local duration = npc:getLocalVar("Besieged_End_Time") - os.time()
            -- printf("besieged.lua onTriggerCaldera  DURATION: [%i]  END TIME: [%i]", npc:getLocalVar("Besieged_End_Time") - os.time(), npc:getLocalVar("Besieged_End_Time"))

            -- Add the Besieged effect to all monsters spawned
            -- Duration of effect is calculated above so that monster's Besieged effects do not exceed the alotted time
            for i,v in ipairs(waveMob) do
                if v:isAlive() then
                    v:setLocalVar("Besieged_End_Time", npc:getLocalVar("Besieged_End_Time"))
                    v:addStatusEffect(tpz.effect.BESIEGED, effectPower, 0, duration)
                    v:updateClaim(player)
                end
            end

            npc:setLocalVar("Besieged_Wave_Alive", 1)
        -- Completes the Besieged "instance" if all monsters have been defeated
        elseif npc:getLocalVar("wave") == #waves + 1 then
            local allianceList = player:getAlliance()
            local memberName   = {}
            local member

            -- Reset all variables associated with the "instance"
            npc:setLocalVar("Besieged_End_Time", 0)
            npc:setLocalVar("Besieged_Active", 0)
            npc:setLocalVar("wave", 0)
            npc:setLocalVar("Besieged_Wave_Alive", 0)

            -- Remove the Besieged status effect from all PC's involved in the "instance"
            for i, v in ipairs(allianceList) do
                memberName[i] = v:getName()
                member = GetPlayerByName(memberName[i])

                member:delStatusEffect(tpz.effect.BESIEGED)
            end

            -- Victory! Success message
            player:PrintToPlayer(string.format(npcSuccessMessage, npcName),tpz.msg.channel.NS_SAY)
		end
    elseif npc:getLocalVar("Besieged_Wave_Alive") == 1 and player:hasStatusEffect(tpz.effect.BESIEGED) then
        player:PrintToPlayer(string.format(npcTriggerMessages[1], npcName),tpz.msg.channel.NS_SAY)
    elseif npc:getLocalVar("Besieged_Active") == 1 and not player:hasStatusEffect(tpz.effect.BESIEGED) then
        player:PrintToPlayer(string.format(npcTriggerMessages[2], npcName),tpz.msg.channel.NS_SAY)
	else
		player:PrintToPlayer(string.format(npcTriggerMessages[3], npcName, besiegedName[effectPower], gilCost),tpz.msg.channel.NS_SAY)
	end
end

tpz.besieged.onTimeTriggerCaldera = function(npc, triggerID)
    if
        triggerID == 0 and
        npc:getLocalVar("Besieged_Active") == 1
    then
        local instanceID    = 0
        local playersInZone = npc:getZone():getPlayers()
        local despawnMobs   = true

        -- Obtain the "instance" ID from the NPC
        for i = 1, #startingNPCs do
            if npc:getID() == startingNPCs[i] then
                instanceID = i
            end
        end

        -- Check all players in the zone for the "instanced" Besieged effect
        -- If even one player has the "instance" status in the zone it will not despawn the mobs
        for _, player in pairs(playersInZone) do
            if
                player:hasStatusEffect(tpz.effect.BESIEGED) and
                player:getStatusEffect(tpz.effect.BESIEGED):getPower() == instanceID
            then
                despawnMobs = false
            end
        end

        if despawnMobs == true then
            printf("besieged.lua onTimeTriggerCaldera  %s INACTIVE, DESPAWNING MOBS, RESETTING NPC", npc:getName())
            npc:setLocalVar("Besieged_End_Time", 0)
            npc:setLocalVar("Besieged_Active", 0)
            npc:setLocalVar("wave", 0)
            npc:setLocalVar("Besieged_Wave_Alive", 0)

            for i = 1, #besiegedWaves[instanceID] do
                DespawnMob(besiegedWaves[instanceID][1][i])
                DespawnMob(besiegedWaves[instanceID][2][i])
                DespawnMob(besiegedWaves[instanceID][3][i])
            end
        end
    end
end

-----------------------------------------------------------------
--    MOB FUNCTIONS
-----------------------------------------------------------------

tpz.besieged.setMobDropsCaldera = function(mob, npcID)
    local startNPC  = GetNPCByID(npcID)
    local partySize = startNPC:getLocalVar("size")
    local instance  = 0

    -- Validate the starting NPC and determine Besieged "instance" based on NPC's number (1-5)
    for i = 1, #startingNPCs do
        if startNPC:getID() == startingNPCs[i] then
            instance = i
        end
    end

    -- Instance found and drop list set based on party size (6-man or alliance)
    -- GM Override applied in tpz.besieged.onTradeCaldera
    if
        instance ~= 0 and 
        startNPC:getLocalVar("GM_Override") == 0
    then
        mob:setDropID(bossDropLists[instance][partySize])
    else
        mob:setDropID(0)
    end
end

tpz.besieged.onMobRoamCaldera = function(mob, npcID)
    local startNPC       = GetNPCByID(npcID)
    local besiegedActive = checkBesiegedEffectMob(mob)

    -- Mob doesn't have a Besieged effect, despawn mob
    -- Player with matching Besieged effect not found, despawn mob
    -- Reset all NPC variables
    if besiegedActive == false then
        DespawnMob(mob:getID())
        startNPC:setLocalVar("Besieged_End_Time", 0)
        startNPC:setLocalVar("Besieged_Active", 0)
        startNPC:setLocalVar("wave", 0)
        startNPC:setLocalVar("Besieged_Wave_Alive", 0)
    end
end

tpz.besieged.onMobDespawnCaldera = function(mob, npcID)
    local startNPC = GetNPCByID(npcID)

    mob:delStatusEffectSilent(tpz.effect.BESIEGED)

    -- Besieged effect duration expired, reset NPC variables
    if os.time() > startNPC:getLocalVar("Besieged_End_Time") then
        -- printf("besieged.lua onMobDespawnCaldera  OS TIME: [%i]  BESIEGED TIME: [%i]", os.time(), startNPC:getLocalVar("Besieged_End_Time"))
        startNPC:setLocalVar("Besieged_Active", 0)
        startNPC:setLocalVar("wave", 0)
        startNPC:setLocalVar("Besieged_Wave_Alive", 0)
        mob:setLocalVar("DeathCheck", 0)
    end
end

tpz.besieged.onMobDeathCaldera = function(mob, player, isKiller, npcID)
    if mob:getLocalVar("DeathCheck") == 0 then
        local startNPC    = GetNPCByID(npcID)
        local currentWave = startNPC:getLocalVar("wave")
        local maxWave     = 3
        local instanceID  = 0

        -- Validate the starting NPC and determine Besieged "instance" based on NPC's number (1-5)
        for i = 1, #startingNPCs do
            if startNPC:getID() == startingNPCs[i] then
                instanceID = i
            end
        end

        -- Rughadjeen's Besieged is currently the only one with 5 waves
        if instanceID == 5 then
            maxWave = 5
        end

        -- printf("besieged.lua onMobDeathCaldera  START NPC ID: [%i]  CURRENT WAVE: [%i]  INSTANCE ID: [%i]", npcID, currentWave, instanceID)

        mob:delStatusEffectSilent(tpz.effect.BESIEGED)

        -- Check if all mobs of the wave are dead before advancing to the next wave
        if
            GetMobByID(besiegedWaves[instanceID][currentWave][1]):isDead() and
            GetMobByID(besiegedWaves[instanceID][currentWave][2]):isDead() and
            GetMobByID(besiegedWaves[instanceID][currentWave][3]):isDead() and
            currentWave <= maxWave
        then
            startNPC:setLocalVar("wave", currentWave + 1)
            startNPC:setLocalVar("Besieged_Wave_Alive", 0)
            mob:setLocalVar("DeathCheck", 1)
        end

        -- Check if the mob is an "instance" Mega Boss and advance its kill counter
        if
            mob:getID() == besiegedWaves[1][3][1] or -- Medusa
            mob:getID() == besiegedWaves[2][3][1] or -- Gulool Ja Ja
            mob:getID() == besiegedWaves[3][3][1] or -- Gurfurlur the Menacing
            mob:getID() == besiegedWaves[4][3][1] or -- Illuyankas
            mob:getID() == besiegedWaves[5][5][1]    -- General Rughadjeen
        then
            if
                startNPC:getLocalVar("GM_Override") == 0 and
                player ~= nil
            then
                -- Track kill counters
                local mobName      = mob:getName()
                local fixedMobName = string.gsub(mobName, "_", " ")
                local shortName    = mobName:sub(1, 14)
                -- printf("besieged.lua onMobDeathCaldera  SHORT NAME: [%s]", shortName)
                local KillCounter = player:getCharVar("KillCounter_BSG_"..shortName)

                KillCounter = KillCounter + 1

                player:setCharVar("KillCounter_BSG_"..shortName, KillCounter)
                player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
            else
                -- Reset GM Override
                startNPC:setLocalVar("GM_Override", 0)
            end
        end
    end
end
