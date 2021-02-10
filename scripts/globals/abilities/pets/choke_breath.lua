---------------------------------------------
--  Choke Breath
--
--  Deals physical damage to enemies within a fan-shaped area. Additional effect: Paralysis & Silence. Duration of effect varies with TP.
--  Type: Physical
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(1970)
    return 0
end

function onPetAbility(target, pet, skill)

end