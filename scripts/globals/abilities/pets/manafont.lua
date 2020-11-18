-----------------------------------
-- Ability: Manafont
-- Eliminates the cost of magic spells.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0,0
end

function onPetAbility(target, automaton, skill, master, action)
	automaton:delStatusEffectSilent(tpz.effect.HEADY_ARTIFICE)
    automaton:addStatusEffect(tpz.effect.MANAFONT, 1, 0, 60)
	skill:setMsg(tpz.msg.basic.NONE)
end