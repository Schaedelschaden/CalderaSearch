-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Amun
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.SILENCERES, 100)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, math.random(150, 200))
    mob:addMod(tpz.mod.ATT, math.random(250, 350))
    mob:addMod(tpz.mod.MATT, 200)
	mob:addMod(tpz.mod.EVA, math.random(150, 200))
	mob:addMod(tpz.mod.DEF, math.random(350, 500))
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.STR, 115)
    mob:addMod(tpz.mod.DEX, 115)
    mob:addMod(tpz.mod.AGI, 115)
    mob:addMod(tpz.mod.VIT, 115)
    mob:addMod(tpz.mod.MND, 115)
    mob:addMod(tpz.mod.CHR, 115)
    mob:addMod(tpz.mod.INT, 115)

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
end
