--------------------------------------------------------------
-- func: !end <player>
-- auth: Schaedel
-- desc: Ends the specified player.
--------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "s"
}

function onTrigger(player, target)
    -- validate target
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
	targ:injectActionPacket(4, 205) -- Flare II
	targ:injectActionPacket(4, 207) -- Freeze II
	targ:injectActionPacket(4, 209) -- Tornado II
	targ:injectActionPacket(4, 211) -- Quake II
	targ:injectActionPacket(4, 213) -- Burst II
	targ:injectActionPacket(4, 215) -- Flood II
    targ:setHP(0)
	targ:setMP(0)
	targ:setAnimation(0)
end