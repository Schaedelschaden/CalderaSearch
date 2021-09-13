-----------------------------------
-- Area: Tangata Manu
--   NM: Escha - Zitah
-----------------------------------
 -- Requires are other scripts that this LUA will reference to satisfy values
mixins = {require("scripts/mixins/job_special")} -- Required for inherant job traits
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

function onMobSpawn(mob) -- When mob spawns (either forced or time)

    mob:setMod(tpz.mod.STUNRES, 35) -- Resistance to Stun
    mob:setMod(tpz.mod.BLINDRES, 100) -- Resistance to Blind
    mob:setMod(tpz.mod.SLOWRES, 100) -- Resistance to Slow
    mob:setMod(tpz.mod.PARALYZERES, 100) -- Resistance to Paralyze
	-- mob:setMod(tpz.mod.ATT, 600) -- Attack Stat (Compare to DEF)
	-- mob:setMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
    -- mob:setMod(tpz.mod.ACC, 500) -- Accuracy (compare to EVA)
	-- mob:setMod(tpz.mod.MACC, 400) -- Magic ACC (Compare to MEVA)
	-- mob:setMod(tpz.mod.EVA, 750) -- Evasion (Compare to ACC)
	-- mob:setMod(tpz.mod.DEF, 600) -- Defense (Compart to ATT)
	-- mob:setMod(tpz.mod.MEVA, 700) -- Magic Evasion (Compare to MACC)
	-- mob:setMod(tpz.mod.MDEF, 250) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 30) -- Double Attack in %
	mob:setMod(tpz.mod.FASTCAST, 50) -- Fast Cast in %
	mob:setMod(tpz.mod.DMG, -35)
	mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 1000)
--	mob:setMod(tpz.mod.REGAIN, 200)
end

function onMobFight(mob, target) -- When mob is engaged

end

function onMobDeath(mob, player, isKiller) -- When mob is killed
end