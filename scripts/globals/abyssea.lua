-----------------------------------
-- Abyssea functions, vars, tables
-- DO NOT mess with the order
-- or change things to "elseif"!

-- TODO: Change these to use enums!
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/magic")
require("scripts/globals/spell_data")
require("scripts/globals/utils")
require("scripts/globals/weaponskillids")
require("scripts/globals/zone")

tpz = tpz or {}
tpz.abyssea = tpz.abyssea or {}

-------------------------------------------------
-- local data
-------------------------------------------------

tpz.abyssea.triggerType =
{
    RED    = 0,
    YELLOW = 1,
    BLUE   = 2,
}

local redWeakness =
{
    tpz.weaponskill.SERAPH_BLADE,
    tpz.weaponskill.SERAPH_STRIKE,
    tpz.weaponskill.TACHI_KOKI,
    tpz.weaponskill.SUNBURST,
    tpz.weaponskill.ENERGY_DRAIN,
    tpz.weaponskill.BLADE_EI,
    tpz.weaponskill.SHADOW_OF_DEATH,
    tpz.weaponskill.RED_LOTUS_BLADE,
    tpz.weaponskill.FLAMING_ARROW,
    tpz.weaponskill.HOT_SHOT,
    tpz.weaponskill.EARTH_CRUSHER,
    tpz.weaponskill.BLADE_CHI,
    tpz.weaponskill.CYCLONE,
    tpz.weaponskill.TACHI_JINPU,
    tpz.weaponskill.FREEZEBITE,
    tpz.weaponskill.BLADE_TO,
    tpz.weaponskill.RAIDEN_THRUST,
    tpz.weaponskill.CLOUDSPLITTER,
    tpz.weaponskill.BLADE_TEKI,
    tpz.weaponskill.BLADE_YU,
}

local yellowWeakness =
{
    [tpz.magic.element.FIRE] =
    {
        tpz.magic.spell.FIRE_III,
        tpz.magic.spell.FIRE_IV,
        tpz.magic.spell.FIRAGA_III,
        tpz.magic.spell.FLARE,
        tpz.magic.spell.HEAT_BREATH,
        tpz.magic.spell.KATON_NI,
        tpz.magic.spell.ICE_THRENODY,
    },

    [tpz.magic.element.ICE] =
    {
        tpz.magic.spell.BLIZZARD_III,
        tpz.magic.spell.BLIZZARD_IV,
        tpz.magic.spell.BLIZZAGA_III,
        tpz.magic.spell.FREEZE,
        tpz.magic.spell.ICE_BREAK,
        tpz.magic.spell.HYOTON_NI,
        tpz.magic.spell.WIND_THRENODY,
    },

    [tpz.magic.element.WIND] =
    {
        tpz.magic.spell.AERO_III,
        tpz.magic.spell.AERO_IV,
        tpz.magic.spell.AEROGA_III,
        tpz.magic.spell.TORNADO,
        tpz.magic.spell.MYSTERIOUS_LIGHT,
        tpz.magic.spell.HUTON_NI,
        tpz.magic.spell.EARTH_THRENODY,
    },

    [tpz.magic.element.EARTH] =
    {
        tpz.magic.spell.STONE_III,
        tpz.magic.spell.STONE_IV,
        tpz.magic.spell.STONEGA_III,
        tpz.magic.spell.QUAKE,
        tpz.magic.spell.MAGNETITE_CLOUD,
        tpz.magic.spell.DOTON_NI,
        tpz.magic.spell.LIGHTNING_THRENODY,
    },

    [tpz.magic.element.THUNDER] =
    {
        tpz.magic.spell.THUNDER_III,
        tpz.magic.spell.THUNDER_IV,
        tpz.magic.spell.THUNDAGA_III,
        tpz.magic.spell.BURST,
        tpz.magic.spell.MIND_BLAST,
        tpz.magic.spell.RAITON_NI,
        tpz.magic.spell.WATER_THRENODY,
    },

    [tpz.magic.element.WATER] =
    {
        tpz.magic.spell.WATER_III,
        tpz.magic.spell.WATER_IV,
        tpz.magic.spell.WATERGA_III,
        tpz.magic.spell.FLOOD,
        tpz.magic.spell.MAELSTROM,
        tpz.magic.spell.SUITON_NI,
        tpz.magic.spell.FIRE_THRENODY,
    },

    [tpz.magic.element.LIGHT] =
    {
        tpz.magic.spell.BANISH_II,
        tpz.magic.spell.BANISH_III,
        tpz.magic.spell.BANISHGA,
        tpz.magic.spell.BANISHGA_II,
        tpz.magic.spell.HOLY,
        tpz.magic.spell.FLASH,
        tpz.magic.spell.RADIANT_BREATH,
        tpz.magic.spell.DARK_THRENODY,
    },

    [tpz.magic.element.DARK] =
    {
        tpz.magic.spell.ASPIR,
        tpz.magic.spell.DRAIN,
        tpz.magic.spell.BIO_II,
        tpz.magic.spell.DISPEL,
        tpz.magic.spell.EYES_ON_ME,
        tpz.magic.spell.KURAYAMI_NI,
        tpz.magic.spell.LIGHT_THRENODY,
    },
}

