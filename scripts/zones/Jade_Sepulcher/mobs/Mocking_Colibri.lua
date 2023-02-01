-----------------------------------
-- Mocking Colibri
-----------------------------------
local ID = require("scripts/zones/Jade_Sepulcher/IDs")
mixins = {require("scripts/mixins/families/colibri_mimic")}
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
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
end

function onMobFight(mob, target)
    local charm = mob:getLocalVar("mockCharm")

    if
        mob:getHPP() <= 80 and
        charm == 0
    then
        mob:useMobAbility(1702) -- Wisecrack
        mob:setLocalVar("mockCharm", 1)
    end

    if
        mob:getHPP() <= 60 and
        charm == 1
    then
        mob:useMobAbility(1702) -- Wisecrack
        mob:setLocalVar("mockCharm", 2)
    end

    if
        mob:getHPP() <= 40 and
        charm == 2
    then
        mob:useMobAbility(1702) -- Wisecrack
        mob:setLocalVar("mockCharm", 3)
    end

    if
        mob:getHPP() <= 20 and
        charm == 3
    then
        mob:useMobAbility(1702) -- Wisecrack
        mob:setLocalVar("mockCharm", 4)
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
