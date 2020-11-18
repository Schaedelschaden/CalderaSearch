-----------------------------------
-- Ability: Invincible (Automaton)
-- Grants immunity to all physical attacks.
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0,0
end

function onPetAbility(target, automaton, skill, master, action)
	automaton:delStatusEffectSilent(tpz.effect.HEADY_ARTIFICE)
    automaton:addStatusEffect(tpz.effect.INVINCIBLE, 1, 0, 30)
	skill:setMsg(tpz.msg.basic.NONE)
end