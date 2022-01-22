-----------------------------------
-- Area: Kamihr Drifts
-- Mob: Kumhau
-- ID: 17871084
-- !pos 385 20 248 267
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/magic")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 20) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison	
	mob:addMod(tpz.mod.GRAVITYRES, 100) -- Resistance to Gravity
	mob:addMod(tpz.mod.ATT, 400)	
	mob:addMod(tpz.mod.DEF, 700)
	mob:addMod(tpz.mod.EVA, 80)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.MATT, 80)
	mob:addMod(tpz.mod.REGEN, 1000)
	mob:addMod(tpz.mod.REFRESH, 200)
	-- mob:addMod(tpz.mod.REGAIN, 100)
	mob:addMod(tpz.mod.ICE_ABSORB, 100)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 30)
end

function onMobFight(mob)
	
end

function onAdditionalEffect(mob, target, damage)
end

function onSpellPrecast(mob, spell)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.KUMHAU_ROASTER)
end

function onMobDespawn(mob)
end