---------------------------------------------
-- Ability: Holy Mist (Player Ability)
-- Deals light elemental damage to an enemy. 
-- Obtained: Summoner (Carbuncle) Level 76
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
---------------------------------------------

function onAbilityCheck(player, target, ability)
--	printf("Holy Mist PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3553 -- mob_skill_id from mob_skills.sql

--	printf("Holy Mist PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end