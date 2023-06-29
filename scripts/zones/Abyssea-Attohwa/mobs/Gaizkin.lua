-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Gaizkin
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.PARALYZERES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.BINDRES, 100)
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
	
	mob:addListener("TAKE_DAMAGE", "DAMAGED_ADD_TP", function(mob, damage, attacker, attackType, damageType)
		local isBusy = false
		local act = mob:getCurrentAction()
	
		if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH then
			isBusy = true 
		end
		
		if isBusy == true then
			mob:setTP(3000)
		end
	end)
end

function onMobFight(mob, target)
	
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("DAMAGED_ADD_TP")
end
