-----------------------------------------
-- Trust: Kupofried
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
    mob:setUnkillable(true)
    mob:SetAutoAttackEnabled(false)
end

function onMobFight(mob, target)
    local master  = mob:getMaster()
    local party   = mob:getMaster():getPartyWithTrusts()

    for _, member in pairs(party) do
        if not member:hasStatusEffect(tpz.effect.DEDICATION) and member:getObjType() == tpz.objType.PC then
            member:addStatusEffect(tpz.effect.DEDICATION, 100, 0, 0, 0, 30000)
            member:getStatusEffect(tpz.effect.DEDICATION):setFlag(tpz.effectFlag.ON_ZONE)
        end
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    local master  = mob:getMaster()
    local party   = mob:getMaster():getPartyWithTrusts()

    for _, member in pairs(party) do
        if member:getObjType() == tpz.objType.PC then
            member:delStatusEffect(tpz.effect.DEDICATION)
        end
    end
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    local master  = mob:getMaster()
    local party   = mob:getMaster():getPartyWithTrusts()

    for _, member in pairs(party) do
        if member:getObjType() == tpz.objType.PC then
            member:delStatusEffect(tpz.effect.DEDICATION)
        end
    end
end
 -- target:addStatusEffect(tpz.effect.DEDICATION, 100, 0, 86400, 0, 30000)