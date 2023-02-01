--------------------------------------------------------------
-- func: !regen
-- auth: Schaedel
-- desc: Adds 3 regen and 3 refresh if the player is under level 99.
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
}

function onTrigger(player)
	local mainLvl      = player:getMainLvl()
	local regenCommand = player:getCharVar("RegenCommand")

	if mainLvl <= 98 then
		if regenCommand == 1 then
			player:delStatusEffect(tpz.effect.REGEN)
			player:delStatusEffect(tpz.effect.REFRESH)
            player:delStatusEffect(tpz.effect.REGAIN)
		end

		player:injectActionPacket(6,254)
		player:addStatusEffect(tpz.effect.REGEN, 3, 0, 28800) -- Adds Regen, 3 per tick, 0 tick time, 28,800 seconds
		player:addStatusEffect(tpz.effect.REFRESH, 3, 0, 28800) -- Adds Refresh, 3 per tick, 0 tick time, 28,800 seconds
        player:addStatusEffect(tpz.effect.REGAIN, 1, 0, 28800) -- Adds Regain, 1 per tick, 0 tick time, 28,800 seconds

		if player:hasPet() then
			local pet = player:getPet()

			pet:addStatusEffect(tpz.effect.REGEN, 3, 0, 28800)
			pet:addStatusEffect(tpz.effect.REFRESH, 3, 0, 28800)
            pet:addStatusEffect(tpz.effect.REGAIN, 1, 0, 28800)
		end

		player:setCharVar("RegenCommand", 1)
	end
end
