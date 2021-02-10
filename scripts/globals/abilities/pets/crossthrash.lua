---------------------------------------------
--  Crossthrash
--
--  Description: Deals physical damage to all enemies in a fan-shaped area in front of pet. Additional Effect: Dispel. Damage varies with TP.
--  Type: Physical (Slashing)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(2033)
    return 0
end

function onPetAbility(target, pet, skill)

end