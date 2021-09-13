-----------------------------------
-- Area: Sealion's Den
--  Mob: Cherukiki (WHM)
-----------------------------------
local ID = require("scripts/zones/Sealions_Den/IDs")
-----------------------------------


function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	mob:addStatusEffectEx(tpz.effect.INVINCIBLE, 0, 1, 0, 0)
	mob:addStatusEffectEx(tpz.effect.PERFECT_DODGE, 0, 1, 0, 0)
	mob:addStatusEffectEx(tpz.effect.ELEMENTAL_SFORZO, 0, 1, 0, 0)
	mob:addMod(tpz.mod.REFRESH, 50)
end

function onMobEngaged(mob, target)
	
end

function onMobFight(mob)
	
end

function onMobDeath(mob, player, isKiller)
	
end