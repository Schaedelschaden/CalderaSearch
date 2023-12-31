-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Bestiary
-- !pos -105.905 -2.15 -84.356 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/missions")
-----------------------------------

local rewards =
{
    winter =
    {
        furniture =
        {
            3634, -- Starlight Cake
            140,  -- Dream Platter
            141,  -- Dream Coffer
            155,  -- Dream Stocking
            3619, -- Couronne Des Etoiles
            3620, -- Silberkranz
            3621, -- Leafberry Wreath
            86,   -- Sandorian Tree
            115,  -- Bastokan Tree
            116,  -- Windurstian Tree
            138,  -- Jeunoan Tree
        },
        food =
        {
            5550, -- Roll of Buche Au Chocolat
            5552, -- Serving of Black Pudding
            5542, -- Gateau Aux Fraises
            5620, -- Roast Turkey
            5621, -- Candy ring
            5622, -- Candy Cane
        },
        gear =
        {
            21098, -- Leafkin Bopper +1
            18864, -- Dream Bell +1 (This has a real STAT)
            15179, -- Dream Hat +1
            14520, -- Dream Robe +1
            10383, -- Dream Mittens +1
            11966, -- Dream Trousers +1
            11968, -- Dream Pants +1
            15753, -- Dream Boots +1
            26728, -- Frosty Cap    (costume)
            10875, -- Snowman Cap   (costume)
            11491, -- Snowbunny Hat (costume)
        },
    },
    spring =
    {
        furniture =
        {
            3650, -- Prinseggstarta
            455,  -- Egg Buffet
            454,  -- Egg Lantern
            451,  -- Egg Stool
            452,  -- Egg Table
            453,  -- Egg Locker
            199,  -- Hatchling Egg
            197,  -- Clockwork Egg
            196,  -- Melodious Egg
            179,  -- Jeweled Egg
            119,  -- Flower Egg
            118,  -- Lamp Egg
            117,  -- Wind Egg
        },
        food =
        {
            5294, -- Hume Rice Cake
            5295, -- Elvaan Rice Cake
            5297, -- Mithra Rice Cake
            5296, -- Taru Rice Cake
            5894, -- Prime Marine Stewpot
            5545, -- Prime Crab Stewpot
        },
        gear =
        {
            26965, -- To Moka
            27291, -- Swimming Toggs
            27293, -- Cossie Bottom
            26967, -- Cossie Top
        },
    },
    summer =
    {
        furniture =
        {
            3643, -- carillon-vermeil
            3644, -- aeolsglocke
            3645, -- leafbell
        },
        food =
        {
            6575, -- cheesestk-sand -- DPS
            6579, -- behemoth-sand -- DPS
            6580, -- rustic-fish -- MACC
            6581, -- cornbread -- MAB
        },
        gear =
        {
            15177, -- horror-head-ii
            17588, -- treat-staff-ii
            26708, -- flan-masque-1
            10447, -- pyracmon-cap
            11301, -- eerie-cloak-1
        },
    },
    autumn =
    {
        furniture =
        {
            
        },
        food =
        {
            
        },
        gear =
        {
            
        },
    },
}

function onTrigger(player, target)
    if player:getCharVar("Seasonal_Reward") == 1 then
        local month           = tonumber(os.date("%m"))
        local rewardFurniture = rewards.winter.furniture[math.random(#rewards.winter.furniture)]
        local rewardFood      = rewards.winter.food[math.random(#rewards.winter.food)]
        local rewardGear      = rewards.winter.gear[math.random(#rewards.winter.gear)]

        -- Defaults to Winter
        -- Changes list if real life month is outside of December/January/February
        if month >= 3 and month <= 5 then
            rewardFurniture = rewards.spring.furniture[math.random(#rewards.spring.furniture)]
            rewardFood      = rewards.spring.food[math.random(#rewards.spring.food)]
            rewardGear      = rewards.spring.gear[math.random(#rewards.spring.gear)]
        elseif month >= 6 and month <= 8 then
            rewardFurniture = rewards.summer.furniture[math.random(#rewards.summer.furniture)]
            rewardFood      = rewards.summer.food[math.random(#rewards.summer.food)]
            if (player:getGender() == 1) then -- Male
                rewardGear  = rewards.summer.gear[math.random(1, 2)]
            else 
                rewardGear  = rewards.summer.gear[math.random(3, 4)]
            end
        elseif month >= 9 and month <= 11 then
            rewardFurniture = rewards.autumn.furniture[math.random(#rewards.autumn.furniture)]
            rewardFood      = rewards.autumn.food[math.random(#rewards.autumn.food)]
            rewardGear      = rewards.autumn.gear[math.random(#rewards.autumn.gear)]
        end

        if player:getFreeSlotsCount() == 0 or player:getFreeSlotsCount() < 3 then
            player:PrintToPlayer( string.format("Bestiary: You don't have enough inventory space for all of these rewards!"))

            return 0
        else
            -- printf("Bestiary.lua onTrigger FURNITURE: [%i]  FOOD: [%i]  GEAR: [%i]", rewardFurniture, rewardFood, rewardGear)

            -- Some food items are EX and cannot have multiples held
            -- All food is set to a 4 hour duration as a result
            -- All food will last through death and can only be removed by mob skills or Antacid
            player:addItem(rewardFurniture, 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, rewardFurniture)
            player:addItem(rewardFood, 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, rewardFood)
            player:addItem(rewardGear, 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, rewardGear)

            player:PrintToPlayer(string.format("Bestiary : Congratulations on defeating the seasonal notorious monster!"),tpz.msg.channel.NS_SAY)
            player:PrintToPlayer(string.format("Bestiary : Here's some random rewards for your efforts."),tpz.msg.channel.NS_SAY)

            player:setCharVar("Seasonal_Reward", 0)
        end
    else
        player:PrintToPlayer(string.format("Bestiary : You'll have to defeat the seasonal notorious monster before I can give you anything."),tpz.msg.channel.NS_SAY)
    end
end

function onTrade(player, npc, trade)
end
