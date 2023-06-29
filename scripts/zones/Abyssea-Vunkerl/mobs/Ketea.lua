-----------------------------------
-- Area: Abyssea - Vunkerl
--   NM: Ketea
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/spell_data")
-----------------------------------

local function openMouth(mob)
    mob:addMod(tpz.mod.ATTP, 100)
    mob:addMod(tpz.mod.DEFP, -50)
    mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
    mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 0)
    mob:delStatusEffectSilent(tpz.effect.ICE_SPIKES)
    mob:AnimationSub(3)
    mob:wait(2000)
end

local function closeMouth(mob)
    mob:delMod(tpz.mod.ATTP, 100)
    mob:delMod(tpz.mod.DEFP, -50)
    mob:setMod(tpz.mod.MAGIC_ABSORB, 100)
    mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
    mob:addStatusEffectEx(tpz.effect.ICE_SPIKES,tpz.effect.ICE_SPIKES, 1, 0, 0)
    mob:getStatusEffect(tpz.effect.ICE_SPIKES):setFlag(tpz.effectFlag.DEATH)
    mob:AnimationSub(6)
    mob:wait(2000)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DEF, 1000)
    mob:addMod(tpz.mod.EVA, 150)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_OPEN_MOUTH", function(mobArg, skillID)
        local chance = 25

        if skillID == 1368 then -- Rapid Molt
            chance = 50
        end

		if
            mobArg:AnimationSub() == 6 and
            math.random(0, 100) <= chance
        then
            openMouth(mobArg)
        end
    end)

    mob:addListener("TAKE_DAMAGE", "DAMAGE_CLOSE_MOUTH", function(mobArg, amount, attacker, attackType, damageType)
        if
            mobArg:AnimationSub() == 3 and
            amount >= 1500
        then
           closeMouth(mobArg)
        end
    end)
end

function onMobFight(mob, target)
end

function onSpikesDamage(mob, target, damage)
	local dmg = math.random(175, 225)

    return tpz.subEffect.ICE_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
end

function onSpellPrecast(mob, spell)
    if
        spell:getID() == tpz.magic.spell.BLIZZAGA_IV or
        spell:getID() == tpz.magic.spell.SLEEPGA_II or
        spell:getID() == tpz.magic.spell.PARALYGA or
        spell:getID() == tpz.magic.spell.BLINDGA or
        spell:getID() == tpz.magic.spell.BINDGA
    then
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
    end
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_OPEN_MOUTH")
    mob:removeListener("DAMAGE_CLOSE_MOUTH")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_OPEN_MOUTH")
    mob:removeListener("DAMAGE_CLOSE_MOUTH")
end
