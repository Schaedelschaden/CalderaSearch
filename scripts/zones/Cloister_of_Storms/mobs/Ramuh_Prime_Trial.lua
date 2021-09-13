-----------------------------------
-- Area: Cloister of Storms
--  Mob: Ramuh Prime
-- Involved in Quest: Trial by Lightning, Trial Size Trial by Lightning
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 893, hpp = 25}, -- uses Judgment Bolt once at 25% HPP.
        },
    })
	mob:setMod(tpz.mod.PETRIFYRES, 100)
	mob:setMod(tpz.mod.SILENCERES, 100)
    mob:setMod(tpz.mod.STUNRES, 95)
    mob:setMod(tpz.mod.BINDRES, 100)
    mob:setMod(tpz.mod.SLOWRES, 100)
	mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 17)
	mob:setMod(tpz.mod.ATT, 1000)
	mob:setMod(tpz.mod.MATT, 200)
    mob:setMod(tpz.mod.ACC, 1000)
	mob:setMod(tpz.mod.MACC, 1000)
	mob:setMod(tpz.mod.EVA, 800)
	-- mob:setMod(tpz.mod.DEF, 500)
	mob:setMod(tpz.mod.MEVA, 650)
	mob:setMod(tpz.mod.MDEF, 300)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:setMod(tpz.mod.FASTCAST, 25)
	mob:setMod(tpz.mod.PHYS_ABSORB, 5)
	mob:setMod(tpz.mod.MAGIC_ABSORB, 5)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
end

function onMobFight(mob, target)
   	local isBusy = false
	-- local has2Hrd = mob:getLocalVar("has2Hrd")
	local act = mob:getCurrentAction()
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true -- Set to true if Seiryu is in any stage of using a mobskill or casting a spell
    end
	
   	-- if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		-- mob:useMobAbility(692)
		-- mob:setLocalVar("has2Hrd", 1)
	-- end
	
	if (mob:getBattleTime() > 30 and mob:getBattleTime() % 22 == 0 and isBusy == false and mob:getLocalVar("UseMobSkillClear") == 0) then
        local rnd = math.random()

        if rnd < 0.2 then
            mob:useMobAbility(889)
        elseif rnd < 0.6 then
            mob:useMobAbility(891)
        else
            mob:useMobAbility(892)
        end
		
		mob:setLocalVar("UseMobSkill", os.time())
		mob:setLocalVar("UseMobSkillClear", 1)
	end
	
	if (os.time() - mob:getLocalVar("UseMobSkill") >= 10) then
		mob:setLocalVar("UseMobSkillClear", 0)
	end
	
	if (mob:getHPP() <= 10) then
		mob:setMod(tpz.mod.FASTCAST, 80)
		mob:setMod(tpz.mod.QUICK_MAGIC, 15)
	end
end

function onMobDeath(mob, player, isKiller)
end
