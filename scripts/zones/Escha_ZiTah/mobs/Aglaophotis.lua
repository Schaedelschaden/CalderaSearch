-----------------------------------
-- Area: Escha - Zitah
--   NM: Aglaophotis
-----------------------------------
 -- Requires are other scripts that this LUA will reference to satisfy values
mixins = {require("scripts/mixins/job_special")} -- Required for inherant job traits
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

function onMobSpawn(mob) -- When mob spawns (either forced or time)
	mob:setMod(tpz.mod.PARALYZERES, 50) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 500) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 35) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 50) -- Resistance to Slow
	mob:setMod(tpz.mod.ATT, 1200) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 450) -- Magic Attack (Compare to MDEF)
    mob:setMod(tpz.mod.ACC, 1050) -- Accuracy (compare to EVA)
	mob:setMod(tpz.mod.MACC, 520) -- Magic ACC (Compare to MEVA)
	mob:setMod(tpz.mod.EVA, 800) -- Evasion (Compare to ACC)
	mob:setMod(tpz.mod.DEF, 480) -- Defense (Compart to ATT)
	mob:setMod(tpz.mod.MEVA, 200) -- Magic Evasion (Compare to MACC)
	mob:setMod(tpz.mod.MDEF, 200) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 35) -- Triple Attack in %
	mob:setMod(tpz.mod.DMG, -35)
	mob:setMod(tpz.mod.DMGMAGIC, -15)
	mob:setMod(tpz.mod.REGAIN, 200)
	mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 1000)
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