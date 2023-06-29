-----------------------------------
-- func: !camp
-- desc: sends the player a teleport to popular exp camps
-----------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player, target, forceZone)
    local level = player:getMainLvl()

    if level < 10 then
        player:PrintToPlayer(string.format("==> Teleport to West Ronfaure <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 1 - 10"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: All mobs, moving from north to south."),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 100 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            player:setPos(-172.1860, -62.0000, 380.0000, 127.5, 100) -- West Ronfaure
        end)
    end

    if level >= 10 and level < 20 then
        player:PrintToPlayer(string.format("==> Teleport to Valkurm Dunes <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 10 - 20"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Grounds Tome: Page 1."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: Hill Lizards x7, Sand Hare x1."),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 103 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            player:setPos(914.9273, 0.3340, -411.5211, 132, 103) -- Valkurm Dunes
        end)
    end

    if level >= 20 and level < 30 then
        player:PrintToPlayer(string.format("==> Teleport to Qufim Island <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 20 - 30"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Grounds Tome: Page 1."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: Clippers x9 and Land Worm x1."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("New gear becomes available from Andreine in the library at level 31."),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 126 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            player:setPos(-259.2254, -20.0000, 299.1844, 245, 126) -- Qufim Island
        end)
    end

    if level >= 30 and level < 46 then
        player:PrintToPlayer(string.format("==> Teleport to Crawlers Nest <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 30 - 46"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Grounds Tome: Page 1."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: Worker Crawlers x3, Death Jackets x3."),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 197 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            player:setPos(353.7781, -32.1900, -22.5530, 96, 197) -- Crawlers Nest
        end)
    end
    
    if level >= 46 and level < 55 then
        player:PrintToPlayer(string.format("==> Teleport to Crawlers Nest <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 47 - 55"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Grounds Tome: Page 4."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: Exorays x3, Hornflies x2."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("RoE: Enable spoils for Shrooms."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("After setting page, use !expclassic again to move to camp."),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 197 then
            player:injectActionPacket(4, 122) -- teleport animation
        end
        
        if player:getZoneID() ~= 197 then
            player:timer(5000, function(player)
                player:setPos(353.7781, -32.1900, -22.5530, 96, 197) -- Crawlers Nest
            end)
        else
            player:setPos(95.7954, -38.0487, -181.4379, 57)
        end
    end
   
    if level >= 55 and level < 65 then
        player:PrintToPlayer(string.format("==> Teleport to Wajaom Woodlands <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 55 - 65"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("!shop 1 and feed the birds."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: Lesser Colibri."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("RoE: Combat (Region) > Combat (Aht Urhgan) > Conflict: Wajaom Woodlands"),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 51 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            player:setPos(678.3908, -15.5000, 219.7141, 127, 51) -- Wajaom Woodlands
        end)
    end

    if level >= 65 and level < 75 then
        player:PrintToPlayer(string.format("==> Teleport to Bostaunieux Oubliette Basement <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 65 - 75"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Grounds Tome: Page 4."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: Bloodsuckers x9."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("New gear becomes available from Andreine in the library at level 76."),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 167 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            if player:getZone() == 167 then
                player:setPos(-157.9340, 15.9979, -219.6098, 0) -- Bostaunieux Oubliette, no zone, don't wipe the page progress
            else
                player:setPos(-157.9340, 15.9979, -219.6098, 0, 167) -- Bostaunieux Oubliette, zone
            end
        end)
    end

    if level >= 75 and level < 80 then
        player:PrintToPlayer(string.format("==> Teleport to Misereaux Coast <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 75 - 80"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: Seaboard Vultures."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("New gear becomes available from Andreine in the library at level 76."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("RoE: Combat (Region) > Combat (Promathia 1) > Conflict: Misareaux Coast"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("You can use !cap and grind here as long as you like."),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 25 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            player:setPos(-44.1243, -32.3265, 275.1143, 222, 25) -- Misereaux Coast
        end)
    end
    
    if level >= 80 and level < 85 then
        player:PrintToPlayer(string.format("==> Teleport to Gusgen Mines <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 80 - 85"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: Rockmill."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("RoE: Conflict: Gusgen Mines"),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 196 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            player:setPos(-40.8082, -39.8750, 19.9814, 128, 196) -- Gusgen Mines
        end)
    end

    if level >= 85 and level < 92 then
        if player:getZoneID() ~= 191 then
            player:PrintToPlayer(string.format("==> Teleport to Dangurf Wadi <=="),tpz.msg.channel.SYSTEM_3)
            player:PrintToPlayer(string.format("Level Range: 85 - 92"),tpz.msg.channel.SYSTEM_3)
            player:PrintToPlayer(string.format("Targets: Trimmers and Natty Gibbons."),tpz.msg.channel.SYSTEM_3)
            player:PrintToPlayer(string.format("Note: Once you have Ground Tome page 8 set use !expclassic again to move to camp."),tpz.msg.channel.SYSTEM_3)
        end
        
        if player:getZoneID() ~= 191 then
            player:injectActionPacket(4, 122) -- teleport animation
        end
        
        if player:getZoneID() ~= 191 then
            player:timer(5000, function(player)
                player:setPos(-18.1567, -0.1318, 2.2656, 134, 191) -- Dangurf Wadi
            end)
        else
            player:setPos(-162.1538, 0.0000, 581.2722, 136)
        end
    end
    
    if level >= 92 and level < 98 then
        if player:getZoneID() ~= 212 then
            player:PrintToPlayer(string.format("==> Teleport to Gustav Tunnel <=="),tpz.msg.channel.SYSTEM_3)
            player:PrintToPlayer(string.format("Level Range: 92 - 99"),tpz.msg.channel.SYSTEM_3)
            player:PrintToPlayer(string.format("Targets: Boulder Eater and Pygmytoise."),tpz.msg.channel.SYSTEM_3)
            player:PrintToPlayer(string.format("Note: Once you have Ground Tome page 8 set use !expclassic again to move to camp."),tpz.msg.channel.SYSTEM_3)
        end
        
        if player:getZoneID() ~= 212 then
            player:injectActionPacket(4, 122) -- teleport animation
        end
        
        if player:getZoneID() ~= 212 then
            player:timer(5000, function(player)
                player:setPos(302.5057, -39.7147, 61.6474, 31, 212) -- Gustav Tunnel
            end)
        else
            player:setPos(-10.1684, -9.0174, 140.4128, 254)
        end
    end

    if level > 98 then
        player:PrintToPlayer(string.format("==> Teleport to Promyvion-Vahzl <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 99+/Merits"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: All enemies."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Note: Avoid Apex mobs. They are level 140 and are hungry."),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 22 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            player:setPos(-14.7440, 0.0369, -119.7360, 1, 22) -- Promyvion Vahzl
        end)
    end
end
