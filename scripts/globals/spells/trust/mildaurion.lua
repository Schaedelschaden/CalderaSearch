-----------------------------------------
-- Trust: Mildaurion
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
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)
    
	-- HP ADJUSTMENT --
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 5, 0, 0)
    mob:setHP(mob:getMaxHP())
    
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 100)
end

function onMobFight(mob, target)
    local target = mob:getTarget()
    if os.time() > mob:getLocalVar("TPMOVES") then
        if mob:getTP() >= 1500 then
            local WS = { 830, 985, 829, 985 }
            mob:useMobAbility(WS[math.random(1, 4)], target)
        end
        mob:setLocalVar("TPMOVES", os.time() + 3)
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end