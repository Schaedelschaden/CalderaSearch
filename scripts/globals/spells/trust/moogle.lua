-----------------------------------------
-- Trust: Moogle
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
        if not member:hasStatusEffect(tpz.effect.GEO_REFRESH) then
            member:addStatusEffect(tpz.effect.GEO_REFRESH, 3, 0, 0)
            member:getStatusEffect(tpz.effect.GEO_REFRESH):setFlag(tpz.effectFlag.ON_ZONE)
        end
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    local master  = mob:getMaster()
    local party   = mob:getMaster():getPartyWithTrusts()

    for _, member in pairs(party) do
        if member:getObjType() == tpz.objType.PC then
            member:delStatusEffect(tpz.effect.GEO_REFRESH)
        end
    end
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    local master  = mob:getMaster()
    local party   = mob:getMaster():getPartyWithTrusts()

    for _, member in pairs(party) do
        if member:getObjType() == tpz.objType.PC then
            member:delStatusEffect(tpz.effect.GEO_REFRESH)
        end
    end
end
