---------------------------------------------
-- Ability: Reraise II (Player Ability)
-- Grants the effects of Reraise II to the targeted party member.
-- Obtained: Summoner (Cait Sith) Level 30
-- Recast Time: 01:00
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)	
--	printf("Reraise II PLAYER onAbilityCheck START\n")
	return 0,0
end

function onUseAbility(player, target, ability)
	local pet = player:getPet()
	local bloodpact = 3995 -- mob_skill_id from mob_skills.sql

--	printf("Regal Scratch PLAYER onUseAbility\n")
	pet:useMobAbility(bloodpact, target)
	-- local pet = player:getPet()
	-- local spell = 141 -- spellid from spell_list.sql

-- --	printf("Reraise II PLAYER onUseAbility\n")
	-- pet:castSpell(spell)
end