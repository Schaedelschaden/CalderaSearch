-----------------------------------------
-- Trust: Tenzen II
-----------------------------------------
require("scripts/globals/trust")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell, 908)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)

    -- Ranged Attack as much as possible (limited by "weapon" delay)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0)
    mob:SetAutoAttackEnabled(false)
end

function onMobFight(mob)
    mob:setMod(tpz.mod.RANGED_DMG_RATING, mob:getMainLvl() * 4)

    if os.time() > mob:getLocalVar("WSDELAY") then
        if mob:getTP() >= 1000 then
            mob:useMobAbility(1397)
            mob:setLocalVar("WSDELAY", os.time() + 30)
        end
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
