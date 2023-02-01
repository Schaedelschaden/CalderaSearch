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
        player:PrintToPlayer(string.format("==> Teleport to Maze of Shakhrami <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 10 - 20"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Grounds Tome: Page 1."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: Any goblins x3, Stink Bats x2."),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 198 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            player:setPos(-339.6932, -11.7838, -172.9711, 194, 198) -- Maze of Shakhrami
        end)
    end

    if level >= 20 and level < 50 then
        player:PrintToPlayer(string.format("==> Teleport to Gusgen Mines <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 20 - 50"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Grounds Tome: Page 1."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: Any skeleton x6."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("New gear becomes available from Andreine in the library at level 31."),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 196 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            player:setPos(60.0646, -67.8750, -279.5109, 190, 196) -- Gusgen Mines
        end)
    end

    if level >= 50 and level < 65 then
        player:PrintToPlayer(string.format("==> Teleport to Bostaunieux Oubliette Tunnels <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 50 - 65"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Grounds Tome: Page 2."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: Funnel Bats x4, Werebats x2."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("New gear becomes available from Andreine in the library at level 61."),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 167 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            player:setPos(-25.9714, 0.0618, 25.3862, 128, 167) -- Bostaunieux Oubliette
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

    if level >= 75 and level < 90 then
        player:PrintToPlayer(string.format("==> Teleport to Promyvion-Holla <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 75 - 90"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: Floor 1 - All enemies; avoid Apex mobs."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("New gear becomes available from Andreine in the library at level 76."),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 16 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            player:setPos(95.7034, 0.0839, 80.0649, 127, 16) -- Promyvion Holla
        end)
    end

    if level >= 90 and level < 99 then
        player:PrintToPlayer(string.format("==> Teleport to Promyvion-Dem <=="),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Level Range: 90 - 99"),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Targets: Floor 2 - All enemies."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("Note: Avoid Apex mobs. They are level 140 and are hungry."),tpz.msg.channel.SYSTEM_3)
        player:PrintToPlayer(string.format("New gear becomes available from Andreine in the library at level 99."),tpz.msg.channel.SYSTEM_3)

        if player:getZoneID() ~= 18 then
            player:injectActionPacket(4, 122) -- teleport animation
        end

        player:timer(5000, function(player)
            player:setPos(-180.3139, 0.0000, -45.9569, 29, 18) -- Promyvion Dem
        end)
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
