-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Halimede
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.REFRESH, 20)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mob, skillID)
		local counter = mob:getLocalVar("MOBSKILL_COUNTER")
		
		if (skillID == 2562 and counter < 1 and math.random(1, 100) <= 50) then -- Acrid Stream			
			mob:useMobAbility(2562)
			counter = counter + 1
			mob:setLocalVar("MOBSKILL_COUNTER", counter)
			mob:setLocalVar("MOBSKILL_RESET", os.time())
		end
		
		if (skillID == 2563 and counter < 1) then -- Rime Spray
			mob:useMobAbility(2563)
			counter = counter + 1
			mob:setLocalVar("MOBSKILL_COUNTER", counter)
			mob:setLocalVar("MOBSKILL_RESET", os.time())
		end
    end)
	
	mob:addListener("MAGIC_USE", "CHAINSPELL_ENMITY_RESET", function(mob, target, spell, action)
		if (mob:hasStatusEffect(tpz.effect.CHAINSPELL)) then
			mob:resetEnmity(target)
		end
    end)
end

function onMobFight(mob)
	local hpp = mob:getHPP()

	if (os.time() - mob:getLocalVar("MOBSKILL_RESET") >= 10) then
		mob:setLocalVar("MOBSKILL_COUNTER", 0)
	end
	
	if (hpp <= 30 and mob:getLocalVar("CHAINSPELL") == 0) then
		mob:useMobAbility(692)
		mob:setLocalVar("CHAINSPELL", 1)
	end
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("MOBSKILL_USED")
	mob:removeListener("CHAINSPELL_ENMITY_RESET")
end