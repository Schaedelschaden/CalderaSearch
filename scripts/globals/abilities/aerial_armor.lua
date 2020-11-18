---------------------------------------------
-- Ability: Aerial Armor (Player Ability)
-- Gives party members within area of effect the effect of "Blink."
-- Obtained: Summoner (Garuda) Level 25
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Aerial Armor PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 871 -- mob_skill_id from mob_skills.sql

--	printf("Aerial Armor PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end