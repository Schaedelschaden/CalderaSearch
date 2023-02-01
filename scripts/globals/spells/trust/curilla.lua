-----------------------------------------
-- Trust: Curilla
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

local message_page_offset = 6

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.teamworkMessage(mob, {
        [tpz.magic.spell.TRION]     = tpz.trust.message_offset.TEAMWORK_1,
        [tpz.magic.spell.RAINEMARD] = tpz.trust.message_offset.TEAMWORK_2,
        [tpz.magic.spell.RAHAL]     = tpz.trust.message_offset.TEAMWORK_3,
        [tpz.magic.spell.HALVER]    = tpz.trust.message_offset.TEAMWORK_4,
    })

    local defBonus = mob:getMainLvl()

    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 30, 0, 0)
    mob:getStatusEffect(tpz.effect.MAX_MP_BOOST):setFlag(tpz.effectFlag.DEATH)

    mob:setMobMod(tpz.mobMod.MOBMOD_CAN_SHIELD_BLOCK, 1)
    mob:setMod(tpz.mod.SHIELDBLOCKRATE, 45)
    mob:addMod(tpz.mod.DEF, defBonus)
    mob:addMod(tpz.mod.CURE_POTENCY, 35)
    mob:addMod(tpz.mod.CURE_CAST_TIME, 50)
    -- Guardian and Sentinel Recast handled in Sentinel ability LUA

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SENTINEL)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FLASH, 45)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

    mob:setTrustTPSkillSettings(ai.tp.RANDOM, ai.s.RANDOM)
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
