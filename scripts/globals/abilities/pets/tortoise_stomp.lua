---------------------------------------------
--  Tortoise Stomp
--
--  Description: Single target Defense Down tpz.effect.
--  Type: Physical
--  Utsusemi/Blink absorb:&nbsp??
--  Range: Varying Area of Effect
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(806)
    return 0
end

function onPetAbility(target, pet, skill)

end