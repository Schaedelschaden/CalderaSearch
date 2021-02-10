---------------------------------------------------
--  Pentapeck
--  Family: Tulfaire
--  Description: Deals physical damage. Duration of effect varies with TP.
--  Additional effects: Amnesia.
--  Type: Physical
--  Range: Single
--  Notes:
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(3064)
    return 0
end

function onPetAbility(target, pet, skill)

end