-----------------------------------
-- Area: Xarcabard [S]
--   NM: Tikbalang
-- ID - 17338559
-- !pos -65 -23 -85 137
-----------------------------------
local ID = require("scripts/zones/Xarcabard_[S]/IDs")
mixins =
{
	require("scripts/mixins/rage")
}
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
	mob:setLocalVar("[rage]timer", 2400) -- 40 minutes
	mob:addMod(tpz.mod.PARALYZERES, 50) -- Resistance to Paralyze
    mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
    mob:addMod(tpz.mod.STR, 100)
    mob:addMod(tpz.mod.DEX, 100)
    mob:addMod(tpz.mod.VIT, 100)
    mob:addMod(tpz.mod.AGI, 100)
    mob:addMod(tpz.mod.INT, 100)
    mob:addMod(tpz.mod.MND, 100)
    mob:addMod(tpz.mod.CHR, 100)
	mob:addMod(tpz.mod.ATT, 500)
	mob:addMod(tpz.mod.DEF, 1100)
	mob:addMod(tpz.mod.EVA, 130)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.REGEN, 500)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 20)
	mob:addMod(tpz.mod.COUNTER, 30)
	mob:addMod(tpz.mod.COUNTER_DMG, 150)
    mob:setMod(tpz.mod.ALL_WSDMG_ALL_HITS, 20)
end

function onMobFight(mob, target)
    local isBusy = false
	local has2Hrd = mob:getLocalVar("has2Hrd")
	local act = mob:getCurrentAction()

   	if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		mob:useMobAbility(690)
		mob:setLocalVar("has2Hrd", 1)
		mob:getStatusEffect(tpz.effect.HUNDRED_FISTS):setFlag(tpz.effectFlag.DEATH)
	end
end

function onMobWeaponSkill(target, mob, skill)
	if (skill:getID() == 502) then
		local duration = 120
        local typeEffect = tpz.effect.DREAD_SPIKES
        local drainAmount = mob:getMaxHP() / 50

        mob:addStatusEffect(typeEffect, 0, 0, duration, 0, drainAmount, 1)
	end

	if (skill:getID() == 500) then
		mob:addStatusEffect(tpz.effect.BLOOD_WEAPON, 1, 0, 8)
	end
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 100
	params.chance = 75

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENDARK, params)
end

function onSpikesDamage(mob, target, damage)
	if (mob:hasStatusEffect(tpz.effect.BLAZE_SPIKES)) then
        local absorbedDamage = mob:getLocalVar("Phys_Absorb_Counter") + mob:getLocalVar("Magic_Absorb_Counter")
        local dmg = 50 + (absorbedDamage / 100)

        return tpz.subEffect.BLAZE_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
	elseif (mob:hasStatusEffect(tpz.effect.ICE_SPIKES)) then
		return tpz.subEffect.ICE_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
	end
end

function onMobDeath(mob, player, isKiller)
    local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
	mob:setRespawnTime(72000)
end
