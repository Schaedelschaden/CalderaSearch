---------------------------------------------
-- Ability: Soothing Current (Player Ability)
-- Increases potency of cure effects received for party members within area of effect.
-- Obtained: Summoner (Leviathan) Level 99
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Soothing Current PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3982 -- mob_skill_id from mob_skills.sql

--	printf("Soothing Current PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end