local blueWeakness =
{
    -- Piercing: 0600 - 1400
    {
        tpz.weaponskill.SIDEWINDER,
        tpz.weaponskill.BLAST_ARROW,
        tpz.weaponskill.ARCHING_ARROW,
        tpz.weaponskill.EMPYREAL_ARROW,
        tpz.weaponskill.SLUG_SHOT,
        tpz.weaponskill.BLAST_SHOT,
        tpz.weaponskill.HEAVY_SHOT,
        tpz.weaponskill.DETONATOR,
        tpz.weaponskill.SHADOWSTICH,
        tpz.weaponskill.DANCING_EDGE,
        tpz.weaponskill.SHARK_BITE,
        tpz.weaponskill.EVISCERATION,
        tpz.weaponskill.SKEWER,
        tpz.weaponskill.WHEELING_THRUST,
        tpz.weaponskill.IMPULSE_DRIVE,
    },

    -- Slashing: 1400 - 2200
    {
        tpz.weaponskill.VORPAL_BLADE,
        tpz.weaponskill.SWIFT_BLADE,
        tpz.weaponskill.SAVAGE_BLADE,
        tpz.weaponskill.BLADE_TEN,
        tpz.weaponskill.BLADE_KU,
        tpz.weaponskill.MISTRAL_AXE,
        tpz.weaponskill.DECIMATION,
        tpz.weaponskill.CROSS_REAPER,
        tpz.weaponskill.SPIRAL_HELL,
        tpz.weaponskill.FULL_BREAK,
        tpz.weaponskill.STEEL_CYCLONE,
        tpz.weaponskill.TACHI_GEKKO,
        tpz.weaponskill.TACHI_KASHA,
        tpz.weaponskill.SPINNING_SLASH,
        tpz.weaponskill.GROUND_STRIKE,
    },

    -- Blunt: 2200 - 0600
    {
        tpz.weaponskill.SKULLBREAKER,
        tpz.weaponskill.TRUE_STRIKE,
        tpz.weaponskill.JUDGMENT,
        tpz.weaponskill.HEXA_STRIKE,
        tpz.weaponskill.BLACK_HALO,
        tpz.weaponskill.RAGING_FISTS,
        tpz.weaponskill.SPINNING_ATTACK,
        tpz.weaponskill.HOWLING_FIST,
        tpz.weaponskill.DRAGON_KICK,
        tpz.weaponskill.ASURAN_FISTS,
        tpz.weaponskill.HEAVY_SWING,
        tpz.weaponskill.SHELL_CRUSHER,
        tpz.weaponskill.FULL_SWING,
        tpz.weaponskill.SPIRIT_TAKER,
        tpz.weaponskill.RETRIBUTION,
    },
}

-- [ZoneID] = {Required Trades Event, Has Key Items Event, Missing Key Item Event}
local popEvents =
{
    [tpz.zone.ABYSSEA_KONSCHTAT]        = {1010, 1020, 1021},
    [tpz.zone.ABYSSEA_TAHRONGI]         = {1010, 1020, 1021},
    [tpz.zone.ABYSSEA_LA_THEINE]        = {1010, 1020, 1016},
    [tpz.zone.ABYSSEA_ATTOHWA]          = {1010, 1022, 1023},
    [tpz.zone.ABYSSEA_MISAREAUX]        = {1010, 1022, 1021},
    [tpz.zone.ABYSSEA_VUNKERL]          = {1010, 1015, 1120},
    [tpz.zone.ABYSSEA_ALTEPA]           = {1010, 1020, 1021},
    [tpz.zone.ABYSSEA_ULEGUERAND]       = {1010, 1020, 1025},
    [tpz.zone.ABYSSEA_GRAUBERG]         = {1010, 1020, 1021},
    [tpz.zone.ABYSSEA_EMPYREAL_PARADOX] = {1010, 1020, 1021},
}

