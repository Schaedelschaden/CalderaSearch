---------------------------------------------
-- Ability: Fleet Wind (Player Ability)
-- Increases movement speed for party members within area of effect.
-- Obtained: Summoner (Garuda) Level 86
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Fleet Wind PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3992 -- mob_skill_id from mob_skills.sql

--	printf("Fleet Wind PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end