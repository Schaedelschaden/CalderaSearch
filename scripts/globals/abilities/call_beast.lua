-----------------------------------
-- Ability: Call Beast
-- Calls a beast to fight by your side.
-- Obtained: Beastmaster Level 23
-- Recast Time: 5:00
-- Duration: Dependent on jug pet used.
-----------------------------------
require("scripts/globals/common")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	if player:hasStatusEffect(tpz.effect.UNLEASH) then
        ability:setRecast(0)
	elseif (player:getMod(tpz.mod.CALL_BEAST_RECAST) > 0) then
		ability:setRecast(ability:getRecast() - player:getMod(tpz.mod.CALL_BEAST_RECAST))
	end

    if player:getPet() ~= nil then
        return tpz.msg.basic.ALREADY_HAS_A_PET,0
    elseif not player:hasValidJugPetItem() then
        return tpz.msg.basic.NO_JUG_PET_ITEM,0
    elseif not player:canUseMisc(tpz.zoneMisc.PET) then
        return tpz.msg.basic.CANT_BE_USED_IN_AREA,0
    else
        return 0,0
    end
end

function onUseAbility(player, target, ability)
    tpz.pet.spawnPet(player, player:getWeaponSubSkillType(tpz.slot.AMMO))
    player:removeAmmo()
end