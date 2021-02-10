---------------------------------------------
--  Cursed Sphere
--
--  Description: Deals water damage to enemies within area of effect.
--  Type: Magical Water (Element)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(659)
    return 0
end

function onPetAbility(target, pet, skill)

end