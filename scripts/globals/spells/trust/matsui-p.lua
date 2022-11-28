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
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.COPY_IMAGE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.UTSUSEMI_NI)
    -- mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE, 15)
    -- mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.RANDOM, tpz.magic.spellFamily.NONE, 45)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("ONMOBFIGHT_PAUSE_TIME") then
        if not mob:hasStatusEffect(tpz.effect.COPY_IMAGE) then
            mob:castSpell(339, mob)
        end

        mob:setLocalVar("ONMOBFIGHT_PAUSE_TIME", os.time() + 3)
    end
end

function onMobDespawn(mob)
    -- tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    -- tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
