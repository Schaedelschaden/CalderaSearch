-----------------------------------
-- Area: Cloister of Tremors
--  Mob: Titan Prime
-- Involved in Quest: Trial by Earth, Trial Size Trial by Earth
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 857, hpp = 25}, -- uses Earthen Fury once while st 25% HPP.
        },
    })
	mob:setMod(tpz.mod.SILENCERES, 80)
    mob:setMod(tpz.mod.STUNRES, 100)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 70)
	mob:setMod(tpz.mod.ATT, 3000)
	mob:setMod(tpz.mod.MATT, 100)
    mob:setMod(tpz.mod.ACC, 1000)
	mob:setMod(tpz.mod.MACC, 500)
	mob:setMod(tpz.mod.DEF, 1500)
	mob:setMod(tpz.mod.MDEF, 200)
	mob:setMod(tpz.mod.EVA, 100)
	mob:setMod(tpz.mod.MEVA, 50)
	mob:setMod(tpz.mod.CRITHITRATE, 100)
	mob:setMod(tpz.mod.FASTCAST, 80)
	mob:setMod(tpz.mod.PHYS_ABSORB, 5)
	mob:setMod(tpz.mod.MAGIC_ABSORB, 5)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
end

function onMobFight(mob, target)
   	local isBusy = false
	local has2Hrd = mob:getLocalVar("has2Hrd")
	local act = mob:getCurrentAction()
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true -- Set to true if Seiryu is in any stage of using a mobskill or casting a spell
    end
   	if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		mob:useMobAbility(690)
		mob:setLocalVar("has2Hrd", 1)
	end
	
	if (mob:getBattleTime() > 0 and mob:getBattleTime() % 15 == 0 and isBusy == false) then
        local rnd = math.random()

		if rnd < 0.5 then
			mob:useMobAbility(853)
		elseif rnd < 0.7 then
			mob:useMobAbility(854)
		elseif rnd < 0.9 then
			mob:useMobAbility(855)
		else
			mob:useMobAbility(856)
		end
	end
	
	if (mob:getHPP() <= 10) then
		mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
	end
end

function onMobDeath(mob, player, isKiller)
end