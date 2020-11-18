---------------------------------------------
-- Ability: Level ? Holy (Player Ability)
-- Rolls a die to determine damage dealt to nearby enemies.
-- Obtained: Summoner (Cait Sith) Level 75
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("LeveL ? Holy PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local rolldie = math.random(1,6)
	local mobLvl = target:getMainLvl()	
	local pet = player:getPet()
	local bloodpact
	
	printf("Level ? Holy PLAYER onUseAbility RANDOM DIE ROLL: [%i]\n", rolldie)
	
	if (rolldie == 6) then
		bloodpact = 2457
	elseif (rolldie == 5) then
		bloodpact = 2456
	elseif (rolldie == 4) then
		bloodpact = 2455
	elseif (rolldie == 3) then
		bloodpact = 2454
	elseif (rolldie == 2) then
		bloodpact = 2453
	elseif (rolldie == 1) then
		bloodpact = 2452 -- mob_skill_id from mob_skills.sql
	end

--	printf("Level ? Holy PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
end