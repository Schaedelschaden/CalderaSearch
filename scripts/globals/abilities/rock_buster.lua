---------------------------------------------
-- Ability: Rock Buster (Player Ability)
-- Binds target.
-- Obtained: Summoner (Titan) Level 21
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Rock Buster PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 851 -- mob_skill_id from mob_skills.sql

--	printf("Rock Buster PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end