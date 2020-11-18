--------------------------------------------------------------
-- func: !regen
-- auth: Schaedel
-- desc: Adds 3 regen and 3 refresh if the player is under level 99.
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player)
	mainLvl = player:getMainLvl();
	
	if RegenCommand == true then
		player:delStatusEffect(tpz.effect.SIGNET);
		player:delStatusEffect(tpz.effect.REGEN);
		player:delStatusEffect(tpz.effect.REFRESH);
	end
	
	if mainLvl <= 98 then
		player:injectActionPacket(6,254)
		player:addStatusEffect(tpz.effect.SIGNET,1,0,28800); --Adds Signet, normal strength, 0 not sure, 28,800 seconds (8 hours)
		player:addStatusEffect(tpz.effect.REGEN,3,0,28800); -- Adds Regen, 3 per tick, 0 not sure, 28,800 seconds
		player:addStatusEffect(tpz.effect.REFRESH,3,0,28800); -- Adds Refresh, 3 per tick, 0 not sure, 28,800 seconds
		RegenCommand = true;
	end
end