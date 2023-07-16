-----------------------------------------
-- Trust: Kuyin Hathdenna
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
    
    local mlvl = mob:getMainLvl()
    local tick_amount
    if mlvl == 99 then
        tick_amount = 24
    elseif mlvl < 99 then
        tick_amount = 20
    elseif mlvl <= 87 then
        tick_amount = 16
    elseif mlvl <= 73 then
        tick_amount = 12
    elseif mlvl <= 51 then
        tick_amount = 8
    else
        tick_amount = 4
    end

    mob:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 6, 3, 0, tpz.effect.GEO_ACCURACY_BOOST, tick_amount, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)
    mob:addStatusEffectEx(tpz.effect.ABYSSEA_DEX, tpz.effect.DEX_BOOST_II, 20, 0, 0)
    mob:SetAutoAttackEnabled(false)
end

function onMobFight(mob, target)
    local master  = mob:getMaster()
    local party   = mob:getMaster():getPartyWithTrusts()

    for _, member in pairs(party) do
        if not member:hasStatusEffect(tpz.effect.ABYSSEA_DEX) and member:getObjType() == tpz.objType.PC then
            member:addStatusEffectEx(tpz.effect.ABYSSEA_DEX, tpz.effect.DEX_BOOST_II, mob:getMainLvl() / 10, 0, 0)
            member:getStatusEffect(tpz.effect.ABYSSEA_DEX):setFlag(tpz.effectFlag.ON_ZONE)
        end
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    local master  = mob:getMaster()
    local party   = mob:getMaster():getPartyWithTrusts()

    for _, member in pairs(party) do
        if member:getObjType() == tpz.objType.PC then
            member:delStatusEffect(tpz.effect.ABYSSEA_DEX)
        end
    end
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    local master  = mob:getMaster()
    local party   = mob:getMaster():getPartyWithTrusts()

    for _, member in pairs(party) do
        if member:getObjType() == tpz.objType.PC then
            member:delStatusEffect(tpz.effect.ABYSSEA_DEX)
        end
    end
end
