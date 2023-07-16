-----------------------------------------
-- Trust: Ingrid
-----------------------------------------
require("scripts/globals/trust")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell, 1016)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DOOM, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA)    
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HASTE)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.NONE, 45)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 5)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
    mob:addMod(tpz.mod.STORETP, 50)
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.LIGHTATT, 200)
    local target = mob:getTarget()
    if os.time() > mob:getLocalVar("TPMOVES") then
        if mob:getTP() >= 1000 then
            local WS = { 161, 167, 168 }
            mob:useWeaponskill(WS[math.random(1, 3)], target)
        end
        mob:setLocalVar("TPMOVES", os.time() + 3)
    end
end

function onMobDespawn(mob)
end

function onMobDeath(mob)
end
