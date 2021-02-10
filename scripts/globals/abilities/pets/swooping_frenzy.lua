---------------------------------------------------
--  Swooping Frenzy
--  Family: Tulfaire
--  Description: Deals physical damage to enemies within a fan-shaped area. Duration of effect varies with TP.
--  Additional effects: -25% Defense & -25 MDB.
--  Type: Physical
--  Range: Conal
--  Notes:
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	local pet = player:getPet()
	pet:useMobAbility(3065)
    return 0
end

function onPetAbility(target, pet, skill)

end