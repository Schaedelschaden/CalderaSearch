-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Yearner
-----------------------------------

function onMobSpawn(mob)
	-- mob:SetAutoAttackEnabled(false)
	mob:SetMobSkillAttack(1170) -- Sets Yearner's attack to mob_skill_lists 1170 (Carousel only)
	mob:setMod(tpz.mod.FIRERES, 250)
	mob:setMod(tpz.mod.ICERES, 250)
	mob:setMod(tpz.mod.WINDRES, 250)
	mob:setMod(tpz.mod.EARTHRES, 250)
	mob:setMod(tpz.mod.THUNDERRES, 250)
	mob:setMod(tpz.mod.WATERRES, 250)
	mob:setMod(tpz.mod.LIGHTRES, 250)
	mob:setMod(tpz.mod.DARKRES, 250)
	mob:setMod(tpz.mod.REGAIN, 150)
	
	mob:addListener("WEAPONSKILL_STATE_ENTER", "YEARNER_MOBSKILL_START", function(mob, skill)
        mob:setMod(tpz.mod.FIRERES, 0)
		mob:setMod(tpz.mod.ICERES, 0)
		mob:setMod(tpz.mod.WINDRES, 0)
		mob:setMod(tpz.mod.EARTHRES, 0)
		mob:setMod(tpz.mod.THUNDERRES, 0)
		mob:setMod(tpz.mod.WATERRES, 0)
		mob:setMod(tpz.mod.LIGHTRES, 0)
		mob:setMod(tpz.mod.DARKRES, 0)
    end)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "YEARNER_MOBSKILL_USED", function(mob, skillID)
		mob:setMod(tpz.mod.FIRERES, 250)
		mob:setMod(tpz.mod.ICERES, 250)
		mob:setMod(tpz.mod.WINDRES, 250)
		mob:setMod(tpz.mod.EARTHRES, 250)
		mob:setMod(tpz.mod.THUNDERRES, 250)
		mob:setMod(tpz.mod.WATERRES, 250)
		mob:setMod(tpz.mod.LIGHTRES, 250)
		mob:setMod(tpz.mod.DARKRES, 250)
    end)
end

function onMobFight(mob)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 707)
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("YEARNER_MOBSKILL_START")
	mob:removeListener("YEARNER_MOBSKILL_USED")
end