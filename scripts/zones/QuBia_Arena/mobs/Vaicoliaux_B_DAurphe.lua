-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Vaicoliaux B D'Aurphe
-- BCNM: Brothers D'Aurphe
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
function onMobInitialize(mob)
	-- mob:setMod(tpz.mod.ACC, 400)
	mob:setMod(tpz.mod.Double_ATTACK, 15)
	end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 50
	params.chance = 100
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.Drain_Daze)
end

function onMobDeath(mob, player, isKiller)
end
