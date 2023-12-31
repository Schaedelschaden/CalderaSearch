-----------------------------------
-- Ability: Chakra
-- Cures certain status effects and restores a small amount of HP to user.
-- Obtained: Monk Level 35
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/status")
-----------------------------------

local ChakraStatusEffects =
{
    POISON       = 0, -- Removed by default
    BLINDNESS    = 0, -- Removed by default
    PARALYSIS    = 1,
    DISEASE      = 2,
    PLAGUE       = 4
}

function onAbilityCheck(player, target, ability)
	-- Curse II prevents restoring HP
	if (player:hasStatusEffect(20)) then
		return tpz.msg.basic.UNABLE_TO_USE_JA, 0
	else
		return 0, 0
	end
end

function onUseAbility(player, target, ability)
    local chakraRemoval = player:getMod(tpz.mod.CHAKRA_REMOVAL)
    for k, v in pairs(ChakraStatusEffects) do
        if bit.band(chakraRemoval, v) == v then
            player:delStatusEffect(tpz.effect[k])
        end
    end

    local recover = player:getStat(tpz.mod.VIT) * (2 + player:getMod(tpz.mod.CHAKRA_MULT) / 10) -- TODO: Figure out "function of level" addition (August 2017 update)
    player:setHP(player:getHP() + recover)

    local merits = player:getMerit(tpz.merit.INVIGORATE)
    if merits > 0 then
        if player:hasStatusEffect(tpz.effect.REGEN) then
            player:delStatusEffect(tpz.effect.REGEN)
        end
        player:addStatusEffect(tpz.effect.REGEN, 10, 3, merits, 0, 0, 1)
    end
    
    if player:getObjType() == tpz.objType.TRUST then
        player:addStatusEffect(tpz.effect.REGEN, 10, 0, 120)
    end

    return recover
end