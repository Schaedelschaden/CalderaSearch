-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Amun
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    local tierAby = 2
    local tierMob = 1

    -- Load default T2 stat increases
    tpz.abyssea.updateBaseStats(mob, tierAby, tierMob)

	mob:setMod(tpz.mod.SILENCERES, 100)

	mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mob, skillID)
		if skillID == 440 then -- Catharsis
			mob:setLocalVar("CATHARSIS_TIME", os.time())
		end
    end)
end

function onMobFight(mob, target)
	local allianceList = target:getAlliance()
	local playerName = {}
	local targ

	if os.time() - mob:getLocalVar("CATHARSIS_TIME") <= 30 then
		for i, v in ipairs(allianceList) do
			if v:isPC() then
				playerName[i] = v:getName()
				targ = GetPlayerByName(playerName[i])
				-- Aura has a 15y range
				if mob:checkDistance(v) <= 15 then
					targ:addStatusEffectEx(tpz.effect.POISON, tpz.effect.POISON, 30, 0, 30)
					targ:addStatusEffectEx(tpz.effect.SILENCE, tpz.effect.SILENCE, 1, 0, 30)
					targ:addStatusEffectEx(tpz.effect.AMNESIA, tpz.effect.AMNESIA, 1, 0, 30)
				end
			elseif v:getObjType() == tpz.objType.TRUST then
				-- Aura has a 15y range
				if mob:checkDistance(v) <= 15 then
					v:addStatusEffectEx(tpz.effect.POISON, tpz.effect.POISON, 30, 0, 30)
					v:addStatusEffectEx(tpz.effect.SILENCE, tpz.effect.SILENCE, 1, 0, 30)
					V:addStatusEffectEx(tpz.effect.AMNESIA, tpz.effect.AMNESIA, 1, 0, 30)
				end
			end
		end
	end
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("MOBSKILL_USED")

    tpz.abyssea.kiOnMobDeath(mob, player)
end
