-----------------------------------
-- Imp Bandsman
-----------------------------------
local ID = require("scripts/zones/Talacca_Cove/IDs")
mixins = {require("scripts/mixins/families/imp")}
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("HORN_BREAK_CHANCE", 5)
    mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 500) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
	mob:addMod(tpz.mod.EVA, 150) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 700) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 200) -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 100) -- Magic Defense (Compare to MATT)
	mob:addMod(tpz.mod.STR, 130)
    mob:addMod(tpz.mod.DEX, 130)
    mob:addMod(tpz.mod.AGI, 130)
    mob:addMod(tpz.mod.VIT, 130)
    mob:addMod(tpz.mod.MND, 130)
    mob:addMod(tpz.mod.CHR, 130)
    mob:addMod(tpz.mod.INT, 130)

    if
        mob:getID() == 17010695 or
        mob:getID() == 17010701 or
        mob:getID() == 17010707
    then
        mob:addListener("WEAPONSKILL_USE", "IMP_BANDSMAN_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
            if wsid == 1712 then -- Bugle Call summons an additional imp
                SpawnMob(mobArg:getID() + math.random(1, 4))
            end
        end)
    end
end

function onMobFight(mob, target)
    local squad = mob:getLocalVar("nukeSquad")

    if mob:getHPP() <= 80 and squad == 0 then
        mob:useMobAbility(1712) -- Bugle Call
        mob:setLocalVar("nukeSquad", 1)
    end

    if mob:getHPP() <= 60 and squad == 1 then
        mob:useMobAbility(1712) -- Bugle Call
        mob:setLocalVar("nukeSquad", 2)
    end

    if mob:getHPP() <= 40 and squad == 2 then
        mob:useMobAbility(1712) -- Bugle Call
        mob:setLocalVar("nukeSquad", 3)
    end

    if mob:getHPP() <= 20 and squad == 3 then
        mob:useMobAbility(1712) -- Bugle Call
        mob:setLocalVar("nukeSquad", 4)
    end

    for i = mob:getID() + 1, mob:getID() + 4 do -- Tells all adds to attack target
        local adds = GetMobByID(i)

        adds:updateEnmity(target)
    end
end

function onMobDeath(mob, player, isKiller)
    -- If one dies the add despawn.
    DespawnMob(17010696)
    DespawnMob(17010697)
    DespawnMob(17010698)
    DespawnMob(17010699)
    mob:removeListener("IMP_BANDSMAN_WEAPONSKILL_USE")
end

function onMobDespawn(mob)
    mob:removeListener("IMP_BANDSMAN_WEAPONSKILL_USE")
end
