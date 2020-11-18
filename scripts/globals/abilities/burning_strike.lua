---------------------------------------------
-- Ability: Burning Strike (Player Ability)
-- Deals fire elemental damage. 
-- Obtained: Summoner (Ifrit) Level 23
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Burning Strike PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 842 -- mob_skill_id from mob_skills.sql

--	printf("Burning Strike PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end