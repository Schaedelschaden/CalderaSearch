-----------------------------------------
-- Trust: Rosulatia
-----------------------------------------
require("scripts/globals/trust")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 35, 0, 0)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 50, 0, 0)
    mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())
    mob:addMod(tpz.mod.REFRESH, 10)
    mob:addMod(tpz.mod.REGAIN, 50)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE, 5)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.RANDOM, tpz.magic.spellFamily.NONE, 45)
end

function onMobFight(mob)

    if os.time() > mob:getLocalVar("rose") then            
        if mob:getLocalVar("ROTATION") == 0 and mob:getTP() >= 1000 then
            mob:useMobAbility(3081) -- baneful blades
            mob:setLocalVar("ROTATION", 1)
        elseif mob:getLocalVar("ROTATION") == 1 and mob:getTP() >= 1000 then
            mob:useMobAbility(3092) -- wildwood indignation
            mob:setLocalVar("ROTATION", 2)               
        elseif mob:getLocalVar("ROTATION") == 2 and mob:getTP() >= 1000 then
            mob:useMobAbility(3093) -- dryads kiss
            mob:setLocalVar("ROTATION", 3)           
        elseif mob:getLocalVar("ROTATION") == 3 and mob:getTP() >= 1000 then
            mob:useMobAbility(3096) -- Matriarchal fiat
            mob:setLocalVar("ROTATION", 0)          
        end
        mob:setLocalVar("rose", os.time() + 10)
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
