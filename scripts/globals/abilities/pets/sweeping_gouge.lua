---------------------------------------------
--  Sweeping Gouge
--
--  Description: Delivers a twofold attack to enemies within a fan-shaped area. Additional effect: -25% Defense for 60 Sec. Damage varies with TP.
--  Type: Physical (Blunt)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(3131)
    return 0
end

function onPetAbility(target, pet, skill)

end