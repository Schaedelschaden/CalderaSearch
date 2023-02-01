-----------------------------------
-- Trust: Gessho
-----------------------------------
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
-----------------------------------
--Notes to Self/Bart
    --Abilities:
        --Shiko no Mitate
            --Yagudo Parry
        --Rinpyotosha
            --Warcry

    --Weaponskills
        --Happobarai
            --Yagudo Sweep
                --Reverberation
                --Impaction
        --Hane Fubuki
            --Feather Storm
                --Transfitpzon
        --Shibaraku
            --AoE
                --Darkness
                --Gravitation

    --Special Abilities
        --Shiko no Mitate
            --DEF+
            --Stoneskin
            --Issekigan
        --Rinpyotosha
            --25% ATK+ Warcry
                --3 Min Duration
                --5 Min Recast
-----------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.teamworkMessage(mob, {
        [tpz.magic.spell.NAJA_SALAHEEM] = tpz.trust.message_offset.TEAMWORK_1,
        [tpz.magic.spell.ABQUHBAH] = tpz.trust.message_offset.TEAMWORK_2,
    })

    mob:addListener("WEAPONSKILL_USE", "GESSHO_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
        if wsid == 3257 then -- Shibaraku
            -- You have left me no choice. Prepare yourself!
            tpz.trust.message(mobArg, tpz.trust.message_offset.SPECIAL_MOVE_1)
        end
    end)

    mob:addListener("COMBAT_TICK", "GESSHO_CTICK", function(mobArg, target, wsid, tp, action)
        if os.time() > mobArg:getLocalVar("CTICK_DELAY") then
            local isBusy = false
            local act    = mobArg:getCurrentAction()

            if
                act == tpz.act.WEAPONSKILL_START or
                act == tpz.act.WEAPONSKILL_FINISH or
                act == tpz.act.MOBABILITY_START or
                act == tpz.act.MOBABILITY_USING or
                act == tpz.act.MOBABILITY_FINISH or
                act == tpz.act.MAGIC_START or
                act == tpz.act.MAGIC_CASTING or
                act == tpz.act.MAGIC_START
            then
                isBusy = true 
            end

            if isBusy == false then
                if not mobArg:hasStatusEffect(tpz.effect.WARCRY) then
                    mobArg:useMobAbility(3260) --Rinpyotosha
                end

                local mlvl   = mobArg:getMainLvl()
                local target = mobArg:getTarget()

                --UTSUSEMI
                if
                    not mobArg:hasStatusEffect(tpz.effect.COPY_IMAGE) and
                    mlvl > 11 and mlvl < 37
                then
                    mobArg:castSpell(338, mobArg)
                elseif
                    not mobArg:hasStatusEffect(tpz.effect.COPY_IMAGE) and
                    mlvl > 36
                then
                    mobArg:castSpell(339, mobArg)
                end

                if
                    not mobArg:hasStatusEffect(tpz.effect.MIGAWARI) and
                    mlvl > 87
                then
                    mobArg:castSpell(510, mobArg)
                end

                if not mobArg:hasStatusEffect(tpz.effect.DEFENSE_BOOST) then
                   mobArg:useMobAbility(3258) --Shiko no Mitate
                end
            end

            mobArg:setLocalVar("CTICK_DELAY", os.time() + 1)
        end
    end)

    mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:addMod(tpz.mod.ENMITY, 100)
    mob:addMod(tpz.mod.PARRY_RATE_BONUS, 25)

    -- Shadows are represented by tpz.effect.COPY_IMAGE, but with different icons depending on the tier
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.YONIN, ai.r.JA, ai.s.SPECIFIC, tpz.ja.YONIN) --Yonin first to enhance ninja tools and add enmity
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE) --provoke is priority

    --mob:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.HIGHEST) --currently looks for closers asap.
    --mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.HIGHEST, 1500) -- this is for after LSB upgrades to hold for closers until 1500 then dump.
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("GESSHO_WEAPONSKILL_USE")
    mob:removeListener("GESSHO_CTICK")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("GESSHO_WEAPONSKILL_USE")
    mob:removeListener("GESSHO_CTICK")
end
