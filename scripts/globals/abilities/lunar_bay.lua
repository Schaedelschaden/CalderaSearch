---------------------------------------------
-- Ability: Lunar Bay (Player Ability)
-- Deals darkness damage to an enemy.
-- Obtained: Summoner (Fenrir) Level 78
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Lunar Bay PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3337 -- mob_skill_id from mob_skills.sql

--	printf("Lunar Bay PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end