-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Tristitia
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
	mob:addStatusEffect(tpz.effect.SHOCK_SPIKES, 1, 0, 0)
    mob:getStatusEffect(tpz.effect.SHOCK_SPIKES):setFlag(tpz.effectFlag.DEATH)

    mob:setMod(tpz.mod.FASTCAST, 35)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 65)
    mob:addMod(tpz.mod.MATT, 75)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        if
            mob:getHPP() <= 70 and
            math.random(0, 100) <= 5 and
            mob:getLocalVar("has2hrd") == 0
        then
            mob:useMobAbility(691)
            mob:setLocalVar("has2hrd", 1)
        end

        if mob:hasStatusEffect(tpz.effect.MANAFONT) then
            mob:setMobMod(tpz.mobMod.SPELL_LIST, 507) -- Adds Burst II
            mob:setMobMod(tpz.mobMod.MAGIC_COOL, 0)
            mob:setMod(tpz.mod.FASTCAST, 75)
        else
            mob:setMobMod(tpz.mobMod.SPELL_LIST, 506)
            mob:setMobMod(tpz.mobMod.MAGIC_COOL, 30) -- May need to be in milliseconds
            mob:setMod(tpz.mod.FASTCAST, 35)
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 1)
    end
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 252 then -- Stun
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(20)
    end
end

function onSpikesDamage(mob, target, damage)
	local dmg = math.random(50, 200)

    return tpz.subEffect.SHOCK_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
