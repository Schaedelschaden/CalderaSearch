--------------------------------------------------------------
-- func: !checkequip
-- auth: Schaedel
-- desc: Check the targeted player's equipment.
--------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!checkequip <t>")
end

function onTrigger(player, target)
	local equipment = {}
	local equipmentName = {}
	local fixedEquipmentName = {}

    -- validate target
    local targ
    if (target == nil) then
        targ = player:getCursorTarget()
        if (targ == nil or not targ:isPC()) then
            error(player,"You must target a player.")
            return
        end
    else
        targ = GetPlayerByName(target)
        if (targ == nil) then
            error(player,"Invalid target.")
            return
        end
    end

    -- Provide gear slot information.
	local Name = targ:getName()
	
	player:PrintToPlayer(string.format("Player: %s", Name),tpz.msg.channel.SYSTEM_3)
	
	for i = 0, 15 do
		equipment[i] = targ:getEquipID(i)
		equipmentName[i] = targ:getGearName(equipment[i])
		fixedEquipmentName[i] = string.gsub(equipmentName[i], "_", " ")
		fixedEquipmentName[i] = fixedEquipmentName[i]:gsub("^%l", string.upper)
	end
	
    player:PrintToPlayer(string.format("MAIN: [%s/%i]  SUB: [%s/%i]  RANGED: [%s/%i]  AMMO: [%s/%i]", fixedEquipmentName[0], equipment[0], fixedEquipmentName[1], equipment[1], fixedEquipmentName[2], equipment[2], fixedEquipmentName[3], equipment[3]),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("HEAD: [%s/%i]  NECK: [%s/%i]  EAR1: [%s/%i]  EAR2: [%s/%i]", fixedEquipmentName[4], equipment[4], fixedEquipmentName[9], equipment[9], fixedEquipmentName[11], equipment[11], fixedEquipmentName[12], equipment[12]),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("BODY: [%s/%i]  HANDS: [%s/%i]  RING1: [%s/%i]  RING2: [%s/%i]", fixedEquipmentName[5], equipment[5], fixedEquipmentName[6], equipment[6], fixedEquipmentName[13], equipment[13], fixedEquipmentName[14], equipment[14]),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("BACK: [%s/%i]  WAIST: [%s/%i]  LEGS: [%s/%i]  FEET: [%s/%i]", fixedEquipmentName[15], equipment[15], fixedEquipmentName[10], equipment[10], fixedEquipmentName[7], equipment[7], fixedEquipmentName[8], equipment[8]),tpz.msg.channel.SYSTEM_3)
end