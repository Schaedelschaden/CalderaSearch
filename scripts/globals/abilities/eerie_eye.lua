---------------------------------------------
-- Ability: Eerie Eye (Player Ability)
-- Inflicts silence and amnesia on the target.
-- Obtained: Summoner (Cait Sith) Level 55
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Eerie Eye PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 2450 -- mob_skill_id from mob_skills.sql

--	printf("Eerie Eye PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end