---------------------------------------------
-- Ability: Glittering Ruby (Player Ability)
-- Randomly enhances one attribute for party members within area of effect. 
-- Obtained: Summoner (Carbuncle) Level 44
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
--	printf("Glittering Ruby PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 909 -- mob_skill_id from mob_skills.sql

--	printf("Glittering Ruby PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact)
end