---------------------------------------------------
--  Tegmina Buffet
--  Family: Chapuli
--  Description: Deals physical damage to enemies within range. Damage varies with TP.
--  Additional Effect: Choke (-33 VIT & 15 damage/tic).
--  Type: Physical
--  Range: Radial
--  Notes:
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(2947)
    return 0
end

function onPetAbility(target, pet, skill)

end