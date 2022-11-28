-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Myrmecoleon
-----------------------------------
mixins = {require("scripts/mixins/families/antlion_ambush")}
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ALWAYS_AGGRO, 1)
	mob:setMod(tpz.mod.SLOWRES, 100)
	mob:setMod(tpz.mod.PARALYZERES, 100)

	mob:addListener("WEAPONSKILL_STATE_EXIT", "SANDPIT_USED", function(mob, skillID)
		local targets       = mob:getEnmityList()
		local assistTargets = {}
		local NM            = mob:getID()
        local pos           = mob:getPos()
		local ambusAntlion
		
		if (skillID == 276) then
			for i, v in pairs(targets) do
				assistTargets[i] = GetPlayerByName(v.entity:getName())
			end

			for i = 1, 5 do
				ambusAntlion = GetMobByID(NM + i)

				if not (ambusAntlion:isSpawned()) then
					SpawnMob(NM + i)

					if (ambusAntlion:getID() == NM + 1) then
						ambusAntlion:setPos(pos.x - 5, pos.y, pos.z - 5)
					elseif (ambusAntlion:getID() == NM + 2) then
						ambusAntlion:setPos(pos.x - 5, pos.y, pos.z - 1)
					elseif (ambusAntlion:getID() == NM + 3) then
						ambusAntlion:setPos(pos.x, pos.y, pos.z + 5)
					elseif (ambusAntlion:getID() == NM + 4) then
						ambusAntlion:setPos(pos.x + 5, pos.y, pos.z + 1)
					elseif (ambusAntlion:getID() == NM + 5) then
						ambusAntlion:setPos(pos.x + 5, pos.y, pos.z - 5)
					end

					ambusAntlion:updateEnmity(assistTargets[math.random(#assistTargets)])
				end
			end
		end
    end)
end

function onMobFight(mob)
	-- mob:AnimationSub(1)
    -- mob:hideName(false)
    -- mob:untargetable(false)
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("SANDPIT_USED")
end