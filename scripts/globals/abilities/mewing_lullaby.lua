---------------------------------------------
-- Ability: Mewing Lullaby (Player Ability)
-- Puts enemies in area of effect to sleep and lowers their TP.
-- Obtained: Summoner (Cait Sith) Level 25
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Mewing Lullaby PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 2449 -- mob_skill_id from mob_skills.sql

--	printf("Mewing Lullaby PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end