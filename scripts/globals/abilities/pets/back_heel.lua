---------------------------------------------
--  Back Heel
--  Family: Hippogryph
--  Description: Deals damage to a single target.
--  Type: Physical
--  Utsusemi/Blink absorb: One shadow
--  Range: Melee
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(576)
    return 0
end

function onPetAbility(target, pet, skill)

end