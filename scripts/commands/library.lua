---------------------------------------------------------------------------------------------------
-- func: !library
-- desc: Teleports the player to the Celennia Memorial Library.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
	local zoneId = player:getZoneID()

	-- if (zoneId == 255 or zoneId == 146 or zoneId == 6 or zoneId == 8 or zoneId == 207 or zoneId == 203 or zoneId == 201 or zoneId == 202 or zoneId == 211 or
		-- zoneId == 209 or zoneId == 36 or zoneId == 170 or zoneId == 139 or zoneId == 180 or zoneId == 31 or zoneId == 206 or zoneId == 277 or zoneId == 163 or
		-- zoneId == 32 or zoneId == 179 or zoneId == 10 or zoneId == 165 or zoneId == 156 or zoneId == 144) then
		-- player:PrintToPlayer(string.format("That command cannot be used in this zone. Please exit the area and try again."),tpz.msg.channel.SYSTEM_3)
		-- return
	-- else
    local pos = {posX = -105, posY = -2, posZ = -95, rot = 224, zone = 284}

    switch (player:getName()): caseof
    {
        ["Khalum"] = function()
            pos = {posX = -108.986, posY = -2.15, posZ = -99.021, rot = 225, zone = 284}
        end,
        ["Naria"] = function()
            pos = {posX = -108.986, posY = -2.15, posZ = -99.021, rot = 225, zone = 284}
        end,
        ["Dreamstate"] = function()
            pos = {posX = -92.521, posY = -9.280, posZ = -94.986, rot = 130, zone = 284}
        end,
        ["Chewy"] = function()
            pos = {posX = -105.064, posY = -9.280, posZ = -107.571, rot = 198, zone = 284}
        end,
        ["Invigilator"] = function()
            pos = {posX = -117.536, posY = -9.280, posZ = -95.000, rot = 5, zone = 284}
        end,
        ["Tierkaintwo"] = function()
            pos = {posX = -105.042, posY = -9.280, posZ = -82.323, rot = 65, zone = 284}
        end,
    }

    player:setPos(pos.posX, pos.posY, pos.posZ, pos.rot, pos.zone)
	-- end
end
