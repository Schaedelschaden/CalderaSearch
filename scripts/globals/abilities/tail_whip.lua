---------------------------------------------
-- Ability: Tail Whip (Player Ability)
-- Weighs target down.
-- Obtained: Summoner (Leviathan) Level 26
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Tail Whip PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 860 -- mob_skill_id from mob_skills.sql

--	printf("Tail Whip PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end