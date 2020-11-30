---------------------------------------------------
-- Soothing Ruby (Carbuncle Blood Pact)
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
	printf("Soothing Ruby PET onUseAbility\n")
	return 0,0
end

function onPetAbility(target, pet, skill, player)
--	printf("Soothing Ruby PET onUseAbility\n")
	local smnSkill = player:getSkillLevel(tpz.skill.SUMMONING_MAGIC)
	local effect = {}
	
	-- Display no message
	skill:setMsg(tpz.msg.basic.NONE)
	
	if (smnSkill <= 382) then
		effect[1] = target:eraseStatusEffect()
		effect[2] = target:eraseStatusEffect()
		effect[3] = target:eraseStatusEffect()
		effect[4] = target:eraseStatusEffect()
	elseif (smnSkill <= 417) then
		effect[1] = target:eraseStatusEffect()
		effect[2] = target:eraseStatusEffect()
		effect[3] = target:eraseStatusEffect()
		effect[4] = target:eraseStatusEffect()
		effect[5] = target:eraseStatusEffect()
	elseif (smnSkill >= 418) then
		effect[1] = target:eraseStatusEffect()
		effect[2] = target:eraseStatusEffect()
		effect[3] = target:eraseStatusEffect()
		effect[4] = target:eraseStatusEffect()
		effect[5] = target:eraseStatusEffect()
		effect[6] = target:eraseStatusEffect()
	end
end