-----------------------------------------
-- Trust: Trion
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.teamworkMessage(mob, {
        [tpz.magic.spell.CURILLA] = tpz.trust.message_offset.TEAMWORK_1,
        [tpz.magic.spell.RAHAL]   = tpz.trust.message_offset.TEAMWORK_2,
        [tpz.magic.spell.HALVER]  = tpz.trust.message_offset.TEAMWORK_3,
    })

    local defBonus = mob:getMainLvl() * 1.5

    mob:setMobMod(tpz.mobMod.MOBMOD_CAN_SHIELD_BLOCK, 1)
    mob:setMod(tpz.mod.SHIELDBLOCKRATE, 45)
    mob:addMod(tpz.mod.DEF, defBonus)
    
	-- 3K HP ADJUSTMENT --
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 6, 0, 0)
    mob:setHP(mob:getMaxHP())
    

    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SHIELD_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SHIELD_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SHIELD_BASH)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SHIELD_BASH)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SENTINEL)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FLASH)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)
end

function onMobFight(mob)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        if os.time() > mob:getLocalVar("ROYAL_BASH_DELAY") then
            mob:useMobAbility(3193)
            mob:setLocalVar("ROYAL_BASH_DELAY", os.time() + 60)
        end

        if
            os.time() > mob:getLocalVar("ROYAL_SAVIOR") and
            not mob:hasStatusEffect(tpz.effect.SENTINEL)
        then
            mob:useMobAbility(3194)
            mob:setLocalVar("ROYAL_SAVIOR", os.time() + 180)
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
