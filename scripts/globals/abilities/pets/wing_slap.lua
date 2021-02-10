---------------------------------------------
--  Wing Slap
--
--  Description: Slaps around a single target four times with its wings. Additional effect: Stun
--  Type: Physical
--  Utsusemi/Blink absorb: 4 shadows
--  Range: Melee
--  Notes:
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(1714)
    return 0
end

function onPetAbility(target, pet, skill)

end