---------------------------------------------
-- Ability: Tidal Roar (Player Ability)
-- Lowers attack for enemies within area of effect.
-- Obtained: Summoner (Leviathan) Level 84
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Tidal Roar PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3907 -- mob_skill_id from mob_skills.sql

--	printf("Tidal Roar PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end