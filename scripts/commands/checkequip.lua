--------------------------------------------------------------
-- func: !checkequip
-- auth: Schaedel
-- desc: Check the targeted player's equipment.
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!checkequip <t>")
end

function onTrigger(player, target)
	local equipment = {}

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
	end
	
    player:PrintToPlayer(string.format("MAIN: [%i]     SUB: [%i]       RANGED: [%i]     AMMO: [%i]", equipment[0], equipment[1], equipment[2], equipment[3]),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("HEAD: [%i]     NECK: [%i]      EAR1: [%i]       EAR2: [%i]", equipment[4], equipment[9], equipment[11], equipment[12]),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("BODY: [%i]     HANDS: [%i]     RING1: [%i]      RING2: [%i]", equipment[5], equipment[6], equipment[13], equipment[14]),tpz.msg.channel.SYSTEM_3)
	player:PrintToPlayer(string.format("BACK: [%i]     WAIST: [%i]     LEGS: [%i]       FEET: [%i]", equipment[15], equipment[10], equipment[7], equipment[8]),tpz.msg.channel.SYSTEM_3)
end