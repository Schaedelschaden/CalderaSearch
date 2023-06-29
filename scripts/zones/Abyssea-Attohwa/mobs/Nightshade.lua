-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Nightshade
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 05/26/22 - Needs to be set up
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, math.random(150, 200))
    mob:addMod(tpz.mod.ATT, math.random(250, 350))
    mob:addMod(tpz.mod.MATT, 200)
	mob:addMod(tpz.mod.EVA, math.random(150, 200))
	mob:addMod(tpz.mod.DEF, math.random(350, 500))
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.STR, 115)
    mob:addMod(tpz.mod.DEX, 115)
    mob:addMod(tpz.mod.AGI, 115)
    mob:addMod(tpz.mod.VIT, 115)
    mob:addMod(tpz.mod.MND, 115)
    mob:addMod(tpz.mod.CHR, 115)
    mob:addMod(tpz.mod.INT, 115)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 35)
end

function onMobFight(mob, target)
	
end

function onAdditionalEffect(mob, target, damage)
	local additionalEffect = tpz.mob.ae.HP_DRAIN
	
	local params = {}
		params.chance = 100
		params.power = 75
	
    return tpz.mob.onAddEffect(mob, target, damage, additionalEffect, params)
end

function onMobDeath(mob, player, isKiller)
	
end