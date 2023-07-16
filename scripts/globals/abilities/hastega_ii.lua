---------------------------------------------
-- Ability: Hastega II (Player Ability)
-- Gives party members within area of effect the effect of "Haste."
-- Obtained: Summoner (Garuda) Level 99
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Hastega II PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	-- local bloodpact = 3993 -- mob_skill_id from mob_skills.sql

-- --	printf("Hastega II PLAYER onUseAbility\n")
	-- pet:useMobAbility(bloodpact, target)
    pet:useJobAbility(602, pet)
    printf("hastega_ii.lua onUseAbility  USER: [%s]", player:getName())
end
