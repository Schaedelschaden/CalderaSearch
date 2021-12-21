-----------------------------------
-- Area: Escha - Zitah
--   NM: Wepwawet
-----------------------------------
 -- Requires are other scripts that this LUA will reference to satisfy values
mixins = {require("scripts/mixins/job_special")} -- Required for inherant job traits
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

function onMobSpawn(mob) -- When mob spawns (either forced or time)
	mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 360)
	mob:setMod(tpz.mod.PARALYZERES, 50) -- Resistance to Paralyze
    mob:setMod(tpz.mod.STUNRES, 50) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 35) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 50) -- Resistance to Slow
	mob:addMod(tpz.mod.ATT, 400) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 150) -- Magic Attack (Compare to MDEF)
    -- mob:addMod(tpz.mod.ACC, 100) -- Accuracy (compare to EVA)
	-- mob:addMod(tpz.mod.MACC, 100) -- Magic ACC (Compare to MEVA)
	mob:addMod(tpz.mod.EVA, 100) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, -200) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 100) -- Magic Evasion (Compare to MACC)
	-- mob:setMod(tpz.mod.MDEF, 200) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 35) -- Double Attack in %
	mob:setMod(tpz.mod.DMGPHYS, -15)
	mob:setMod(tpz.mod.DMGMAGIC, -35) -- Magic Damage Taken in -%
	mob:setMod(tpz.mod.REGAIN, 100)
	mob:setMod(tpz.mod.REGEN, 200)
end

function onMobFight(mob, target) -- When mob is engaged
	if (mob:getHPP() < 25) then
	mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 1000)
	end

end

function onMobDeath(mob, player, isKiller) -- When mob is killed
end