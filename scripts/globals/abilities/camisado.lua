---------------------------------------------
-- Ability: Camisado (Player Ability)
-- Deals physical damage.
-- Obtained: Summoner (Diabolos) Level 1
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Camisado PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 1903 -- mob_skill_id from mob_skills.sql

--	printf("Camisado PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end