-----------------------------------
-- Area: Whatever Area (LUA goes into that zone's folder)
--   NM: Whoever it is
-----------------------------------
 -- Requires are other scripts that this LUA will reference to satisfy values
mixins = {require("scripts/mixins/job_special")} -- Required for inherant job traits
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

function onMobSpawn(mob) -- When mob spawns (either forced or time)
	mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 360)
    mob:setMod(tpz.mod.STUNRES, 50) -- Resistance to Stun
    mob:setMod(tpz.mod.BLINDRES, 35) -- Resistance to Blind
    mob:setMod(tpz.mod.SLOWRES, 50) -- Resistance to Slow
	mob:addMod(tpz.mod.ATT, 100) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 300) -- Magic Attack (Compare to MDEF)
    -- mob:setMod(tpz.mod.ACC, 1000) -- Accuracy (compare to EVA)
	-- mob:addMod(tpz.mod.MACC, 400) -- Magic ACC (Compare to MEVA)
	-- mob:addMod(tpz.mod.EVA, 100) -- Evasion (Compare to ACC)
	-- mob:addMod(tpz.mod.DEF, 400) -- Defense (Compart to ATT)
	-- mob:addMod(tpz.mod.MEVA, 700) -- Magic Evasion (Compare to MACC)
	-- mob:addMod(tpz.mod.MDEF, 200) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 30) -- Double Attack in %
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 5) -- Triple Attack in %
	mob:setMod(tpz.mod.DMG, -15)
	mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 1000)
--	mob:setMod(tpz.mod.REGAIN, 200)
end

function onMobFight(mob, target) -- When mob is engaged

end

function onMobDeath(mob, player, isKiller) -- When mob is killed
end