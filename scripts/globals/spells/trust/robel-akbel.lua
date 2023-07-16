-----------------------------------------
-- Trust: Robel-Akbel
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
    mob:addMod(tpz.mod.REFRESH, 3)
    mob:addMod(tpz.mod.HASTE_MAGIC, 1000)    
    mob:setMod(tpz.mod.FASTCAST, 50)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 30, 0, 0) --If this doesnt work, try HPP (HP %)
    mob:setMP(mob:getMaxMP())

    -- Stun all the things!
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE, 5)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.NONE, 45)

    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 15)
    mob:addMod(tpz.mod.REGAIN, 50)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MYRKR") then
        if mob:getTP() >= 1000 and (mob:getMP() <= (mob:getMaxMP() / 2)) then
            mob:useWeaponskill(190, mob)
        end
        mob:setLocalVar("MYRKR", os.time() + 3)
    end
end

function onMobDespawn(mob)
end

function onMobDeath(mob)
end
