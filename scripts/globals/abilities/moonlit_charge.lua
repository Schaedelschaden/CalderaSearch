---------------------------------------------
-- Ability: Moonlit Charge (Player Ability)
-- Blinds target. 
-- Obtained: Summoner (Fenrir) Level 5
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Moonlit Charge PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 831 -- mob_skill_id from mob_skills.sql

--	printf("Moonlit Charge PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end