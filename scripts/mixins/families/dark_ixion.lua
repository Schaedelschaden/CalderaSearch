require("scripts/globals/mixins")
require("scripts/globals/status")
-----------------------------------

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.dark_ixion = function(mob)
	-- East Ronfaure (S), Jugner Forest (S), Batallia Downs (S), West Sarutabaruta (S), Fort Karugo-Narugo (S), Grauberg (S), Rolanberry Fields (S)
	local zones = {81, 82, 84, 95, 96, 89, 91}
	local id = {17109367, 17113468, 17121697, 17166730, 17170649, 17142112, 17150321}

    mob:addListener("DEATH", "DARK_IXION_DEATH", function(mob, killer)
		SetServerVariable("Dark_Ixion_Alive", 0)
		mob:setRespawnTime(math.random(43200, 86400))
	end)

	mob:addListener("ROAM_TICK", "DARK_IXION_ROAM", function(mob)
		local currentTime = VanadielHour() * 60 + VanadielMinute()
		local currentZone = mob:getZoneID()
		local currentID = mob:getID()
		local DarkIxionAlive = GetServerVariable("Dark_Ixion_Alive")

		if (currentTime >= 1430 and DarkIxionAlive == 1) then
			newZone = math.random(1, 7)

			if (zones[newZone] ~= currentZone) then
				DespawnMob(currentID)
				SpawnMob(id[newZone])
			end
		end
	end)
end

return g_mixins.families.dark_ixion
