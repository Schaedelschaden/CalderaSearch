---------------------------------------------
--  Sudden Lunge
--
--  Additional effect: Stun. Damage varies with TP.
--  Type: Physical (Slashing)
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(2178)
    return 0
end

function onPetAbility(target, pet, skill)

end