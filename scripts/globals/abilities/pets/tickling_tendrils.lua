---------------------------------------------------
-- Tickling Tendrils
-- Delivers a fivefold attack. Additional effect: Stun. Damage varies with TP. 
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(3097)
    return 0
end

function onPetAbility(target, pet, skill)

end