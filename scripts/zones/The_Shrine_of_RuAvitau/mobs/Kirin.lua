-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NM: Kirin
-- ID: 17506670
-- !pos -76 32 -4 178
-----------------------------------
local ID = require("scripts/zones/The_Shrine_of_RuAvitau/IDs")
-- mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
require("scripts/globals/mobs")
require("scripts/globals/keyitems")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 600)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    -- tpz.mix.jobSpecial.config(mob, {
        -- specials =
        -- {
            -- {id = tpz.jsa.ASTRAL_FLOW, hpp = 50},
        -- },
    -- })

    mob:setMod(tpz.mod.WINDRES, -64)
    mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.PETRIFYRES, 85)
    mob:setMod(tpz.mod.STUNRES, 85)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.GRAVITYRES, 35)
    mob:setMod(tpz.mod.DMGPHYS, -25)
    mob:setMod(tpz.mod.DMGRANGE, -25)
    mob:setMod(tpz.mod.DMGMAGIC, -30)
    mob:addMod(tpz.mod.MACC, 500)
    mob:addMod(tpz.mod.MATT, 100)
    mob:addMod(tpz.mod.REFRESH, 25)
    mob:setLocalVar("numAdds", 90) -- Based off Kirin's HPP now. Spawns first "pet" at 90% HP
    mob:setLocalVar("2hrHPP", math.random(45, 55))

    mob:setHP(999999999)
end

function onMobFight(mob, target)
    local isBusy = false
    local act    = mob:getCurrentAction()

    if
        act == tpz.act.MOBABILITY_START or
        act == tpz.act.MOBABILITY_USING or
        act == tpz.act.MOBABILITY_FINISH or
        act == tpz.act.MAGIC_START or
        act == tpz.act.MAGIC_CASTING
    then
        isBusy = true
    end

    -- Spawn gods as pets
    local numAdds = mob:getLocalVar("numAdds")

    if mob:getHPP() <= numAdds then
        local godsRemaining = {}

        for i = 1, 4 do
            if (mob:getLocalVar("add"..i) == 0) then
                table.insert(godsRemaining,i)
            end
        end

        if (#godsRemaining > 0) then
            local g       = godsRemaining[math.random(#godsRemaining)]
            local god     = SpawnMob(ID.mob.KIRIN + g)
            local godName = god:getName()

            god:updateEnmity(target)
            mob:setLocalVar("add"..g, 1)
            mob:setLocalVar("numAdds", numAdds - 10)

            if (godName == 'Byakko') then
                god:setPos(mob:getXPos() - 5, mob:getYPos(), mob:getZPos())
            elseif (godName == 'Genbu') then
                god:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos() + 5)
            elseif (godName == 'Seiryu') then
                god:setPos(mob:getXPos() + 5, mob:getYPos(), mob:getZPos())
            elseif (godName == 'Suzaku') then
                god:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos() - 5)
            end
        end
    end

    -- Ensure all spawned pets are doing stuff
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        local god = GetMobByID(i)

        if (god:getCurrentAction() == tpz.act.ROAMING) then
            god:updateEnmity(target)
        end
    end

    -- Kirin's 2hr summons an avatar and uses Astral Flow
    if
        mob:getHPP() <= mob:getLocalVar("2hrHPP") and
        mob:getLocalVar("has2hrd") == 0 and
        isBusy == false
    then
        mob:useMobAbility(734)
        SpawnMob(ID.mob.KIRIN + 5)

        local avatar = GetMobByID(ID.mob.KIRIN + 5)

        avatar:setPos(mob:getXPos(), mob:getYPos(), mob:getZPos() + 5)
        avatar:setLocalVar("AstralFlowTimer", os.time() + 3)
        mob:setLocalVar("has2hrd", 1)
    end
end

function onAdditionalEffect(mob, target, damage)
    params = {}
    params.power = 75
    params.chance = 100

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENSTONE)
end

function onMobDeath(mob, player, isKiller)
    local KillCounter = player:getCharVar("KillCounter_Kirin")
    local playerName = player:getName()
    local mobName = mob:getName()

    KillCounter = KillCounter + 1

    player:setCharVar("KillCounter_Kirin", KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

    player:addTitle( tpz.title.KIRIN_CAPTIVATOR )
    player:addKeyItem( tpz.ki.KIRINS_FERVOR )
    player:messageSpecial( ID.text.KEYITEM_OBTAINED, tpz.ki.KIRINS_FERVOR )
    player:showText( mob, ID.text.KIRIN_OFFSET + 1 )

    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        DespawnMob(i)
    end
end

function onMobDespawn( mob )
    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
        DespawnMob(i)
    end
end
