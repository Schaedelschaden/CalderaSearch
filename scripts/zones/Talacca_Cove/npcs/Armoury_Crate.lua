-----------------------------------
-- Area: Talacca Cove
-- NPC:  Armoury Crate
-- Talacca Cove ISNM Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/titles")
require("scripts/globals/quests")
-----------------------------------
local loot =
{
    -- ISNM: Call to Arms
    [1088] =
    {
        {
            {itemid = 25667, droprate =  200}, -- Jhakri
            {itemid = 25753, droprate =  200}, -- 
            {itemid = 25808, droprate =  200}, -- 
            {itemid = 25867, droprate =  200}, --
            {itemid = 25933, droprate =  200}, --
        },
        {
            {itemid =   790, droprate =   50}, -- garnet
            {itemid =   793, droprate =   50}, -- black_pearl
            {itemid =   811, droprate =   50}, -- ametrine
            {itemid =   797, droprate =   50}, -- painite
            {itemid =   792, droprate =   50}, -- pearl
            {itemid =   699, droprate =  100}, -- oak_log
            {itemid =   808, droprate =  100}, -- goshenite
            {itemid =   815, droprate =  100}, -- sphene
            {itemid =   701, droprate =  100}, -- rosewood_log
            {itemid =   798, droprate =  100}, -- turquoise
            {itemid =   794, droprate =  100}, -- sapphire
            {itemid =   788, droprate =  150}, -- peridot
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
    },
    -- ISNM: Compliments to the Chef
    [1089] =
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
            {itemid = 26209, droprate =  125}, -- Ayanmo Ring
            {itemid = 26211, droprate =  125}, -- Flamma Ring
            {itemid = 26206, droprate =  125}, -- Hizamaru Ring
            {itemid = 26204, droprate =  125}, -- Sulevia's Ring
            {itemid =     0, droprate =  500}, -- Nothing
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
    },
}
function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local battlefield = player:getBattlefield()
    if battlefield then
        tpz.battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
