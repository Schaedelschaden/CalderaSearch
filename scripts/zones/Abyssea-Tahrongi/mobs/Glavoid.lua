-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Glavoid
-----------------------------------

function onMobSpawn(mob)
	mob:setBehaviour(bit.band(mob:getBehaviour(), bit.bnot(tpz.behavior.NO_TURN)))
	mob:setMobMod(tpz.mobMod.ROAM_COOL, 180)
	mob:setMobMod(tpz.mobMod.ROAM_RATE, 30)
	mob:setMod(tpz.mod.SLOWRES, 100)
	mob:setMod(tpz.mod.SILENCERES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:addMod(tpz.mod.MATT, 72)
	mob:addMod(tpz.mod.REFRESH, 20)
	mob:setLocalVar("GLAVOID_BLOOD_WEAPON", 0)
	mob:setLocalVar("BLOOD_WEAPON_IMMUNITY", 0)
	mob:setLocalVar("GORGE_BASE_DMG", 6000)
	
	mob:addListener("WEAPONSKILL_STATE_ENTER", "GLAVOID_MOBSKILL_START", function(mob, skill)
        mob:setLocalVar("GLAVOID_PHYSICAL_ABSORB", 0)
		mob:setMod(tpz.mod.PHYS_ABSORB, 100)
		mob:setLocalVar("GLAVOID_WEAR_PHYS_ABSORB", os.time() + 5)
    end)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "GLAVOID_MOBSKILL_END", function(mob, skill)
		mob:setMod(tpz.mod.PHYS_ABSORB, 0)
    end)
	
	mob:addListener("MAGIC_START", "GLAVOID_MAGIC_CASTING", function(mob, spell, action)
		mob:setLocalVar("GLAVOID_MAGIC_ABSORB", 0)
		mob:setMod(tpz.mod.MAGIC_ABSORB, 100)
		mob:setLocalVar("GLAVOID_WEAR_MAG_ABSORB", os.time() + 5)
    end)
	
	-- mob:addListener("TAKE_DAMAGE", "GLAVOID_MAGIC_TAKE", function(mob, damage, caster, attackType, damageType)
        -- printf("Glavoid.lua LISTENER MAGIC_TAKE  MOB: [%s]  DAMAGE: [%i]  CASTER: [%s]  ATTACKTYPE: [%i]  DAMAGETYPE: [%i]", mob:getName(), damage, caster:getName(), attackType, damageType)
    -- end)
	
	mob:addListener("MAGIC_STATE_EXIT", "GLAVOID_MAGIC_END", function(mob, spell)
		mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
    end)
	
	mob:addListener("EFFECT_GAIN", "BLOOD_WEAPON_GAIN", function(mob, effect)
		if (effect:getType() == tpz.effect.BLOOD_WEAPON and mob:getLocalVar("BLOOD_WEAPON_IMMUNITY") == 0) then
			if (math.random(1, 100) <= 50) then
				mob:setMod(tpz.mod.SLASHRES, 0)
				mob:setMod(tpz.mod.PIERCERES, 0)
				mob:setMod(tpz.mod.IMPACTRES, 0)
				mob:setMod(tpz.mod.HTHRES, 0)
				mob:setLocalVar("BLOOD_WEAPON_IMMUNITY", 1) -- Physical Resistance
			else
				mob:setMod(tpz.mod.FIRERES, 1000)
				mob:setMod(tpz.mod.ICERES, 1000)
				mob:setMod(tpz.mod.WINDRES, 1000)
				mob:setMod(tpz.mod.EARTHRES, 1000)
				mob:setMod(tpz.mod.THUNDERRES, 1000)
				mob:setMod(tpz.mod.WATERRES, 1000)
				mob:setMod(tpz.mod.LIGHTRES, 1000)
				mob:setMod(tpz.mod.DARKRES, 1000)
				mob:setLocalVar("BLOOD_WEAPON_IMMUNITY", 2) -- Magic Resistance
			end
		end
    end)
	
	mob:addListener("EFFECT_LOSE", "BLOOD_WEAPON_LOSE", function(mob, effect)
		if (effect:getType() == tpz.effect.BLOOD_WEAPON) then
			if (mob:getLocalVar("BLOOD_WEAPON_IMMUNITY") == 1) then
				mob:setMod(tpz.mod.SLASHRES, 1000)
				mob:setMod(tpz.mod.PIERCERES, 1000)
				mob:setMod(tpz.mod.IMPACTRES, 1000)
				mob:setMod(tpz.mod.HTHRES, 1000)
			elseif (mob:getLocalVar("BLOOD_WEAPON_IMMUNITY") == 2) then
				mob:setMod(tpz.mod.FIRERES, 50)
				mob:setMod(tpz.mod.ICERES, 50)
				mob:setMod(tpz.mod.WINDRES, -12)
				mob:setMod(tpz.mod.EARTHRES, 75)
				mob:setMod(tpz.mod.THUNDERRES, 75)
				mob:setMod(tpz.mod.WATERRES, 50)
				mob:setMod(tpz.mod.LIGHTRES, 0)
				mob:setMod(tpz.mod.DARKRES, 50)
			end
			mob:setLocalVar("BLOOD_WEAPON_IMMUNITY", 0)
		end
    end)
end

function onMobFight(mob)
	local hpp = mob:getHPP()
	local bloodWeapon = mob:getLocalVar("GLAVOID_BLOOD_WEAPON")
	
	if (hpp <= 75 and bloodWeapon == 0) then
		mob:useMobAbility(695)
		mob:setLocalVar("GLAVOID_BLOOD_WEAPON", 1)
	elseif (hpp <= 50 and bloodWeapon == 1) then
		mob:useMobAbility(695)
		mob:setLocalVar("GLAVOID_BLOOD_WEAPON", 2)
	elseif (hpp <= 25 and bloodWeapon == 2) then
		mob:useMobAbility(695)
		mob:setLocalVar("GLAVOID_BLOOD_WEAPON", 3)
	end
	
	if (os.time() > mob:getLocalVar("GLAVOID_WEAR_PHYS_ABSORB")) then
		mob:setMod(tpz.mod.PHYS_ABSORB, 0)
	elseif (os.time() > mob:getLocalVar("GLAVOID_WEAR_MAG_ABSORB")) then
		mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
	end
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	mob:removeListener("GLAVOID_MOBSKILL_START")
	mob:removeListener("GLAVOID_MOBSKILL_END")
	mob:removeListener("GLAVOID_MAGIC_CASTING")
	-- mob:removeListener("GLAVOID_MAGIC_TAKE")
	mob:removeListener("GLAVOID_MAGIC_END")
	mob:removeListener("BLOOD_WEAPON_GAIN")
	mob:removeListener("BLOOD_WEAPON_LOSE")
	tpz.abyssea.kiOnMobDeath(mob, player)
end