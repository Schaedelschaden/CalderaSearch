---------------------------------------------------
--  Sensilla Blades
--  Family: Chapuli
--  Description: Deals physical damage to enemies within a fan-shaped area. Damage varies with TP.
--  Type: Physical
--  Range: Conal
--  Notes:
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(2946)
    return 0
end

function onPetAbility(target, pet, skill)

end