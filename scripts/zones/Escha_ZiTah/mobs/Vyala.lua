-----------------------------------
-- Area: Escha Zi'Tah
--   NM: Vyala
-----------------------------------
 -- Requires are other scripts that this LUA will reference to satisfy values
mixins = {require("scripts/mixins/job_special")} -- Required for inherant job traits
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

function onMobSpawn(mob) -- When mob spawns (either forced or time)
	mob:setMobLevel(130)
	mob:setMod(tpz.mod.SILENCERES, 80) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 80) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 60) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 45) -- Resistance to Slow
	mob:setMod(tpz.mod.ATT, 800) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 500) -- Magic Attack (Compare to MDEF)
    mob:setMod(tpz.mod.ACC, 450) -- Accuracy (compare to EVA)
	mob:setMod(tpz.mod.MACC, 800) -- Magic ACC (Compare to MEVA)
	mob:setMod(tpz.mod.EVA, 600)
	mob:setMod(tpz.mod.DEF, 800) -- Defense (Compart to ATT)
	mob:setMod(tpz.mod.MEVA, 650) -- Magic Evasion (Compare to MACC)
	mob:setMod(tpz.mod.MDEF, 750) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, math.random(20, 25)) -- Double Attack in %
	mob:setMod(tpz.mod.FASTCAST, 50) -- Fast Cast in %
	mob:setMod(tpz.mod.DMG, -35)
	mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 1000)
	mob:setMod(tpz.mod.REFRESH, 50)
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