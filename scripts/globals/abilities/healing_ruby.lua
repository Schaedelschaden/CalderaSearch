---------------------------------------------
-- Ability: Healing Ruby (Player Ability)
-- Restores target party member's HP.   
-- Obtained: Summoner (Carbuncle) Level 1
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
--	printf("Healing Ruby PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 906 -- mob_skill_id from mob_skills.sql

--	printf("Meteorite PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end