-------------------------------------------------
-- public functions
-------------------------------------------------

-- returns Traverser Stone KI cap
tpz.abyssea.getMaxTravStones = function(player)
    local stones = 3

    for ki = tpz.ki.VIRIDIAN_ABYSSITE_OF_AVARICE, tpz.ki.VERMILLION_ABYSSITE_OF_AVARICE do
        if player:hasKeyItem(ki) then
            stones = stones + 1
        end
    end

    return stones
end

-- returns total Traverser Stone KI
-- (NOT the reserve value from currency menu)
tpz.abyssea.getTravStonesTotal = function(player)
    local stones = 0

    for ki = tpz.ki.TRAVERSER_STONE1, tpz.ki.TRAVERSER_STONE6 do
        if player:hasKeyItem(ki) then
            stones = stones + 1
        end
    end

    return stones
end

-- removes Traverser Stone KIs
tpz.abyssea.spendTravStones = function(player, spentstones)
    if spentstones == 4 then
        if player:hasKeyItem(tpz.ki.TRAVERSER_STONE6) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE6)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE5) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE5)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE4) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE4)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE3) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE3)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE2) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE2)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE1) then
            spentstones = 3
            player:delKeyItem(tpz.ki.TRAVERSER_STONE1)
        end
    end

    if spentstones == 3 then
        if player:hasKeyItem(tpz.ki.TRAVERSER_STONE6) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE6)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE5) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE5)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE4) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE4)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE3) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE3)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE2) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE2)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE1) then
            spentstones = 2
            player:delKeyItem(tpz.ki.TRAVERSER_STONE1)
        end
    end

    if spentstones == 2 then
        if player:hasKeyItem(tpz.ki.TRAVERSER_STONE6) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE6)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE5) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE5)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE4) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE4)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE3) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE3)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE2) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE2)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE1) then
            spentstones = 1
            player:delKeyItem(tpz.ki.TRAVERSER_STONE1)
        end
    end

    if spentstones == 1 then
        if player:hasKeyItem(tpz.ki.TRAVERSER_STONE6) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE6)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE5) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE5)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE4) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE4)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE3) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE3)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE2) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE2)
        elseif player:hasKeyItem(tpz.ki.TRAVERSER_STONE1) then
            player:delKeyItem(tpz.ki.TRAVERSER_STONE1)
        end
    end
end

-- returns total "Abyssite of <thing>"
tpz.abyssea.getAbyssiteTotal = function(player, abyssite)
    local sojourn = 0
    local furtherance = 0
    local merit = 0

    if abyssite == "SOJOURN" then
        for ki = tpz.ki.IVORY_ABYSSITE_OF_SOJOURN, tpz.ki.EMERALD_ABYSSITE_OF_SOJOURN do
            if player:hasKeyItem(ki) then
                sojourn = sojourn + 1
            end
        end
        return sojourn
    elseif abyssite == "FURTHERANCE" then
        for ki = tpz.ki.SCARLET_ABYSSITE_OF_FURTHERANCE, tpz.ki.IVORY_ABYSSITE_OF_FURTHERANCE do
            if player:hasKeyItem(ki) then
                furtherance = furtherance + 1
            end
        end
        return furtherance
    elseif abyssite == "MERIT" then
        for ki = tpz.ki.AZURE_ABYSSITE_OF_MERIT, tpz.ki.INDIGO_ABYSSITE_OF_MERIT do
            if player:hasKeyItem(ki) then
                merit = merit + 1
            end
        end
        return merit
    end
end

