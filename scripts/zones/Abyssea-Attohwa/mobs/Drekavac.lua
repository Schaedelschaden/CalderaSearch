-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Drekavac
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.PARALYZERES, 100)
	mob:setMod(tpz.mod.SILENCERES, 100)
	mob:setMod(tpz.mod.STUNRES, 80)
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
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 100)
end

function onMobFight(mob, target)
	
end

function onAdditionalEffect(mob, target, damage)
	local hpp = mob:getHPP()

	params = {}
	params.power = 100 + (100 - hpp)
	params.chance = 100
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER, params)
end

function onMobDeath(mob, player, isKiller)
	
end