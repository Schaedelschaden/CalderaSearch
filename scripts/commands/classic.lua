---------------------------------------------------------------------------------------------------
-- func: !classicmode
-- desc: Toggles the ClassicMode char var on/off and disallows the server 3.5x EXP bonus for the char
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    if player:getCharVar("ClassicMode") == 0 then
        player:setCharVar("ClassicMode", 1)
        player:PrintToPlayer(string.format("Classic Mode: [ON]"))
        player:PrintToPlayer(string.format("NOTE: You will receive normal EXP (server bonus does NOT apply)"))
    else
        player:setCharVar("ClassicMode", 0)
        player:PrintToPlayer(string.format("Classic Mode: [OFF]"))
        player:PrintToPlayer(string.format("NOTE: You will now receive enhanced EXP (server bonus applies)"))
    end
end