-- returns total value of Demulune KeyItems
tpz.abyssea.getDemiluneAbyssite = function(player)
    local demilune = 0
    -- Todo: change this into proper bitmask
    if player:hasKeyItem(tpz.ki.CLEAR_DEMILUNE_ABYSSITE) then
        demilune = demilune + 1
    end
    if player:hasKeyItem(tpz.ki.COLORFUL_DEMILUNE_ABYSSITE) then
        demilune = demilune + 2
    end
    if player:hasKeyItem(tpz.ki.SCARLET_DEMILUNE_ABYSSITE) then
        demilune = demilune + 4
    end
    if player:hasKeyItem(tpz.ki.AZURE_DEMILUNE_ABYSSITE) then
        demilune = demilune + 8
    end
    if player:hasKeyItem(tpz.ki.VIRIDIAN_DEMILUNE_ABYSSITE) then
        demilune = demilune + 16
    end
    if player:hasKeyItem(tpz.ki.JADE_DEMILUNE_ABYSSITE) then
        demilune = demilune + 32
    end
    if player:hasKeyItem(tpz.ki.SAPPHIRE_DEMILUNE_ABYSSITE) then
        demilune = demilune + 64
    end
    if player:hasKeyItem(tpz.ki.CRIMSON_DEMILUNE_ABYSSITE) then
        demilune = demilune + 128
    end
    if player:hasKeyItem(tpz.ki.EMERALD_DEMILUNE_ABYSSITE) then
        demilune = demilune + 256
    end
    if player:hasKeyItem(tpz.ki.VERMILLION_DEMILUNE_ABYSSITE) then
        demilune = demilune + 512
    end
    if player:hasKeyItem(tpz.ki.INDIGO_DEMILUNE_ABYSSITE) then
        demilune = demilune + 1024
    end
    return demilune
end

tpz.abyssea.getCosmosAbyssite = function(player)
    local cosmos = 0

    if player:hasKeyItem(tpz.ki.ABYSSITE_OF_THE_COSMOS) then
        cosmos = 1
    end

    return cosmos
end

