-----------------------------------
-- Area: Jade Sepulcher
--  Mob: Lancelord Gaheel Ja
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")

-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 35)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 17)
	mob:addMod(tpz.mod.ATT, 150)
	mob:addMod(tpz.mod.MATT, 165)
    mob:addMod(tpz.mod.ACC, 500)
    mob:addMod(tpz.mod.EVA, 100)
	mob:addMod(tpz.mod.DEF, 800)
	mob:setMod(tpz.mod.MDEF, 100)
	mob:setMod(tpz.mod.DMGPHYS, 50)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 40)
	mob:addMod(tpz.mod.LIGHT_ABSORB, 50)
	mob:addMod(tpz.mod.REGEN, 250)
	mob:addMod(tpz.mod.REFRESH, 200)
	mob:addMod(tpz.mod.REGAIN, 100)
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
end

function onMobDisengage(mob)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end