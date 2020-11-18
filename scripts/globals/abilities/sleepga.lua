---------------------------------------------
-- Ability: Sleepga (Player Ability)
-- Puts all enemies within area of effect to sleep.
-- Obtained: Summoner (Shiva) Level 39
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Sleepga PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 879 -- mob_skill_id from mob_skills.sql

--	printf("Sleepga PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end