tpz.abyssea.getNewYellowWeakness = function(mob)
    local day      = VanadielDayOfTheWeek()
    local weakness = math.random(day - 1, day + 1)

    if weakness < 0 then
        weakness = 7
    elseif weakness > 7 then
        weakness = 0
    end

    local element = tpz.magic.dayElement[weakness]

    return yellowWeakness[element][math.random(#yellowWeakness[element])]
end

tpz.abyssea.getNewRedWeakness = function(mob)
    return redWeakness[math.random(#redWeakness)]
end

tpz.abyssea.getNewBlueWeakness = function(mob)
    local time  = VanadielHour()
    local table = 3

    if time >= 6 and time < 14 then
        table = 1
    elseif time >= 14 and time < 22 then
        table = 2
    end

    return blueWeakness[table][math.random(#blueWeakness[table])]
end

tpz.abyssea.procMonster = function(mob, player, triggerType)
    local ID = zones[player:getZoneID()]

    if player and player:getAllegiance() == 1 then
        local master = player:getMaster()

        if master then
            player = master
        end

        if triggerType == tpz.abyssea.triggerType.RED then
            if mob:getLocalVar("[AbysseaRedProc]") == 0 then
                mob:setLocalVar("[AbysseaRedProc]", 1)
            else
                mob:setLocalVar("[AbysseaRedProc]", 0)
            end

            mob:weaknessTrigger(2)
            mob:addStatusEffect(tpz.effect.TERROR, 0, 0, 60)

            player:messageName(ID.text.STAGGERED, player)
            player:messageSpecial(ID.text.RED_STAGGER)
        elseif triggerType == tpz.abyssea.triggerType.YELLOW then
            if mob:getLocalVar("[AbysseaYellowProc]") == 0 then
                mob:setLocalVar("[AbysseaYellowProc]", 1)
            else
                mob:setLocalVar("[AbysseaYellowProc]", 0)
            end

            mob:weaknessTrigger(1)
            mob:addStatusEffect(tpz.effect.SILENCE, 1, 0, 60)

            player:messageName(ID.text.STAGGERED, player)
            player:messageSpecial(ID.text.YELLOW_STAGGER)
        elseif triggerType == tpz.abyssea.triggerType.BLUE then
            if mob:getLocalVar("[AbysseaBlueProc]") == 0 then
                mob:setLocalVar("[AbysseaBlueProc]", 1)
            else
                mob:setLocalVar("[AbysseaBlueProc]", 0)
            end

            mob:weaknessTrigger(0)
            mob:addStatusEffect(tpz.effect.AMNESIA, 1, 0, 60)

            player:messageName(ID.text.STAGGERED, player)
            player:messageSpecial(ID.text.BLUE_STAGGER)
        end
    end
end

-- Drop KI on death
tpz.abyssea.kiOnMobDeath = function(mob, player)
    if (mob:checkDistance(player) <= 40) then
        local zoneId = player:getZoneID()
        local keyItem = zones[zoneId].mob.ON_DEATH_KI[mob:getID()].reward

        if not (player:hasKeyItem(keyItem)) then
            player:messageSpecial(zones[zoneId].text.KEYITEM_OBTAINED, keyItem)
            player:addKeyItem(keyItem)
        end
    end
end

-- trade to QM to pop mob
tpz.abyssea.qmOnTrade = function(player, npc, trade)
    -- validate QM pop data
    local zoneId = player:getZoneID()
    local pop = zones[zoneId].npc.QM_POPS[npc:getID()] -- TODO: Once I (Wren) finish entity-QC on all Abyssea zones, I must adjust the format of QM_POPS table

    if not pop then
        return false
    end

    -- validate trade-to-pop
    local reqTrade = pop[2]

    local count = 0
    for i = 1, #reqTrade do
        if (reqTrade[i] ~= 0) then
            count = count + 1
        end
    end

    if count == 0 or trade:getItemCount() ~= count then
        return false
    end

    -- validate traded items
    for k, v in pairs(reqTrade) do
        if (reqTrade[k] ~= 0 and not trade:hasItemQty(v, 1)) then
            return false
        end
    end

    -- validate nm status
    local nm = pop[4]
    if GetMobByID(nm):isSpawned() then
        return false
    end

    -- complete trade and pop nm
    player:tradeComplete()
    local dx = player:getXPos() + math.random(-1, 1)
    local dy = player:getYPos()
    local dz = player:getZPos() + math.random(-1, 1)
    GetMobByID(nm):setSpawn(dx, dy, dz)
    SpawnMob(nm):updateClaim(player)

    -- Handle ??? disappearing on pop and reappearing after mob dies
    local mob = GetMobByID(nm)

    npc:setStatus(tpz.status.DISAPPEAR)
    mob:setLocalVar("qm", npc:getID())
    mob:addListener("DESPAWN", "QM_"..nm, function(m)
        m:removeListener("QM_"..nm)

        if mob:isAlive() then
            return false
        end

        GetNPCByID(m:getLocalVar("qm")):updateNPCHideTime(30)
    end)

    return true
end

tpz.abyssea.qmOnTrigger = function(player, npc)
    -- validate QM pop data
    local zoneId = player:getZoneID()
    local events = popEvents[zoneId]
    local pop = zones[zoneId].npc.QM_POPS[npc:getID()] -- TODO: Once I (Wren) finish entity-QC on all Abyssea zones, I must adjust the format of QM_POPS table

    if not pop then
        return false
    end

    -- validate nm status
    local nm = pop[4]
    if GetMobByID(nm):isSpawned() then
        return false
    end

    -- validate trade-to-pop
    local t = pop[2]
    if #t > 0 then
        for i = 1, 8, 1 do
            if not t[i] then
                t[i] = 0
            end
        end
        player:startEvent(events[1], t[1], t[2], t[3], t[4], t[5], t[6], t[7], t[8]) -- report required trades
        return true
    end

    -- validate ki-to-pop
    local kis = pop[3]
    if #kis == 0 then
        return false
    end

    -- validate kis
    local validKis = true
    for k, v in pairs(kis) do
        if (kis[k] ~= 0 and not player:hasKeyItem(v)) then
            validKis = false
            break
        end
    end

    -- infill kis
    for i = 1, 8, 1 do
        if not kis[i] then
            kis[i] = 0
        end
    end

    -- start event
    if validKis then
        player:setLocalVar("abysseaQM", npc:getID())
        player:startEvent(events[2], kis[1], kis[2], kis[3], kis[4], kis[5], kis[6], kis[7], kis[8]) -- player has all key items
        return true
    else
        player:startEvent(events[3], kis[1], kis[2], kis[3], kis[4], kis[5], kis[6], kis[7], kis[8]) -- player is missing key items
        return false
    end
end

tpz.abyssea.qmOnEventUpdate = function(player, csid, option)
    return false
end

tpz.abyssea.qmOnEventFinish = function(player, csid, option)
    local zoneId = player:getZoneID()
    local events = popEvents[zoneId]
    local pop = zones[zoneId].npc.QM_POPS[player:getLocalVar("abysseaQM")] -- TODO: Once I (Wren) finish entity-QC on all Abyssea zones, I must adjust the format of QM_POPS table
    local qm = GetNPCByID(player:getLocalVar("abysseaQM"))

    player:setLocalVar("abysseaQM", 0)

    if not pop then
        return false
    end

    if csid == events[2] and option == 1 then
        -- delete kis
        local kis = pop[3]
        for k, v in pairs(kis) do
            if player:hasKeyItem(v) then
                player:delKeyItem(v)
            end
        end

        -- pop nm
        local nm = pop[4]
        local dx = player:getXPos() + math.random(-1, 1)
        local dy = player:getYPos()
        local dz = player:getZPos() + math.random(-1, 1)
        GetMobByID(nm):setSpawn(dx, dy, dz)
        SpawnMob(nm):updateClaim(player)

        -- Handle ??? disappearing on pop and reappearing after mob dies
        local mob = GetMobByID(nm)

        qm:setStatus(tpz.status.DISAPPEAR)
        mob:setLocalVar("qm", qm:getID())
        mob:addListener("DESPAWN", "QM_"..nm, function(m)
            m:removeListener("QM_"..nm)

            if mob:isAlive() then
                return false
            end

            GetNPCByID(m:getLocalVar("qm")):updateNPCHideTime(30)
        end)

        return true
    end
end

tpz.abyssea.updateBaseStats = function(mob, tierAby, tierMob)
    local dmgRating = 0
    local modDEF    = 0
    local modATT    = 0
    local modMATT   = 0
    local modACC    = 0
    local modMACC   = 0
    local modEVA    = 0
    local modMEVA   = 0
    local modSTR    = 0
    local modDEX    = 0
    local modAGI    = 0
    local modVIT    = 0
    local modMND    = 0
    local modCHR    = 0
    local modINT    = 0
    
    if tierAby == 2 and tierMob == 0 then -- Abyssea T2 - Normal Mobs
        
    elseif tierAby == 2 and tierMob == 1 then -- Abyssea T2 - T1 NM's
        dmgRating = math.random(150, 200)
        modDEF    = math.random(350, 500)
        modATT    = math.random(250, 350)
        modMATT   = 200
        modACC    = 0
        modMACC   = 0
        modEVA    = math.random(150, 200)
        modMEVA   = 200
        modSTR    = 115
        modDEX    = 115
        modAGI    = 115
        modVIT    = 115
        modMND    = 115
        modCHR    = 115
        modINT    = 115
    elseif tierAby == 2 and tierMob == 2 then -- Abyssea T2 - T2 NM's
        dmgRating = math.random(175, 225)
        modDEF    = math.random(450, 550)
        modATT    = math.random(300, 400)
        modMATT   = 210
        modACC    = 0
        modMACC   = 0
        modEVA    = math.random(175, 225)
        modMEVA   = 220
        modSTR    = 140
        modDEX    = 140
        modAGI    = 140
        modVIT    = 140
        modMND    = 140
        modCHR    = 140
        modINT    = 140
    elseif tierAby == 2 and tierMob == 3 then -- Abyssea T2 - T3 NM's
        dmgRating = math.random(200, 250)
        modDEF    = math.random(500, 600)
        modATT    = math.random(400, 500)
        modMATT   = 220
        modACC    = 0
        modMACC   = 0
        modEVA    = math.random(200, 250)
        modMEVA   = 240
        modSTR    = 165
        modDEX    = 165
        modAGI    = 165
        modVIT    = 165
        modMND    = 165
        modCHR    = 165
        modINT    = 165
    end

    mob:addMod(tpz.mod.MAIN_DMG_RATING, dmgRating)
    mob:addMod(tpz.mod.DEF, modDEF)
    mob:addMod(tpz.mod.ATT, modATT)
    mob:addMod(tpz.mod.MATT, modMATT)
    mob:addMod(tpz.mod.ACC, modACC)
    mob:addMod(tpz.mod.MACC, modMACC)
	mob:addMod(tpz.mod.EVA, modEVA)
	mob:addMod(tpz.mod.MEVA, modMEVA)
	mob:addMod(tpz.mod.STR, modSTR)
    mob:addMod(tpz.mod.DEX, modDEX)
    mob:addMod(tpz.mod.AGI, modAGI)
    mob:addMod(tpz.mod.VIT, modVIT)
    mob:addMod(tpz.mod.MND, modMND)
    mob:addMod(tpz.mod.CHR, modCHR)
    mob:addMod(tpz.mod.INT, modINT)
end
