-----------------------------------
-- Ability: Soothing Ruby (Player Ability)
-- Removes multiple status ailments from party members within area of effect.  
-- Obtained: Summoner (Carbuncle) Level 94
-- Recast Time: 01:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
--	printf("Soothing Ruby PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3579 -- mob_skill_id from mob_skills.sql

--	printf("Healing Ruby PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact)
end