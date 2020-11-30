-----------------------------------
-- Ability: Full Circle
-- Causes your luopan to vanish.
-- Obtained: Geomancer Level 5
-- Recast Time: 10 seconds
-- Refunds some of the MP consumed by the Geocolure spell that created the luopan.
-- Amount of MP restored varies depending on remaining Luopan HP.
-----------------------------------
require("scripts/globals/ability")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if not (player:hasPet()) or not (player:getPetID() == tpz.pet.id.LUOPAN) then
        return tpz.msg.basic.REQUIRE_LUOPAN, 0
    end
    return 0,0
end


function onUseAbility(player, target, ability)
    local luopan        = player:getPet()
    local hpp_remaining = luopan:getHPP()
    local mp_cost       = luopan:getLocalVar("MP_COST")
	local modifier      = 0.5 + (player:getMod(tpz.mod.ENH_FULL_CIRCLE) / 10)
	local fcMerit       = 1 + (player:getMerit(tpz.merit.FULL_CIRCLE_EFFECT) / 100)
	local crMerit       = 1 + (player:getMerit(tpz.merit.CURATIVE_RECANTATION) / 100)
    local mp_returned   = ((modifier * mp_cost) * (hpp_remaining / 100)) * fcMerit
    local hp_returned   = 0

    if crMerit > 0 then
       hp_returned = (mp_returned + (mp_returned * modifier)) * crMerit
    end
	
	player:restoreHP(hp_returned)
    player:restoreMP(mp_returned)
    player:despawnPet()
end