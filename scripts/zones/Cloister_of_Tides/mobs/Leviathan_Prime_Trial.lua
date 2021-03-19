-----------------------------------
-- Area: Cloister of Tides
--  Mob: Leviathan Prime
-- Involved in Quest: Trial by Water, Trial Size Trial by Water
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 866, hpp = 25}, -- uses Tidal Wave once while at 25% HPP.
        },
    })
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 35)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 17)
	mob:setMod(tpz.mod.ATT, 1200)
	mob:setMod(tpz.mod.MATT, 200)
    mob:setMod(tpz.mod.ACC, 500)
	mob:setMod(tpz.mod.MACC, 500)
    mob:setMod(tpz.mod.EVA, 300)
	mob:setMod(tpz.mod.DEF, 800)
	mob:setMod(tpz.mod.MEVA, 200)
	mob:setMod(tpz.mod.MDEF, 100)
	mob:setMod(tpz.mod.UTSUSEMI_BONUS, 4)
	mob:setMod(tpz.mod.FASTCAST, 80)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 100)
	mob:setMod(tpz.mod.PHYS_ABSORB, 5)
	mob:setMod(tpz.mod.MAGIC_ABSORB, 5)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
end

function onMobFight(mob, target)
   	local isBusy = false
	local has2Hrd = mob:getLocalVar("has2Hrd")
	local act = mob:getCurrentAction()
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true
    end
   	if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		mob:useMobAbility(731)
		mob:setLocalVar("has2Hrd", 1)
	end
	if (mob:getHPP() <= 10) then
		mob:setMod(tpz.mod.CRITHITRATE, 30)
		mob:setMod(tpz.mod.QUAD_ATTACK, 15)
	end
		if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH then 
        isBusy = true
    end
	
	if (mob:getBattleTime() > 30 and mob:getBattleTime() % 15 == 0 and isBusy == false) then
           local rnd = math.random()

			if rnd < 0.2 then
			   mob:useMobAbility(863)
			elseif rnd < 0.6 then
				mob:useMobAbility(864)
			else
				mob:useMobAbility(865)
			end
	end
end

function onMobDeath(mob, player, isKiller)
end
