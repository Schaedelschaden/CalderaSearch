---------------------------------------------
--  Scythe Tail
--
--  Description: Deals damage to a single target. Additional effect: Knockback
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(380)
    return 0
end

function onPetAbility(target, pet, skill)

end