-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Vaicoliaux B D'Aurphe
-- BCNM: Brothers D'Aurphe
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 50
	params.chance = 100
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENDRAIN)
end

function onMobDeath(mob, player, isKiller)
end
