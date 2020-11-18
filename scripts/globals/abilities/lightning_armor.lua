---------------------------------------------
-- Ability: Lightning Armor (Player Ability)
-- Gives party members within area of effect the effect of "Shock Spikes."
-- Obtained: Summoner (Ramuh) Level 42
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Lightning Armor PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 889 -- mob_skill_id from mob_skills.sql

--	printf("Lightning Armor PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end