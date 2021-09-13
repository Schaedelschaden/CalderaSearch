---------------------------------------------
-- Ability: Healing Ruby II (Player Ability)
-- Restores HP for party members within area of effect.
-- Obtained: Summoner (Carbuncle) Level 65
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Healing Ruby II PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 911 -- mob_skill_id from mob_skills.sql

--	printf("Healing Ruby II PLAYER onUseAbility\n")

	-- Curse II prevents restoring HP
	if not (target:hasStatusEffect(20)) then
		pet:useMobAbility(bloodpact, target)
	else
		return tpz.msg.basic.UNABLE_TO_USE_JA, 0
	end
end