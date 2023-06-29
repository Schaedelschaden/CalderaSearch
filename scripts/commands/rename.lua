---------------------------------------------------------------------------------------------------
-- func: !rename
-- desc: Used to rename mobs and NPC's with custom names
---------------------------------------------------------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/utils")
require("scripts/globals/status")
require("scripts/globals/ability")
require("scripts/globals/magicburst")
require("scripts/globals/magic")
require("scripts/globals/msg")

cmdprops =
{
    permission = 1,
    parameters = "ssssss"
}

function onTrigger(player, str1, str2, str3, str4, str5, str6)
    local target  = player:getCursorTarget()

    if str1 == nil then
        str1 = ""
    end

    if str2 == nil then
        str2 = ""
    end

    if str3 == nil then
        str3 = ""
    end

    if str4 == nil then
        str4 = ""
    end

    if str5 == nil then
        str5 = ""
    end

    if str6 == nil then
        str6 = ""
    end

    local newName = str1 .. " " .. str2 .. " " .. str3 .. " " .. str4 .. " " .. str5 .. " " .. str6

    if target == nil or (target:getObjType() ~= tpz.objType.MOB and target:getObjType() ~= tpz.objType.NPC) then
        player:PrintToPlayer(string.format("You must target a mob or NPC to use that command."),tpz.msg.channel.NS_LINKSHELL3)

        return
    end

    target:renameEntity(newName)
end
