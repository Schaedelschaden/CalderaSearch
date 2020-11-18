-----------------------------------
-- Ability: Mighty Strikes
-- Turns all melee attacks into critical hits.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0,0
end

function onPetAbility(target, automaton, skill, master, action)
	automaton:delStatusEffectSilent(tpz.effect.HEADY_ARTIFICE)
    automaton:addStatusEffect(tpz.effect.MIGHTY_STRIKES, 1, 0, 45)
	skill:setMsg(tpz.msg.basic.NONE)
end