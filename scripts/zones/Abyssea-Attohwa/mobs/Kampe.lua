-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Kampe
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 04/26/22 - Needs to be set up
	mob:setLocalVar("KAMPE_SKILL_MARKER", 1)
	mob:setLocalVar("KAMPE_SKILL_PATTERN", math.random(1, 3))
	mob:setMod(tpz.mod.POISONRES, 100)
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
	
	mob:addListener("WEAPONSKILL_STATE_ENTER", "KAMPE_MOBSKILL_START", function(mob, skill)
        mob:setLocalVar("KAMPE_DAMAGE_TRIGGER", 1)
		mob:setLocalVar("TRIGGER_TIMER", os.time() + 5)
    end)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "KAMPE_MOBSKILL_END", function(mob, skill)
		mob:setLocalVar("KAMPE_DAMAGE_TRIGGER", 0)
		mob:setLocalVar("KAMPE_TRIGGER_ACTIVE", 0)
    end)
	
	mob:addListener("TAKE_DAMAGE", "KAMPE_TAKE_DAMAGE", function(target, amount, attacker, attackType, damageType)
		if (target:getLocalVar("KAMPE_DAMAGE_TRIGGER") == 1 and target:getLocalVar("KAMPE_TRIGGER_ACTIVE") == 0) then
			-- Cold Breath/Numbing Breath, Wild Rage/Earth Pounder, Death Scissors/Death Scissors
			local pattern = {{348, 349}, {354, 355}, {353, 353}}
			local pickedPattern = target:getLocalVar("KAMPE_SKILL_PATTERN")
			local marker = target:getLocalVar("KAMPE_SKILL_MARKER")
			
			target:useMobAbility(pattern[pickedPattern][marker])
			
			target:setLocalVar("KAMPE_TRIGGER_ACTIVE", 1)
			
			if (target:getLocalVar("KAMPE_SKILL_MARKER") == 1) then
				target:setLocalVar("KAMPE_SKILL_MARKER", 2)
			elseif (target:getLocalVar("KAMPE_SKILL_MARKER") == 2) then
				target:setLocalVar("KAMPE_SKILL_MARKER", 1)
			end
		end
	end)
end

function onMobFight(mob, target)
	if (mob:getBattleTime() > 0 and mob:getBattleTime() % 30 == 0) then
		mob:setLocalVar("KAMPE_SKILL_PATTERN", math.random(1, 3))
	end

	if (os.time() >= mob:getLocalVar("TRIGGER_TIMER") and mob:getLocalVar("KAMPE_DAMAGE_TRIGGER") == 1) then
		mob:setLocalVar("KAMPE_DAMAGE_TRIGGER", 0)
		mob:setLocalVar("KAMPE_TRIGGER_ACTIVE", 0)
	end
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("KAMPE_MOBSKILL_START")
	mob:removeListener("KAMPE_MOBSKILL_END")
	mob:removeListener("KAMPE_TAKE_DAMAGE")
end