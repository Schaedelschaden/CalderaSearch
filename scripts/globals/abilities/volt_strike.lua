---------------------------------------------
-- Ability: Volt Strike (Player Ability)
-- Delivers a threefold attack that stuns target.
-- Obtained: Summoner (Ramuh) Level 92
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Volt Strike PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3988 -- mob_skill_id from mob_skills.sql

--	printf("Volt Strike PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end