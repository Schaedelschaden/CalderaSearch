---------------------------------------------
-- Ability: Thunder IV (Player Ability)
-- Deals lightning elemental damage.
-- Obtained: Summoner (Ramuh) Level 60
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Thunder IV PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 890 -- mob_skill_id from mob_skills.sql

--	printf("Thunder IV PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end