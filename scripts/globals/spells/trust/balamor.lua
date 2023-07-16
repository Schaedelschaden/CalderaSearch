-----------------------------------------
-- Trust: Balamor
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
    mob:addMod(tpz.mod.STORETP, 100)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 125, 0, 0) --If this doesnt work, try HPP (HP %)
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 40, 0, 0) --If this doesnt work, try HPP (HP %)
    mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())
    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE, 5)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.RANDOM, tpz.magic.spellFamily.NONE, 45)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 20)
end

function onMobFight(mob, target)
    local target = mob:getTarget()
    if os.time() > mob:getLocalVar("TPMOVES") then
        if mob:getTP() >= 1000 then
            local WS = { 3303, 3307, 3305, 3306 }
            mob:useMobAbility(WS[math.random(1, 4)], target)
        end
        mob:setLocalVar("TPMOVES", os.time() + 3)
    end

end

function onMobDespawn(mob)
end

function onMobDeath(mob)
end