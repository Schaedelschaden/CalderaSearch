---------------------------------------------------
-- Name: Somersault
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee
-- Single Target Attack
-- Notes: not known if multiplier based on TP
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(318)
    return 0
end

function onPetAbility(target, pet, skill)

end