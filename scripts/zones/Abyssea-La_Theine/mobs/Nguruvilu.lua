-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Nguruvilu
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)
	mob:addMod(tpz.mod.WIND_ABSORB, 100)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "OBFUSCATE_ENDOOM", function(mob, skillID)
		if (skillID == 1721) then
			mob:setLocalVar("NguruviluEndoom", os.time())
		end
    end)
	
	mob:addListener("TAKE_DAMAGE", "ELEMENT_DAMAGE_TP", function(target, amount, attacker, attackType, damageType)
		local dayElement = VanadielDayElement()
		
		-- Day - Fire: 1 Ice: 2 Wind: 3 Earth: 4 Thunder: 5 Water: 6 Light: 7 Dark: 8
		-- Damage Type - Fire: 6 Ice: 7 Wind: 8 Earth: 9 Thunder: 10 Water: 11 Light: 12 Dark: 13
		if (damageType - 5 == dayElement) then
			target:addTP(1000)
		end
	end)
end

function onMobFight(mob)
	
end

function onAdditionalEffect(mob, target, damage)
	if (os.time() - mob:getLocalVar("NguruviluEndoom") <= 30) then
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.DOOM, {chance = 30})
	end

	return
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("OBFUSCATE_ENDOOM")
	mob:removeListener("ELEMENT_DAMAGE_TP")
end