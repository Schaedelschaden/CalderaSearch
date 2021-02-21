-----------------------------------
-- Area: Cloister of Flames
--  Mob: Ifrit Prime
-- Involved in Quest: Trial by Fire, Trial Size Trial by Fire
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 848, hpp = math.random(30,55)}, -- uses Inferno once while near 50% HPP.
        },
    })
	    mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.GRAVITYRES, 35)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 17)
	mob:setMod(tpz.mod.ATT, 1000)
	mob:setMod(tpz.mod.MATT, 1000)
    mob:setMod(tpz.mod.ACC, 1000)
    mob:setMod(tpz.mod.EVA, 300)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 100)
end

function onMobFight(mob, target)
   mob:setMod(tpz.mod.REGAIN, 300)
   	if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		mob:useMobAbility(688)
		mob:setLocalVar("has2Hrd", 1)
	end
	        	if (mob:getHPP() <= 50) then
            mob:addMod(tpz.mod.UDMGPHYS, -50)
            mob:addMod(tpz.mod.UDMGRANGE, -50)
            mob:setMod(tpz.mod.UDMGMAGIC, -50)
        end
end

function onMobDeath(mob, player, isKiller)
end
