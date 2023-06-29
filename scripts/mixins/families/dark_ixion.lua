require("scripts/globals/mixins")
require("scripts/globals/status")
-----------------------------------

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.dark_ixion = function(mob)
	local zones =
    {
        81, -- East Ronfaure (S)
        82, -- Jugner Forest (S)
        84, -- Batallia Downs (S)
        95, -- West Sarutabaruta (S)
        96, -- Fort Karugo-Narugo (S)
        89, -- Grauberg (S)
        91, -- Rolanberry Fields (S)
    }

	local id =
    {
        17109367,
        17113468,
        17121697,
        17166730,
        17170649,
        17142112,
        17150321,
    }

    mob:addListener("SPAWN", "DARK_IXION_SPAWN", function(mobArg)
        SetServerVariable("Dark_Ixion_Alive", 1)
        mobArg:setBehaviour(bit.bor(mobArg:getBehaviour(), tpz.behavior.NO_TURN))
        mobArg:setMod(tpz.mod.FRONTAL_DMG_REDUCTION, 75)
        mobArg:setMod(tpz.mod.SIDE_DMG_REDUCTION, 25)
        mobArg:setMod(tpz.mod.DMGMAGIC, -25)
        mobArg:setMod(tpz.mod.SILENCERES, 35)
        mobArg:setMod(tpz.mod.FASTCAST, 40)
        mobArg:setMod(tpz.mod.BINDRES, 90)
        mobArg:setMod(tpz.mod.SLOWRES, 35)
        mobArg:setMod(tpz.mod.STUNRES, 85)
        mobArg:setMod(tpz.mod.PETRIFYRES, 50)
        mobArg:setMod(tpz.mod.SILENCERES, 85)
        mobArg:setMod(tpz.mod.SLEEPRES, 85)
        mobArg:setMod(tpz.mod.LULLABYRES, 85)
        mobArg:addMod(tpz.mod.ATT, 1800)
        mobArg:addMod(tpz.mod.MATT, 500)
        mobArg:addMod(tpz.mod.ACC, 1100)
        mobArg:addMod(tpz.mod.MACC, 1100)
        mobArg:addMod(tpz.mod.EVA, 1050)
        mobArg:addMod(tpz.mod.DEF, 1000)
        mobArg:addMod(tpz.mod.MEVA, math.random(930, 1170))
        mobArg:addMod(tpz.mod.MDEF, 300)
        mobArg:setMod(tpz.mod.TRIPLE_ATTACK, 100)
        mobArg:setMod(tpz.mod.REGAIN, 200)
        mobArg:addMod(tpz.mod.CRITHITRATE, 25)
        mobArg:addMod(tpz.mod.CRIT_HIT_EVASION, math.random(15, 25))
    end)

    mob:addListener("DEATH", "DARK_IXION_DEATH", function(mobArg, killer)
		SetServerVariable("Dark_Ixion_Alive", 0)
		mobArg:setRespawnTime(math.random(43200, 86400))
	end)

	mob:addListener("ROAM_TICK", "DARK_IXION_ROAM", function(mobArg)
		local currentTime    = VanadielHour() * 60 + VanadielMinute()
		local currentZone    = mobArg:getZoneID()
		local currentID      = mobArg:getID()
		local DarkIxionAlive = GetServerVariable("Dark_Ixion_Alive")

		if currentTime >= 1430 and DarkIxionAlive == 1 then
			newZone = math.random(1, 7)

			if zones[newZone] ~= currentZone then
				DespawnMob(currentID)
				SpawnMob(id[newZone])
			end
		end
	end)
end

return g_mixins.families.dark_ixion
