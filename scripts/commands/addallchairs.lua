---------------------------------------------------------------------------------------------------
-- func: !addallchairs
-- desc: Adds all key item chairs for use with /sitchair 1-9.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addallchairs {player}")
end

function onTrigger(player, target)
    local ValidChairs =
     {
        2826, -- Imperial Chair
		2827, -- Decorative Chair
		2828, -- Ornate Stool
		2829, -- Refined Chair
		2830, -- Portable Container
		2831, -- Chocobo Chair
		2832, -- Ephramadian Throne
		2833, -- Shadow Throne
		2834, -- Leaf Bench
    }

    -- Validate target
    local targ
    if (target == nil) then
        targ = player
    else
        targ = GetPlayerByName(target)
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target))
            return
        end
    end

    -- Add key items to target
    for i = 1, #ValidChairs do
        targ:addKeyItem(ValidChairs[i])
    end
	targ:PrintToPlayer(string.format("%s now has all chairs. Type /sitchair 1 thru /sitchair 9 to use them.", targ:getName()))
end