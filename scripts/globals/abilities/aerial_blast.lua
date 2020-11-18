---------------------------------------------
-- Ability: Aerial Blast (Player Ability)
-- Required MP: Caster's level x2. Uses all MP and deals wind elemental damage to enemies within area of effect. 
-- Obtained: Summoner (Garuda) Level 1
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Aerial Blast PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 875 -- mob_skill_id from mob_skills.sql

--	printf("Aerial Blast PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end