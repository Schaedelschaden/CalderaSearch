-----------------------------------
-- Area: Foret de Hennetiel
--  Mob: Skinsipper Chigoe
-----------------------------------
mixins = {require("scripts/mixins/families/chigoe")}
-----------------------------------

function onMobFight(mob, player, isKiller)
	mob:hideName(false)
    mob:untargetable(false)
end

function onMobDeath(mob, player, isKiller)
	
end