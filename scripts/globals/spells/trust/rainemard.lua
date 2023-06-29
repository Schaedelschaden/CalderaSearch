-----------------------------------------
-- Trust: Rainemard
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/spell_data")
require("scripts/globals/status")
require("scripts/globals/roe")
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
    --Mods
	mob:addMod(tpz.mod.FASTCAST, 50) --Felt it was needed. Can adjust as necessary
    mob:addMod(tpz.mod.CURE_POTENCY, 20)

    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 50, 0, 0) --If this doesnt work, try HPP (HP %)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 50, 0, 0) --If this doesnt work, try HPP (HP %)
	mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())
    mob:addMod(tpz.mod.ACC, 400)

    mob:addListener("COMBAT_TICK", "RAINEMARD_CTICK", function(mobArg, target, wsid, tp, action)
        local targMeva = target:getMod(tpz.mod.MEVA)
        mobArg:setMod(tpz.mod.MACC, targMeva)

        local dmgBase = mobArg:getMainLvl() * 2.7
        mobArg:setMod(tpz.mod.ENSPELL_DMG, dmgBase)

        -- local targAcc = target:getMod(tpz.mod.EVA)
        -- mobArg:setMod(tpz.mod.ACC, targAcc + 300)


        if mobArg:hasStatusEffect(tpz.effect.MULTI_STRIKES) then
            mobArg:setMod(tpz.mod.QUAD_ATTACK, 5)
            mobArg:setMod(tpz.mod.TRIPLE_ATTACK, 10)
            mobArg:setMod(tpz.mod.DOUBLE_ATTACK, 20)
        else
            mobArg:setMod(tpz.mod.QUAD_ATTACK, 0)
            mobArg:setMod(tpz.mod.TRIPLE_ATTACK, 0)
            mobArg:setMod(tpz.mod.DOUBLE_ATTACK, 0)
        end

        if os.time() > mobArg:getLocalVar("MOB_FIGHT_DELAY") then
            local master = mobArg:getMaster()
            local mLvl   = mobArg:getMainLvl()
            local cure   = 1

            if mLvl >= 14 and mLvl < 26 then
                cure = 2
            elseif mLvl >= 26 and mLvl < 48 then
                cure = 3
            elseif mLvl >= 48 then
                cure = 4
            end

            if mobArg:getHP() <= mobArg:getMaxHP() * 0.5 then
                mobArg:castSpell(cure, mobArg)
            end
            mobArg:setLocalVar("MOB_FIGHT_DELAY", os.time() + 1)
        end

        if os.time() > mobArg:getLocalVar("ENSPELL_DELAY") then
            local enspell =
            {
                [tpz.mod.FIRERES   ] = {tpz.effect.ENFIRE,     tpz.magic.spell.ENFIRE    },
                [tpz.mod.ICERES    ] = {tpz.effect.ENBLIZZARD, tpz.magic.spell.ENBLIZZARD},
                [tpz.mod.WINDRES   ] = {tpz.effect.ENAERO,     tpz.magic.spell.ENAERO    },
                [tpz.mod.EARTHRES  ] = {tpz.effect.ENSTONE,    tpz.magic.spell.ENSTONE   },
                [tpz.mod.THUNDERRES] = {tpz.effect.ENTHUNDER,  tpz.magic.spell.ENTHUNDER },
                [tpz.mod.WATERRES  ] = {tpz.effect.ENWATER,    tpz.magic.spell.ENWATER   },
            }

            local weakness = 0
            local weakVal = 0

            for i = tpz.mod.FIRERES, tpz.mod.WATERRES do
                if target:getMod(i) < weakVal then
                    weakness = i
                    weakVal = target:getMod(i)
                end
            end

            if
                weakness ~= 0 and
                not mobArg:hasStatusEffect(enspell[weakness][1]) and
                os.time() > mobArg:getLocalVar("ENSPELL_DELAY")
            then
                mobArg:castSpell(enspell[weakness][2], mobArg)
                mobArg:setLocalVar("ENSPELL_DELAY", os.time() + 300)
            elseif
                weakness == 0 and
                os.time() > mobArg:getLocalVar("ENSPELL_DELAY")
            then
                local pickSpell = math.random(tpz.mod.FIRERES, tpz.mod.WATERRES)

            -- Default to the elemental day of the week
                mobArg:castSpell(enspell[pickSpell][2], mobArg)
                mobArg:setLocalVar("ENSPELL_DELAY", os.time() + 300)
            end
        end
    end)


	--Priority Interrupts (Silence/Stun)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SILENCE) --Not sure if the 0 is needed here
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN) --Not sure if the 0 is needed here
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN) --Not sure if the 0 is needed here
    mob:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STUN) --Not sure if the 0 is needed here

	--Job Abilities
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.COMPOSURE, ai.r.JA, ai.s.SPECIFIC, tpz.ja.COMPOSURE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 25, ai.r.JA, ai.s.SPECIFIC, tpz.ja.CONVERT)

	--Enhancing Magic
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HASTE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.MULTI_STRIKES, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.TEMPER)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BLINK, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BLINK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.STONESKIN, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STONESKIN)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.REFRESH, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.REFRESH)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SHOCK_SPIKES, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SHOCK_SPIKES) --Not sure if the 0 is needed
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.PHALANX, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PHALANX)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.STR_BOOST, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.GAIN_STR)

    --Enfeebles
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.MAGIC_EVASION_DOWN, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.FRAZZLE)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.EVASION_DOWN, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.DISTRACT)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.BIO, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.BIO)


	--Protect/Shell (Lower Priority due to Healers in group -- ra spells)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PROTECT)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SHELL, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.SHELL)

    mob:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.HIGHEST)

end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("RAINEMARD_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("RAINEMARD_CTICK")
end