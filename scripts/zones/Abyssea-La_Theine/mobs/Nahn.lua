-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Nahn
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.SILENCERES, 100)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.FASTCAST, 35)
	mob:setMod(tpz.mod.REFRESH, 20)
	
	-- Metallic Body cannot be dispelled and makes Nahn immune to Stun
	mob:addListener("EFFECT_GAIN", "METALLIC_BODY_GAIN", function(mob, effect)
		if effect:getType() == tpz.effect.STONESKIN then
			effect:unsetFlag(tpz.effectFlag.DISPELABLE)
			mob:setMod(tpz.mod.STUNRES, 100)
			mob:SetAutoAttackEnabled(false)
			mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
			mob:setSpellList(451) -- Switches to casting only Flood
		end
    end)
	
	mob:addListener("EFFECT_LOSE", "METALLIC_BODY_LOSE", function(mob, effect)
		if effect:getType() == tpz.effect.STONESKIN then
			mob:setMod(tpz.mod.STUNRES, 0)
			mob:SetAutoAttackEnabled(true)
			mob:setMobMod(tpz.mobMod.SKILL_LIST, 1165)
			mob:setSpellList(450) -- Switches to casting only Waterga II
		end
    end)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "BUBBLE_SHOWER_USED", function(mob, skillID)
		local hpp = mob:getHPP()
		local counter = mob:getLocalVar("BUBBLE_SHOWER_COUNTER")
		local maxUses = 1
		
		if hpp >= 56 and hpp <= 80 then
			maxUses = 2
		elseif hpp >= 31 and hpp <= 55 then
			maxUses = 3
		elseif hpp >= 1 and hpp <= 30 then
			maxUses = 4
		end
		
		if skillID == 442 then
			counter = counter + 1
			mob:setLocalVar("BUBBLE_SHOWER_COUNTER", counter)
			mob:setLocalVar("BUBBLE_SHOWER_RESET", os.time())
			
			if counter < maxUses then
				mob:useMobAbility(442)
			end
		end
    end)
	
	mob:addListener("MAGIC_STATE_EXIT", "WATER_MAGIC_USED", function(mob, spell, action)
		local hpp = mob:getHPP()
		local counter = mob:getLocalVar("WATER_MAGIC_COUNTER")
		local maxUses = 1
		
		if hpp >= 56 and hpp <= 80 then
			maxUses = 2
		elseif hpp >= 31 and hpp <= 55 then
			maxUses = 3
		elseif hpp >= 1 and hpp <= 30 then
			maxUses = 4
		end
		
		if spell:getID() == 200 or spell:getID() == 214 then
			counter = counter + 1
			mob:setLocalVar("WATER_MAGIC_COUNTER", counter)
			mob:setLocalVar("WATER_MAGIC_RESET", os.time())
			
			if counter < maxUses then
				mob:castSpell(spell)
			end
		end
    end)
end

function onMobFight(mob)
	if os.time() - mob:getLocalVar("BUBBLE_SHOWER_RESET") >= 10 then
		mob:setLocalVar("BUBBLE_SHOWER_COUNTER", 0)
	end
	
	if os.time() - mob:getLocalVar("WATER_MAGIC_RESET") >= 15 then
		mob:setLocalVar("WATER_MAGIC_COUNTER", 0)
	end
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 214) then -- Flood
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(10)
    end
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("METALLIC_BODY_GAIN")
	mob:removeListener("METALLIC_BODY_LOSE")
	mob:removeListener("BUBBLE_SHOWER_USED")
	mob:removeListener("WATER_MAGIC_USED")
	tpz.abyssea.kiOnMobDeath(mob, player)
end