-----------------------------------------
-- Trust: Ferreous Coffin
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
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)
    mob:setSpellList(393)
	mob:addMod(tpz.mod.REGEN, 10)
	mob:addMod(tpz.mod.REFRESH, 10)
	mob:addMod(tpz.mod.REGAIN, 25)
    mob:addMod(tpz.mod.CURE_POTENCY, 50)
	mob:addMod(tpz.mod.FASTCAST, 50)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:addMod(tpz.mod.TRIPLE_ATTACK, 10)
    mob:addMod(tpz.mod.ENHANCES_CURSNA, 50)
    mob:addMod(tpz.mod.ENHANCES_CURSNA_RCVD, 50)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl())
    
    --DOOOOM
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DOOM, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA)
    --SELF-BOOFS
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.AFFLATUS_MISERY, ai.r.JA, ai.s.SPECIFIC, tpz.ja.AFFLATUS_MISERY)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.STONESKIN, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STONESKIN)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BLINK, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BLINK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.AUSPICE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.AUSPICE)
    --HEALS
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 60, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)
    --ZZZZ Removal
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURAGA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURAGA)
    --PARTY-BOOFS
    mob:addSimpleGambit(ai.t.MASTER, ai.c.NOT_STATUS, tpz.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.PROTECTRA)
    mob:addSimpleGambit(ai.t.MASTER, ai.c.NOT_STATUS, tpz.effect.SHELL, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.SHELLRA)
    mob:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HASTE)
    --DEBOOF REMOVALS
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.POISON, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.POISONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.PARALYNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BLINDNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SILENA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.VIRUNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.CURSE_I, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA)
    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, tpz.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ERASE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS_FLAG, tpz.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ERASE)
end

function onMobFight(mob)
    if
        os.time() > mob:getLocalVar("MOB_FIGHT_DELAY")
    then
        local isBusy = false
        local act    = mob:getCurrentAction()

        if
            act == tpz.act.WEAPONSKILL_START or
            act == tpz.act.WEAPONSKILL_FINISH or
            act == tpz.act.MOBABILITY_START or
            act == tpz.act.MOBABILITY_USING or
            act == tpz.act.MOBABILITY_FINISH or
            act == tpz.act.MAGIC_START or
            act == tpz.act.MAGIC_CASTING or
            act == tpz.act.MAGIC_FINISH
        then
            isBusy = true
        end

        if isBusy == false and mob:actionQueueEmpty() == true then

            local master  = mob:getMaster()
            local party   = master:getPartyWithTrusts()
            local mLvl    = mob:getMainLvl()
            local target  = master:getTarget()
            
            for i, v in ipairs(party) do
                if v:getObjType() == tpz.objType.PC and v:isDead() then
                    if mLvl >= 25 and mLvl < 56 then
                        mob:castSpell(12, v)
                    elseif mLvl >= 56 and mLvl < 70 then
                        mob:castSpell(13, v)
                    elseif mLvl >=70 then
                        mob:castSpell(140, v)
                    end
                end
            end
            
            if target:hasStatusEffect(tpz.effect.MANAFONT) or target:hasStatusEffect(tpz.effect.ASTRAL_FLOW) or target:hasStatusEffect(tpz.effect.CHAINSPELL) then
                mob:useJobAbility(271, mob)
            end
            
            local rand = math.random(1, 3)
            if mob:getTP() >= 1000 and mob:getMP() >= mob:getMaxMP() * 0.20 then
                if rand == 1 then
                    mob:useWeaponskill(168, target) -- Hexa Strike
                elseif rand == 2 then
                    mob:useWeaponskill(170, target) -- Randgrith
                elseif rand == 3 then
                    mob:useWeaponskill(174, target) -- Realm Razer
                end
            elseif mob:getTP() >= 1000 and mob:getMP() <= mob:getMaxMP() * 0.20 then
                mob:useWeaponskill(173, mob) -- DAGAN
            end   
            mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 1)    
        end
    end
end



function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end

