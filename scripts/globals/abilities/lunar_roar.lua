---------------------------------------------
-- Ability: Lunar Roar (Player Ability)
-- Removes two beneficial magic effects from enemies within area of effect. 
-- Obtained: Summoner (Fenrir) Level 32
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Lunar Roar PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 835 -- mob_skill_id from mob_skills.sql

--	printf("Lunar Roar PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end