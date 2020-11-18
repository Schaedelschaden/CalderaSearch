---------------------------------------------
-- Ability: Heavenward Howl (Player Ability)
-- Grants the effect of HP Drain or MP Drain to party members within area of effect.
-- Obtained: Summoner (Fenrir) Level 96
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
	printf("Heavenward Howl PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 1520 -- mob_skill_id from mob_skills.sql

	printf("Heavenward Howl PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact)
end