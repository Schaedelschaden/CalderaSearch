-----------------------------------------
-- Trust: Matsui-P
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/spell_data")
require("scripts/globals/trust")
require("scripts/globals/utils")
require("scripts/globals/weaponskillids")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.ACC, 500)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
    mob:addMod(tpz.mod.STORETP, 105)
    mob:addStatusEffect(tpz.effect.SUBTLE_BLOW_PLUS, 10, 0, 0)
    mob:addStatusEffect(tpz.effect.MANA_WALL, 50, 0, 0)
    mob:addStatusEffect(tpz.effect.REFRESH, 1, 0, 0)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 125, 0, 0) --If this doesnt work, try HPP (HP %)
    mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())
    
    
    local power = mob:getMainLvl() * 2

    mob:setMod(tpz.mod.MATT, power * 1.5)
    -- mob:addMod(tpz.mod.MACC, power)
    mob:addMod(tpz.mod.MAGIC_DAMAGE, power * 1.5)
    mob:addMod(tpz.mod.MAG_BURST_BONUS, mob:getMainLvl() / 8)
    mob:addMod(tpz.mod.HASTE_MAGIC, 1000)    
    mob:setMod(tpz.mod.FASTCAST, 50)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.INNIN, ai.r.JA, ai.s.SPECIFIC, tpz.ja.INNIN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.BURN, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BURN)
    
    -- Stun all the things!
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN)
    

    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE, 5)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.RANDOM, tpz.magic.spellFamily.NONE, 45)

    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 5)
    mob:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.OPENER)    
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("ONMOBFIGHT_PAUSE_TIME") then
        if not mob:hasStatusEffect(tpz.effect.COPY_IMAGE) then
            mob:castSpell(340, mob)
        end

        mob:setLocalVar("ONMOBFIGHT_PAUSE_TIME", os.time() + 3)
    end
end

function onMobDespawn(mob)
end

function onMobDeath(mob)
end
