---------------------------------------------
-- Ability: Dream Shroud (Player Ability)
-- Enhances magic attack and magic defense of party members within area of effect.
-- Obtained: Summoner (Diabolos) Level 56
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Dream Shroud PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 1907 -- mob_skill_id from mob_skills.sql

--	printf("Dream Shroud PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end