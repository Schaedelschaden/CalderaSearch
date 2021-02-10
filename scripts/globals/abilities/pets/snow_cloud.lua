---------------------------------------------------
-- Snow Cloud
-- Deals Ice damage to targets in a fan-shaped area of effect. Additional effect: Paralyze
-- Range: 10' cone
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
	printf("snow_cloud.lua onMobSkillCheck")
	local pet = player:getPet()
	pet:useMobAbility(661)
    return 0
end

function onPetAbility(target, pet, skill)

end