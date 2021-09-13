-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Voidwrought
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")

-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.PETRIFYRES, 100)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 35)
	mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 17)
	mob:addMod(tpz.mod.ATT, 1200)
	mob:addMod(tpz.mod.MATT, 80)
    -- mob:setMod(tpz.mod.ACC, 500)
	mob:addMod(tpz.mod.MACC, 100)
    mob:addMod(tpz.mod.EVA, 120)
	mob:addMod(tpz.mod.DEF, 500)
	-- mob:setMod(tpz.mod.MEVA, 200)
	-- mob:setMod(tpz.mod.MDEF, 100)
	mob:addMod(tpz.mod.REGAIN, 100)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 20)
end

function onMobFight(mob, target)
	
end

function onMobDeath(mob, player, isKiller)
	
end