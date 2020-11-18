---------------------------------------------
-- Ability: Shining Ruby (Player Ability)
-- Gives party members within area of effect the effects of "Protect" and "Shell."  
-- Obtained: Summoner (Carbuncle) Level 24
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
--	printf("Shining Ruby PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 908 -- mob_skill_id from mob_skills.sql

--	printf("Shining Ruby PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact)
end