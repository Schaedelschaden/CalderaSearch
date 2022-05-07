-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	local shieldSize = target:getShieldSize()
	local baseBlock = 0
	local bonusBlock
	local blockRateMult = 50 / 100
	local combatTarget
	local targetAttackSkill = 0
	local defenderShieldSkill = (target:getCharSkillLevel(tpz.skill.SHIELD) + target:getSkillLevel(tpz.skill.SHIELD)) / 10
	local skillDif = 0
	
	if (target:isEngaged()) then
		combatTarget = target:getCursorTarget()
		
		if (combatTarget ~= nil) then
			local targetSkillType = combatTarget:getWeaponSkillType(tpz.slot.MAIN)
			targetAttackSkill = combatTarget:getSkillLevel(targetSkillType)
			-- printf("reprisal.lua onEffectGain ENEMY WEAPON SKILL: [%i]", targetAttackSkill)
		end
	end
	
	if (targetAttackSkill ~= nil and targetAttackSkill ~= 0) then
		skillDif = (defenderShieldSkill - targetAttackSkill) * 0.2325
	end
	
	-- printf("reprisal.lua onEffectGain  ATTACKER SKILL: [%i]  SHIELD SKILL: [%i]  SKILL DIF: [%2.2f]", targetAttackSkill, defenderShieldSkill, skillDif)
	
	if (shieldSize ~= 0) then
		if (shieldSize == 1) then
			baseBlock = 55
		elseif (shieldSize == 2) then
			baseBlock = 40
		elseif (shieldSize == 3) then
			baseBlock = 45
		elseif (shieldSize == 4) then
			baseBlock = 30
		end
	end
	
	baseBlock = baseBlock + skillDif + target:getMod(tpz.mod.SHIELDBLOCKRATE)
	-- printf("reprisal.lua onEffectGain 1 BASE BLOCK: [%i]", baseBlock)
	
	-- Priwen or Adamas
	if (target:getEquipID(tpz.slot.SUB) == 28648 or target:getEquipID(tpz.slot.SUB) == 10806) then
		blockRateMult = 150 / 100
	end
	
	bonusBlock = math.floor(baseBlock * blockRateMult)
	
	if (baseBlock + bonusBlock > 100) then
		bonusBlock = 100 - baseBlock
	end
	
	target:setCharVar("ReprisalBlockRate", bonusBlock)
	-- printf("reprisal.lua onEffectGain 2 BONUS BLOCK: [%i]", bonusBlock)

    target:addMod(tpz.mod.SPIKES, 6)
     -- Spike damage is calculated on hit in battleutils::TakePhysicalDamage
    target:setMod(tpz.mod.SPIKES_DMG, 0)
    target:addMod(tpz.mod.SHIELDBLOCKRATE, bonusBlock)
end

function onEffectTick(target, effect)
	
end

function onEffectLose(target, effect)
	local bonusBlock = target:getCharVar("ReprisalBlockRate")
	target:setCharVar("ReprisalBlockRate", 0)
	-- printf("reprisal.lua onEffectLose BONUS BLOCK: [%i]", bonusBlock)

    target:delMod(tpz.mod.SPIKES, 6)
    target:setMod(tpz.mod.SPIKES_DMG, 0)
    target:delMod(tpz.mod.SHIELDBLOCKRATE, bonusBlock)
end