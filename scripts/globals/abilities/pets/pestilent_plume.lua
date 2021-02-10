---------------------------------------------------
--  Pestilent Plume
--  Family: Acuex
--  Description: Deals Darkness elemental damage in a fan-shaped area. Damage varies with TP.
--  Additional effects: Plague (-50 TP/tic), Blind (-50 Accuracy), -25 MDB.
--  Type: Magical
--  Range: Conal
--  Notes:
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(2975)
    return 0
end

function onPetAbility(target, pet, skill)

end