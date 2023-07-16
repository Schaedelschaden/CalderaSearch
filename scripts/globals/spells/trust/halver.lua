-----------------------------------------
-- Trust: Halver
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

    local defBonus = mob:getMainLvl()

	-- 3K HP ADJUSTMENT --
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 5, 0, 0)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 30, 0, 0)
    mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())
    mob:addMod(tpz.mod.STORETP, 55)

    mob:addMod(tpz.mod.DEF, defBonus)
    mob:addMod(tpz.mod.CURE_POTENCY, 35)
    mob:addMod(tpz.mod.CURE_CAST_TIME, 50)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BERSERK)
    mob:addSimpleGambit(ai.t.TANK, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SENTINEL)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.RAMPART)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FLASH)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl())

end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        local master = mob:getMaster()
        local party  = master:getPartyWithTrusts()
        local mLvl   = mob:getMainLvl()
        local cure   = 1

        if mLvl >= 17 and mLvl <= 29 then
            cure = 2
        elseif mLvl >= 30 and mLvl <= 54 then
            cure = 3
        elseif mLvl >= 55 then
            cure = 4
        end

        for i, v in ipairs(party) do
            if v:getHPP() <= 50 then
                mob:castSpell(cure, v)
            end
        end
        
        if mob:getTP() >= 1000 then
            local WS = { 116, 120, 114 }
            mob:useWeaponskill(WS[math.random(1, 3)], target)
        end
        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 1)
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end