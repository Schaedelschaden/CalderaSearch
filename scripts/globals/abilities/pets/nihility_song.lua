---------------------------------------------
-- Nihility Song
-- Family: Hippogryph
-- Description: A song dispels a positive effect in an area of effect, including food.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Radial 12.5'
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(578)
    return 0
end

function onPetAbility(target, pet, skill)

end