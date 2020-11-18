---------------------------------------------
-- Ability: Aero II (Player Ability)
-- Deals wind elemental damage.
-- Obtained: Summoner (Garuda) Level 10
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Aero II PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 868 -- mob_skill_id from mob_skills.sql

--	printf("Aero II PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end