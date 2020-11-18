---------------------------------------------
-- Ability: Double Slap (Player Ability)
-- Delivers a twofold attack.
-- Obtained: Summoner (Shiva) Level 50
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Double Slap PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 880 -- mob_skill_id from mob_skills.sql

--	printf("Double Slap PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end