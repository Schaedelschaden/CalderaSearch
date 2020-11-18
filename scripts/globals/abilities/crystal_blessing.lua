---------------------------------------------
-- Ability: Crystal Blessing (Player Ability)
-- Confers a TP bonus on party members within area of effect.
-- Obtained: Summoner (Shiva) Level 99
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Crystal Blessing PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3986 -- mob_skill_id from mob_skills.sql

--	printf("Crystal Blessing PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end