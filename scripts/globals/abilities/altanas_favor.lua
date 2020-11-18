---------------------------------------------
-- Ability: Altana's Favor (Player Ability)
-- Grants the effects of Arise and Reraise III to all targets within area of effect.
-- Obtained: Summoner (Cait Sith) Level 1
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Altana's Favor PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 2448 -- mob_skill_id from mob_skills.sql

--	printf("Altana's Favor PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end