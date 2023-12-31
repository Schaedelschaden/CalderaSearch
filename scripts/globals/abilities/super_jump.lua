-----------------------------------
-- Ability: Super Jump
-- Performs a super jump.
-- Obtained: Dragoon Level 50
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    -- Retail behavior for Fly High is 10 second recasts. Caldera is set to 2 second
	if (player:hasStatusEffect(tpz.effect.FLY_HIGH)) then
		ability:setRecast(utils.clamp(2, 0, 2))
	end
	return 0,0
end

function onUseAbility(player,target,ability)

    -- Reduce 99% of total accumulated enmity
    if target:isMob() then
        target:lowerEnmity(player, 99)
    end

    ability:setMsg(tpz.msg.basic.NONE)

    -- Prevent the player from performing actions while in the air
    player:queue(0, function(player)
        player:stun(5000)
    end)

    -- If the Dragoon's wyvern is out and alive, tell it to use Super Climb
    local wyvern = player:getPet()
    if (wyvern ~= nil and player:getPetID() == tpz.pet.id.WYVERN and wyvern:getHP() > 0) then
        wyvern:useJobAbility(652, wyvern)
    end
end