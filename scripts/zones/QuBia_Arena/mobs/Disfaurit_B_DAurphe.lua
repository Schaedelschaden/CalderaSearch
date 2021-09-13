-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Disfaurit B D'Aurphe
-- BCNM: Brothers D'Aurphe
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobInitialize(mob)
	-- mob:setMod(tpz.mod.ACC, 400)
    -- mob:setMod(tpz.mod.EVA, 200)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 12)
	end

function onMobDeath(mob, player, isKiller)
end
