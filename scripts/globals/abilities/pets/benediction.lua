-----------------------------------
-- Ability: Benediction (Automaton)
-- Restores a large amount of HP and removes (almost) all status ailments for party members within area of effect.
-----------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0,0
end

function onPetAbility(target, automaton, skill, master, action)
	automaton:delStatusEffectSilent(tpz.effect.HEADY_ARTIFICE)
	-- To Do: Benediction can remove Charm only while in Assault Mission Lamia No.13
    local removables = {tpz.effect.FLASH, tpz.effect.BLINDNESS, tpz.effect.MAX_HP_DOWN, tpz.effect.MAX_MP_DOWN, tpz.effect.PARALYSIS, tpz.effect.POISON,
                        tpz.effect.CURSE_I, tpz.effect.CURSE_II, tpz.effect.DISEASE, tpz.effect.PLAGUE, tpz.effect.WEIGHT, tpz.effect.BIND,
                        tpz.effect.BIO, tpz.effect.DIA, tpz.effect.BURN, tpz.effect.FROST, tpz.effect.CHOKE, tpz.effect.RASP, tpz.effect.SHOCK, tpz.effect.DROWN,
                        tpz.effect.STR_DOWN, tpz.effect.DEX_DOWN, tpz.effect.VIT_DOWN, tpz.effect.AGI_DOWN, tpz.effect.INT_DOWN, tpz.effect.MND_DOWN,
                        tpz.effect.CHR_DOWN, tpz.effect.ADDLE, tpz.effect.SLOW, tpz.effect.HELIX, tpz.effect.ACCURACY_DOWN, tpz.effect.ATTACK_DOWN,
                        tpz.effect.EVASION_DOWN, tpz.effect.DEFENSE_DOWN, tpz.effect.MAGIC_ACC_DOWN, tpz.effect.MAGIC_ATK_DOWN, tpz.effect.MAGIC_EVASION_DOWN,
                        tpz.effect.MAGIC_DEF_DOWN, tpz.effect.MAX_TP_DOWN, tpz.effect.SILENCE}

    for i, effect in ipairs(removables) do
        if (target:hasStatusEffect(effect)) then
            target:delStatusEffect(effect)
        end
    end

    local heal = (target:getMaxHP() * automaton:getMainLvl()) / target:getMainLvl()

    local maxHeal = target:getMaxHP() - target:getHP()

    if (heal > maxHeal) then
        heal = maxHeal
    end

    automaton:updateEnmityFromCure(target, heal)
    target:addHP(heal)
    target:wakeUp()
	skill:setMsg(tpz.msg.basic.AOE_HP_RECOVERY)

    return heal
end