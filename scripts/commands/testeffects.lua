---------------------------------------------------------------------------------------------------
-- func: !testeffects
-- desc: Adds erasable status effects to the given player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")
require("scripts/globals/teleports")


cmdprops =
{
    permission = 1,
    parameters = "s"
}

function onTrigger(player)
	player:addStatusEffect(21, 1, 0, 60) -- Addle
	player:addStatusEffect(12, 1, 0, 60) -- Gravity
	player:addStatusEffect(13, 1, 0, 60) -- Slow
	player:addStatusEffect(134, 1, 3, 60) -- Dia
	player:addStatusEffect(156, 1, 0, 60) -- Flash
	player:addStatusEffect(194, 1, 0, 60) -- Elegy
end