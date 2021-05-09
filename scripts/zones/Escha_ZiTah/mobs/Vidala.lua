-----------------------------------
-- Area: Vidala
--   NM: Escha - Zitah
-----------------------------------
 -- Requires are other scripts that this LUA will reference to satisfy values
mixins = {require("scripts/mixins/job_special")} -- Required for inherant job traits
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

function onMobSpawn(mob) -- When mob spawns (either forced or time)

    mob:setMod(tpz.mod.STUNRES, 500) -- Resistance to Stun
    mob:setMod(tpz.mod.BLINDRES, 30) -- Resistance to Blind
    mob:setMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:setMod(tpz.mod.PARALYZERES, 100) -- Resistance to Paralyze
	mob:setMod(tpz.mod.ATT, 600) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 150) -- Magic Attack (Compare to MDEF)
    mob:setMod(tpz.mod.ACC, 700) -- Accuracy (compare to EVA)
	mob:setMod(tpz.mod.MACC, 300) -- Magic ACC (Compare to MEVA)
	mob:setMod(tpz.mod.EVA, 925) -- Evasion (Compare to ACC)
	mob:setMod(tpz.mod.DEF, 750) -- Defense (Compart to ATT)
	mob:setMod(tpz.mod.MEVA, 400) -- Magic Evasion (Compare to MACC)
	mob:setMod(tpz.mod.MDEF, 200) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 30) -- Triple Attack in %
	mob:setMod(tpz.mod.FASTCAST, 50) -- Fast Cast in %
	mob:setMod(tpz.mod.DMG, -35)
	mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 1000)
	mob:setMod(tpz.mod.REGAIN, 200)
end

function onMobFight(mob, target) -- When mob is engaged
	-- mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 1000)
	-- mob:setMod(tpz.mod.REGAIN, 200)
	
	-- if (mob:getHPP() <= 75) then
		-- mob:setMod(tpz.mod.REGEN, 250)
	-- end
	
	-- if (mob:getHPP() <= 50) then
		-- mob:setMod(tpz.mod.REGEN, 500)
	-- end
	
	-- if (mob:getHPP() <= 25) then
		-- mob:setMod(tpz.mod.REGEN, 1000)
		-- mob:setMod(tpz.mod.DMG, -50)
	-- end
end

function onMobDeath(mob, player, isKiller) -- When mob is killed
end