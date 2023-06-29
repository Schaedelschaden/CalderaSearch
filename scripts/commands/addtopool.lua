---------------------------------------------------------------------------------------------------
-- func: addtreasure <playerName>
-- desc: Adds an item directly to the treasure pool.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addtreasure {player}")
end

function onTrigger(player, target)
    local item =
    {
        {
            {itemid =  9270, droprate = 1000}, -- Abdhaljs Metal
        },
        {
            {itemid =  9270, droprate = 1000}, -- Abdhaljs Metal
        },
        {
            {itemid =  9270, droprate = 1000}, -- Abdhaljs Metal
        },
        {
            {itemid = 26207, droprate =  125}, -- Inyanga Ring
            {itemid = 26205, droprate =  125}, -- Meghanada Ring
            {itemid = 26210, droprate =  125}, -- Tali'ah Ring
            {itemid =     0, droprate =  625}, -- Nothing
        },
        {
            {itemid =   790, droprate =  150}, -- Abdhaljs Nugget
            {itemid =   793, droprate =  150}, -- Abdhaljs Gem
            {itemid =   811, droprate =  150}, -- Abdhaljs Anima
            {itemid =     0, droprate =  550}, -- Nothing
        },
        {
            {itemid =     0, droprate =  300}, -- nothing
            {itemid =  3684, droprate =   50}, -- Princess Board
            {itemid =  3685, droprate =   25}, -- Empress Board
            {itemid =  3690, droprate =  300}, -- Fight Board
            {itemid =  3686, droprate =  125}, -- Duelist Board
            {itemid =  3691, droprate =  100}, -- Guardian Board
            {itemid =  3689, droprate =  100}, -- Wizardess Board
        },
    }

    local drop =
    {
        item[ 1][math.random(#item[ 1])].itemid,
        item[ 2][math.random(#item[ 2])].itemid,
        item[ 3][math.random(#item[ 3])].itemid,
        item[ 4][math.random(#item[ 4])].itemid,
        item[ 5][math.random(#item[ 5])].itemid,
        item[ 6][math.random(#item[ 6])].itemid,
        item[ 7][math.random(#item[ 7])].itemid,
        item[ 8][math.random(#item[ 8])].itemid,
        item[ 9][math.random(#item[ 9])].itemid,
        item[10][math.random(#item[10])].itemid,
    }

    -- printf("addtopool.lua onTrigger  ITEM ID 1: [%i]  ITEM ID 2: [%i]  ITEM ID 3: [%i]  ITEM ID 4: [%i]  ITEM ID  5: [%i] ", drop[1], drop[2], drop[3], drop[4], drop[5])
    -- printf("addtopool.lua onTrigger  ITEM ID 6: [%i]  ITEM ID 7: [%i]  ITEM ID 8: [%i]  ITEM ID 9: [%i]  ITEM ID 10: [%i] ", drop[6], drop[7], drop[8], drop[9], drop[10])

	local dropper = GetNPCByID(16801802) -- Armoury Crate

    -- validate target
    local targ
    if (target == nil) then
        targ = player
    else
        targ = GetPlayerByName(target)
        if (targ == nil) then
            player:PrintToPlayer(string.format("Player named '%s' not found!", target))
            return
        end
    end

    -- add treasure to pool
	for i = 1, #drop do
        targ:addTreasure(drop[i], dropper)
	end
end
