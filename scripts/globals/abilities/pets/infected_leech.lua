---------------------------------------------------
--  Infected Leech
--  Family: Mosquito
--  Description: Absorbs HP from enemies in a fan-shaped area originating from pet. Additional effect duration varies with TP.
--  Additional effects: Plague (-50 TP/tic).
--  Type: Magical
--  Range: Conal
--  Notes:
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(3516)
    return 0
end

function onPetAbility(target, pet, skill)

end