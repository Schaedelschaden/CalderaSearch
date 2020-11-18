---------------------------------------------
-- Ability: Meteorite (Player Ability)
-- Delivers light elemental magic damage.   
-- Obtained: Summoner (Carbuncle) Level 55
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
--	printf("Meteorite PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 910 -- mob_skill_id from mob_skills.sql

--	printf("Meteorite PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end