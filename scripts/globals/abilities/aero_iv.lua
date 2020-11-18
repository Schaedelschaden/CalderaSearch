---------------------------------------------
-- Ability: Aero IV (Player Ability)
-- Deals wind elemental damage.
-- Obtained: Summoner (Garuda) Level 60
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Aero IV PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 872 -- mob_skill_id from mob_skills.sql

--	printf("Aero IV PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end