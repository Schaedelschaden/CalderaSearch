-----------------------------------
-- Area: Escha - Zitah
--   NM: Ionos
-----------------------------------
 -- Requires are other scripts that this LUA will reference to satisfy values
mixins = {require("scripts/mixins/job_special")} -- Required for inherant job traits
require("scripts/globals/status") -- required for LUA status adjustments
-----------------------------------

function onMobSpawn(mob) -- When mob spawns (either forced or time)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 360)
	mob:setMod(tpz.mod.PARALYZERES, 30) -- Resistance to Paralyze
    mob:setMod(tpz.mod.STUNRES, 50) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    -- mob:setMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	-- mob:setMod(tpz.mod.ATT, 1250) -- Attack Stat (Compare to DEF)
	-- mob:setMod(tpz.mod.MATT, 200) -- Magic Attack (Compare to MDEF)
    -- mob:setMod(tpz.mod.ACC, 800) -- Accuracy (compare to EVA)
	-- mob:setMod(tpz.mod.MACC, 700) -- Magic ACC (Compare to MEVA)
	-- mob:setMod(tpz.mod.EVA, 800) -- Evasion (Compare to ACC)
	-- mob:setMod(tpz.mod.DEF, 750) -- Defense (Compart to ATT)
	-- mob:setMod(tpz.mod.MEVA, 800) -- Magic Evasion (Compare to MACC)
	-- mob:setMod(tpz.mod.MDEF, 400) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 15) -- Double Attack in %
	mob:setMod(tpz.mod.DMG, -15)
	mob:setMod(tpz.mod.MOBMOD_TP_USE_CHANCE, 1000)
	mob:setMod(tpz.mod.REGAIN, 200)
end

function onMobFight(mob, target) -- When mob is engaged

end

function onAdditionalEffect(mob, target, damage)
    target:addStatusEffect(tpz.effect.DEFENSE_DOWN, strength, 0, 60)
    target:addStatusEffect(tpz.effect.MAGIC_DEF_DOWN, strength, 0, 60)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.CURSE, {chance = 100, duration = math.random(60)})
end

function onMobDeath(mob, player, isKiller) -- When mob is killed
end