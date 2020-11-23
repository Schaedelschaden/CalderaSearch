---------------------------------------------------------------------------------------------------
-- func: addset <job>
-- desc: Adds an item set to the GMs inventory.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

local sets =
{
    WAR = {},
    MNK = {},
    WHM = {},
    BLM = {},
    RDM = {},
    THF = {},
    PLD = {},
    DRK = {},
    BST = {},
    BRD = {},
    RNG = {},
    SAM = {},
    NIN = {},
    DRG = {},
    SMN = {},
    BLU = {15265,14521,14928,15600,15684,12296,15523,15294,16542},
    COR = {},
    PUP = {},
    DNC = {},
    SCH = {},
    GEO = {},
    RUN = {},
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addset <job>")
end

function onTrigger(player, job)
    local ID = zones[player:getZoneID()]
    local jobSelect = string.upper(job)
    local items = {}

    for i = 1, #sets[jobSelect] do
        if not player:hasItem(sets[jobSelect][i]) then
            if player:getFreeSlotsCount() < (#sets[jobSelect] - (i +1)) then
                player:addItem( sets[jobSelect][i], 1)
            else
                error(player, "You need to have at least " ..(#sets[jobSelect] - (i +1)).. " free to recive the remaming items for the selected job!")
            end
        else
            player:PrintToPlayer("You already possess item number: " ..sets[jobSelect][i].. ", skipping this item!", 29)
        end
        if i == #sets[jobSelect] then
            player:PrintToPlayer("You have been given items for " ..jobSelect, 29)
        end
    end
end