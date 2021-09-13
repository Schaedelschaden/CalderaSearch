-----------------------------------
-- Area: Sealions Den
--   NM: Ultima
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
  	mob:addMod(tpz.mod.ACC, 100)
	mob:setMod(tpz.mod.MACC, 850)
	mob:addMod(tpz.mod.MATT, 150)
--	mob:addMod(tpz.mod.EVA, 150)
--	mob:addMod(tpz.mod.MEVA, 150)
--	mob:addMod(tpz.mod.MDEF, 150)
	mob:addMod(tpz.mod.STORETP, 50)
	mob:setMod(tpz.mod.REGAIN, 100)
	mob:setMod(tpz.mod.REGEN, 1500)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 30)
end

function onMobFight(mob, target)
--	mob:setMod(tpz.mod.MACC, 1000)
--	mob:setMod(tpz.mod.ACC, 0)
    -- Gains regain at under 20% HP
    if mob:getHPP() <= 20 and not mob:hasStatusEffect(tpz.effect.REGAIN) then
        mob:addStatusEffect(tpz.effect.REGAIN, 100, 3, 0)
        mob:getStatusEffect(tpz.effect.REGAIN):setFlag(tpz.effectFlag.DEATH)
    end
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PARALYZE, {duration = 60})
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.ULTIMA_UNDERTAKER)
    player:setLocalVar("[OTBF]cs", 0)
end
