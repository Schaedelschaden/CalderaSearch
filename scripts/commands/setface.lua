---------------------------------------------------------------------------------------------------
-- func: !setface {modelID}
-- desc: Sets player's face model to the ID provided.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 0,
    parameters = "i"
}

local faceOptionsDefault =
{
    [ 0] = "Face 1 Hair A",
    [ 1] = "Face 1 Hair B",
    [ 2] = "Face 2 Hair A",
    [ 3] = "Face 2 Hair B",
    [ 4] = "Face 3 Hair A",
    [ 5] = "Face 3 Hair B",
    [ 6] = "Face 4 Hair A",
    [ 7] = "Face 4 Hair B",
    [ 8] = "Face 5 Hair A",
    [ 9] = "Face 5 Hair B",
    [10] = "Face 6 Hair A",
    [11] = "Face 6 Hair B",
    [12] = "Face 7 Hair A",
    [13] = "Face 7 Hair B",
    [14] = "Face 8 Hair A",
    [15] = "Face 8 Hair B",
    [16] = "Face 1 Hair A",
    [17] = "Face 1 Hair B",
    [18] = "Face 2 Hair A",
    [19] = "Face 2 Hair B",
    [20] = "Face 3 Hair A",
    [21] = "Face 3 Hair B",
    [22] = "Face 4 Hair A",
    [23] = "Face 4 Hair B",
}

local faceOptionsSpecial =
{
    [tpz.race.HUME_M] =
    {
        [24] = "Face 5 Hair A",
        [25] = "Special 1",
        [26] = "Special 2",
        [27] = "Fomor A",
        [28] = "Face 7 Hair A",
        [29] = "Fomor B",
        [30] = "Mannequin",
        [31] = "Face 8 Hair B",
    },
    [tpz.race.HUME_F] =
    {
        [24] = "Face 5 Hair A",
        [25] = "Special 1",
        [26] = "Special 2",
        [27] = "Special 3",
        [28] = "Special 4",
        [29] = "Fomor A",
        [30] = "Mannequin",
        [31] = "Special 5",
    },
    [tpz.race.ELVAAN_M] =
    {
        [24] = "Face 5 Hair A",
        [25] = "Face 5 Hair B",
        [26] = "Special 1",
        [27] = "Fomor A",
        [28] = "Fomor B",
        [29] = "Fomor C",
        [30] = "Mannequin",
        [31] = "Special 2",
    },
    [tpz.race.ELVAAN_F] =
    {
        [24] = "Face 5 Hair A",
        [25] = "Face 5 Hair B",
        [26] = "Special 1",
        [27] = "Special 2",
        [28] = "Special 3",
        [29] = "Fomor A",
        [30] = "Mannequin",
        [31] = "Special 4",
    },
    [tpz.race.TARU_M] =
    {
        [24] = "Special 1",
        [25] = "Special 2",
        [26] = "Special 3",
        [27] = "Special 4",
        [28] = "Face 7 Hair A",
        [29] = "Fomor A",
        [30] = "Mannequin",
        [31] = "Special 5",
    },
    [tpz.race.TARU_F] =
    {
        [24] = "Face 5 Hair A",
        [25] = "Face 5 Hair B",
        [26] = "Face 6 Hair A",
        [27] = "Special 1",
        [28] = "Special 2",
        [29] = "Special 3",
        [30] = "Mannequin",
        [31] = "Special 4",
    },
    [tpz.race.MITHRA] =
    {
        [24] = "Face 5 Hair A",
        [25] = "Special 1",
        [26] = "Special 2",
        [27] = "Face 5 Hair A",
        [28] = "Face 7 Hair A",
        [29] = "Fomor A",
        [30] = "Mannequin",
        [31] = "Special 3",
    },
    [tpz.race.GALKA] =
    {
        [24] = "Face 5 Hair A",
        [25] = "Special 1",
        [26] = "Face 6 Hair A",
        [27] = "Fomor A",
        [28] = "Face 7 Hair A",
        [29] = "Fomor B",
        [30] = "Mannequin",
        [31] = "Face 8 Hair B",
    },
}

function onTrigger(player, modelID)
    local zoneID   = player:getZoneID()
    local idString = ""

    if zoneID ~= 284 then -- Celennia Memorial Library
        player:PrintToPlayer(string.format("You must be in the library to use this command."),tpz.msg.channel.NS_LINKSHELL3)

        return
    end

    if modelID == nil or modelID > 31 then
        player:PrintToPlayer(string.format("!setface {modelID}"),tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("You must specify a model ID from the following ranges"),tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("'Normal' faces: 0-24  'Special' faces: 25-31"),tpz.msg.channel.NS_LINKSHELL3)

        return
    end

    if modelID > 23 then
        idString = faceOptionsSpecial[player:getRace()][modelID]
    elseif modelID <= 23 then
        idString = faceOptionsDefault[modelID]
    end

    player:setFace(modelID)
    player:PrintToPlayer(string.format("Set %s's face model to %s (ID: %i).", player:getName(), idString, modelID),tpz.msg.channel.NS_LINKSHELL3)
    player:PrintToPlayer(string.format("Zoning in 3 seconds to apply change."),tpz.msg.channel.NS_LINKSHELL3)

    player:timer(3000, function(playerArg)
        playerArg:setPos(playerArg:getXPos(), playerArg:getYPos(), playerArg:getZPos(), playerArg:getRotPos(), playerArg:getZoneID())
    end)
end
