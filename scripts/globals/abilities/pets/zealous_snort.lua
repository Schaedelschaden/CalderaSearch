---------------------------------------------
-- Zealous Snort
-- Family: Raaz
-- Description: +25% Haste, +25 MDB, and increases the likelihood of both countering and
--              guarding for pet and Beastmaster. Duration of effect varies with TP.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self/Master
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0
end

function onPetAbility(target, pet, skill)
end
