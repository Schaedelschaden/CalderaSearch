---------------------------------------------
-- Ability: Raise II (Player Ability)
-- Grants the effects of Raise II to the target.
-- Obtained: Summoner (Cait Sith) Level 15
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
	printf("Raise II PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3994 -- mob_skill_id from mob_skills.sql

--	printf("Raise II PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end