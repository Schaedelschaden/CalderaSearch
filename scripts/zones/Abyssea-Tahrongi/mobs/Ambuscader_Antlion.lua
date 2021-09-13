-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Ambuscader_Antlion
-----------------------------------
mixins = {require("scripts/mixins/families/antlion_ambush")}
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.REGEN, -(mob:getHP() * 0.05))
end

function onMobFight(mob)
	
end

function onMobDeath(mob, player, isKiller)
	
end