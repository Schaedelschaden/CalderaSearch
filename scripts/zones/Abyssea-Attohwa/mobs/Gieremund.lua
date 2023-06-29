-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Gieremund
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1)
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
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
	mob:setMod(tpz.mod.CRITHITRATE, 25)
	mob:addMod(tpz.mod.MAIN_DMG_RATING, 50)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "HOWLING_BUFFS", function(mob, skillID)
		if (skillID == 465 and mob:getLocalVar("GieremundHowlingActive") == 0) then
			mob:setLocalVar("GieremundHowlingTimer", os.time())
			mob:setLocalVar("GieremundHowlingActive", 1)
			mob:addMod(tpz.mod.ACC, 200)
			mob:addMod(tpz.mod.CRITHITRATE, 25)
		end
    end)
end

function onMobFight(mob, target)
	if (mob:getLocalVar("GieremundHowlingActive") == 1 and os.time() - mob:getLocalVar("GieremundHowlingTimer") >= 30) then
		mob:setLocalVar("GieremundHowlingActive", 0)
		mob:delMod(tpz.mod.ACC, 200)
		mob:delMod(tpz.mod.CRITHITRATE, 25)
	end
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("HOWLING_BUFFS")
end