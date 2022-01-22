---------------------------------------------------
-- Concentric Pulse
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------------

function onAbilityCheck(player, target, ability)
    if not (player:hasPet()) or not (player:getPetID() == tpz.pet.id.LUOPAN) then
        return tpz.msg.basic.REQUIRE_LUOPAN, 0
    end
    return 0,0
end

function onPetAbility(target, pet, skill)
    local dmg = pet:getHP() * 5
    local master = pet:getMaster()
	
	if (master and master:getMod(tpz.mod.AUGMENT_CONCENTRIC_PULSE) > 0) then
		dmg = pet:getMaxHP() * 5
	end
	
    if master then
        target:updateEnmityFromDamage(master, dmg)
    end
	
    target:takeDamage(dmg, pet, tpz.attackType.SPECIAL, tpz.damageType.MAGIC)
    pet:timer(1000, function(mob) mob:setHP(0) end)
	
    return dmg
end