-----------------------------------------
-- Trust: AAGK
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/roe")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------
--Notes
    --Job: SAM/DRG

    --Abilities:

    --Weapon Skills:
        --Tachi: Fudo (Light/Distortion)
        --Tachi: Gekko (Distortion/Reverberation)
        --Tachi: Kasha (Fusion/Compression)
        --Tachi: Yukikaze (Induration/Detonation)
        --Dragonfall (No SC Properties)
            --AoE Damage
            --Bind

    --Acquisition
        --RETAIL: Long chain ending in AA fight
        --RECOMMEND: AAGK Fight at least

    --Special Features:

    --Trust Synergy:
        --AA's gain Accumulative Magic Resistance based on number of AA's in the party
            --1 = 0%
            --2 = 22%
            --3 = 44%
            --4 = 66%
            --5 = 88%
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    -- tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)

    -- mob:addListener("WEAPONSKILL_USE", "AAGK_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action) --hax for self skillchain.
        -- if wsid ~= 0 and mobArg:hasStatusEffect(tpz.effect.SEKKANOKI) then
            -- mobArg:setTP(2000)
            -- mobArg:delStatusEffect(tpz.effect.SEKKANOKI)
        -- end
    -- end)

    --Modifiers
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 20) --supposed to be 20% may need to switch to HPP
    mob:setHP(mob:getMaxHP())

    --Occasionally triggers Fotia set SAVETP effect
    mob:addMod(tpz.mod.WS_NO_DEPLETE, 15) --15% Chance weapon skill consumes no TP (May need adjusted down)

    --Jump High TP Return Mod
    mob:addMod(tpz.mod.JUMP_TP_BONUS, 790) --TP Returned on Jumps (May need to be lowered or raised to meet the original 790 TP return)
    --Abilities
    --Enmity Shed
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.HIGH_JUMP)
    --Hasso
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.HASSO, ai.r.JA, ai.s.SPECIFIC, tpz.ja.HASSO)
    --TP Gains
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.MEDITATE, ai.r.JA, ai.s.SPECIFIC, tpz.ja.MEDITATE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_LT, 1000, ai.r.JA, ai.s.SPECIFIC, tpz.ja.JUMP)
    --Pre Weapon Skill
    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_LT, 1000, ai.r.JA, ai.s.SPECIFIC, tpz.ja.HAGAKURE)
    --mob:addSimpleGambit(ai.t.MASTER, ai.c.TP_GTE, 1000, ai.r.JA, ai.s.SPECIFIC, tpz.ja.KONZENITTAI) --Not sure if I needed - or _ between Konzen-Ittai
    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_GTE, 2000, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SEKKANOKI)

    mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.HIGHEST, 3000)
end

function onMobDespawn(mob)
    -- tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    -- tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
