---------------------------------------------
-- Ability: Nether Blast (Player Ability)
-- Delivers a ranged attack that deals darkness elemental damage.
-- Obtained: Summoner (Diabolos) Level 65
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Nether Blast PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 1910 -- mob_skill_id from mob_skills.sql

--	printf("Nether Blast PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end