---------------------------------------------
-- Ability: Geocrush (Player Ability)
-- Deals earth elemental damage and stuns target.
-- Obtained: Summoner (Titan) Level 75
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Geocrush PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 856 -- mob_skill_id from mob_skills.sql

--	printf("Geocrush PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end