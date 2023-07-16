-----------------------------------------
-- Trust: Luzaf
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

    -- Ranged Attack as much as possible (limited by "weapon" delay)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0)
    mob:setMobMod(tpz.mobMod.DUAL_WIELD, 1)
    mob:addMod(tpz.mod.MATT, mob:getMainLvl())
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.TRIPLE_SHOT, ai.r.JA, ai.s.SPECIFIC, tpz.ja.TRIPLE_SHOT)
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.RANGED_DMG_RATING, mob:getMainLvl() * 4)
    local target = mob:getTarget()
    local shuffle = math.random(1, 3)


    if os.time() > mob:getLocalVar("WSDELAY") then
        if mob:getTP() >= 1000 then
            mob:useWeaponskill(218, target) -- Leaden Salute
            mob:setLocalVar("WSDELAY", os.time() + 30)
        end
    end
    
    if os.time() > mob:getLocalVar("SHOT_CD") then
        if target:hasStatusEffectByFlag(tpz.effectFlag.DISPELABLE) then
            mob:useJobAbility(tpz.jobAbility.DARK_SHOT, target)
        elseif target:hasStatusEffect(tpz.effect.DIA) then
            mob:useJobAbility(tpz.jobAbility.LIGHT_SHOT, target)
        end
        mob:setLocalVar("SHOT_CD", os.time() + 60)
    end    

end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
