---------------------------------------------
-- Ability: Somnolence (Player Ability)
-- Weighs target down.
-- Obtained: Summoner (Diabolos) Level 20
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Somnolence PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 1904 -- mob_skill_id from mob_skills.sql

--	printf("Somnolence PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end