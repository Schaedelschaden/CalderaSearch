---------------------------------------------
--  Razor Fang
--
--  Description: Bites a single target in a twofold attack.
--  Type: Physical
--  Utsusemi/Blink absorb: 2 shadows
--  Range: Melee
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(271)
    return 0
end

function onPetAbility(target, pet, skill)

end