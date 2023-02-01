---------------------------------------------
-- Hastega
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	return 0, 0
end

function onUseAbility(pet, target, ability)
    printf("hastega_ii.lua onUseAbility  TRIGGER")
    -- pet:queue(0, function(pet)
        -- pet:stun(5000)
    -- end)
end

function onPetAbility(target, pet, skill, player)
    printf("hastega_ii.lua onPetAbility  TRIGGER")
    local bonusTime = utils.clamp(player:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration  = 300 + bonusTime

	target:delStatusEffectSilent(tpz.effect.HASTE)
    target:addStatusEffect(tpz.effect.HASTE, 3008, 0, duration) -- 308/1024 ~30.08%

    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)

    return tpz.effect.HASTE
end
