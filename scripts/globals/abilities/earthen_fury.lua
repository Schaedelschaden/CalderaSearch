---------------------------------------------
-- Ability: Earthen Fury (Player Ability)
-- Required MP: Caster's level x2. Uses all MP and deals earth elemental damage to enemies within area of effect. 
-- Obtained: Summoner (Titan) Level 1
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Earthen Fury PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 857 -- mob_skill_id from mob_skills.sql

--	printf("Earthen Fury PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end