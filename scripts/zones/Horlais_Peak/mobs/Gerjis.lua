-----------------------------------
-- Area: Horlais Peak
--  Mob: Gerjis
-- BCNM: Eye of the Tiger
-- TODO: code special attacks Crossthrash and Gerjis' Grip
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    
end

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ATT, -250)
	-- mob:setMod(tpz.mod.ACC, 400)
    -- mob:setMod(tpz.mod.EVA, 200)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 20)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 8)
end

function onMobDeath(mob, player, isKiller)
	
end