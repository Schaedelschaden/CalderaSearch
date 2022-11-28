--------------------------------------------------------------
-- func: !checkfame
-- auth: Schaedel
-- desc: Check the player's fame in all areas.
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
	local fameSandy   = player:getFameLevel(SANDORIA)
    local fameBastok  = player:getFameLevel(BASTOK)
    local fameWindy   = player:getFameLevel(WINDURST)
    local fameJeuno   = player:getFameLevel(JEUNO)
    local fameSelbina = (player:getFameLevel(SANDORIA) + player:getFameLevel(BASTOK)) / 2
    local fameKazham  = player:getFameLevel(KAZHAM)
    local fameRabao   = player:getFameLevel(RABAO)
    local fameNorg    = player:getFameLevel(NORG)
    -- local fameAdoulin = player:getFameLevel(ADOULIN)

    player:PrintToPlayer(string.format("%s's fame levels:", player:getName()),tpz.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("San d'Oria: [%i]  Bastok: [%i]  Windurst: [%i] Jeuno: [%i]", fameSandy, fameBastok, fameWindy, fameJeuno),tpz.msg.channel.SYSTEM_3)
    player:PrintToPlayer(string.format("Selbina: [%i]  Kazham: [%i]  Rabao: [%i]  Norg: [%i]", fameSelbina, fameKazham, fameRabao, fameNorg),tpz.msg.channel.SYSTEM_3)
end
