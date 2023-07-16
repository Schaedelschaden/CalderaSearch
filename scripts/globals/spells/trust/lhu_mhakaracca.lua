-----------------------------------------
-- Trust: Lhu Mhakaracca
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
    mob:addMod(tpz.mod.ACC, 500)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 3)
    mob:addMod(tpz.mod.STORETP, 105)
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 7, 0, 0) --If this doesnt work, try HPP (HP %)
    mob:setHP(mob:getMaxHP())
    
    mob:addSimpleGambit(ai.t.TARGET, ai.c.HPP_LT, 20, ai.r.JA, ai.s.SPECIFIC, tpz.ja.FERAL_HOWL)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BERSERK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.AGGRESSOR)
end

function onMobFight(mob, target)
    local target = mob:getTarget()
    if os.time() > mob:getLocalVar("WSDELAY") then
        if mob:getTP() >= 1000 then
            local WS = { 68, 69, 72, 73 }
            mob:useWeaponskill(WS[math.random(1, 4)], target)
            mob:setLocalVar("WSDELAY", os.time() + 3)
        end
    end
end

function onMobDespawn(mob)
end

function onMobDeath(mob)
end
