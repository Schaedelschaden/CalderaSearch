---------------------------------------------------------------------------------------------------
-- func: !minigod
-- desc: Toggles mini god mode on the player. (Physical and Magical Immunity, High Regen and Refresh)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    if (player:getCharVar("MiniGodMode") == 0) then
        -- Toggle GodMode on..
        player:setCharVar("MiniGodMode", 1)

        -- Add bonus effects to the player..
        player:addStatusEffect(tpz.effect.PHYSICAL_SHIELD,2,0,0)
        player:addStatusEffect(tpz.effect.MAGIC_SHIELD,2,0,0)
        player:addStatusEffect(tpz.effect.REGAIN,30,0,0)
        player:addStatusEffect(tpz.effect.REFRESH,100,0,0)
        player:addStatusEffect(tpz.effect.REGEN,2000,0,0)
    else
        -- Toggle GodMode off..
        player:setCharVar("MiniGodMode", 0)

        -- Remove bonus effects..
        player:delStatusEffect(tpz.effect.PHYSICAL_SHIELD)
        player:delStatusEffect(tpz.effect.MAGIC_SHIELD)
        player:delStatusEffect(tpz.effect.REGAIN)
        player:delStatusEffect(tpz.effect.REFRESH)
        player:delStatusEffect(tpz.effect.REGEN)
    end
	
	-- local targ = player:getCursorTarget()

    -- if (targ:getCharVar("MiniGodMode") == 0) then
        -- -- Toggle GodMode on..
        -- targ:setCharVar("MiniGodMode", 1)

        -- -- Add bonus effects to the player..
        -- targ:addStatusEffect(tpz.effect.PHYSICAL_SHIELD,2,0,0)
        -- targ:addStatusEffect(tpz.effect.MAGIC_SHIELD,2,0,0)
        -- targ:addStatusEffect(tpz.effect.REGAIN,30,0,0)
        -- targ:addStatusEffect(tpz.effect.REFRESH,100,0,0)
        -- targ:addStatusEffect(tpz.effect.REGEN,2000,0,0)
    -- else
        -- -- Toggle GodMode off..
        -- targ:setCharVar("MiniGodMode", 0)

        -- -- Remove bonus effects..
        -- targ:delStatusEffect(tpz.effect.PHYSICAL_SHIELD)
        -- targ:delStatusEffect(tpz.effect.MAGIC_SHIELD)
        -- targ:delStatusEffect(tpz.effect.REGAIN)
        -- targ:delStatusEffect(tpz.effect.REFRESH)
        -- targ:delStatusEffect(tpz.effect.REGEN)
    -- end
end