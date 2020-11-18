---------------------------------------------
-- Ability: Impact (Player Ability)
-- Deals dark damage that lowers an enemy’s strength, dexterity, vitality, agility, intelligence, mind, and charisma.
-- Obtained: Summoner (Fenrir) Level 99
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Impact PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3552 -- mob_skill_id from mob_skills.sql

--	printf("Impact PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end