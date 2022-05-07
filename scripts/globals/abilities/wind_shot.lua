-----------------------------------
-- Ability: Wind Shot
-- Consumes a Wind Card to enhance wind-based debuffs. Deals wind-based magic damage
-- Choke Effect: Enhanced DoT and VIT-
-----------------------------------
require("scripts/globals/ability")
require("scripts/globals/magic")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    -- Ranged weapon/ammo: You do not have an appropriate ranged weapon equipped.
    -- No card: <name> cannot perform that action.
    if player:getWeaponSkillType(tpz.slot.RANGED) ~= tpz.skill.MARKSMANSHIP or player:getWeaponSkillType(tpz.slot.AMMO) ~= tpz.skill.MARKSMANSHIP then
        return 216, 0
    end
	
    if player:hasItem(2178, 0) or player:hasItem(2974, 0) then
        return 0, 0
    else
        return 71, 0
    end
end

function onUseAbility(player, target, ability, action)
    local params = {}
		params.includemab = true
	
    local dmg = ((2 * player:getRangedDmg()) + player:getMod(tpz.mod.QUICK_DRAW_DMG)) * (1 + player:getMod(tpz.mod.QUICK_DRAW_DMG_PERCENT) / 100)
	
    dmg  = addBonusesAbility(player, tpz.magic.ele.WIND, target, dmg, params)
	
    local bonusAcc = player:getStat(tpz.mod.AGI) / 2 + player:getMerit(tpz.merit.QUICK_DRAW_ACCURACY) + player:getMod(tpz.mod.QUICK_DRAW_MACC)
	
    dmg = dmg * applyResistanceAbility(player, target, tpz.magic.ele.WIND, tpz.skill.NONE, bonusAcc)
    dmg = adjustForTarget(target, dmg, tpz.magic.ele.WIND)

		params.targetTPMult = 0 -- Quick Draw does not feed TP
	
    dmg = takeAbilityDamage(target, player, params, true, dmg, tpz.attackType.MAGICAL, tpz.damageType.WIND, tpz.slot.RANGED, 1, 0, 0, 0, action, nil)

    if dmg > 0 then
        local effects = {}
        local choke = target:getStatusEffect(tpz.effect.CHOKE)
		
        if choke ~= nil then
            table.insert(effects, choke)
        end

        local threnody = target:getStatusEffect(tpz.effect.THRENODY)
		
        if threnody ~= nil and threnody:getSubPower() == tpz.mod.EARTHRES then
            table.insert(effects, threnody)
        end

        if #effects > 0 then
            local effect = effects[math.random(#effects)]
            local duration = effect:getDuration()
            local startTime = effect:getStartTime()
            local tick = effect:getTick()
            local power = effect:getPower()
            local subpower = effect:getSubPower()
            local tier = effect:getTier()
            local effectId = effect:getType()
            local subId = effect:getSubType()
			
            power = power * 1.2
            target:delStatusEffectSilent(effectId)
            target:addStatusEffect(effectId, power, tick, duration, subId, subpower, tier)
			
            local newEffect = target:getStatusEffect(effectId)
			
            newEffect:setStartTime(startTime)
        end
    end
	
	if (player:getMod(tpz.mod.QUICK_DRAW_ENH_DMG) > 0) then
		local strength = player:getMod(tpz.mod.QUICK_DRAW_ENH_DMG)
		target:addStatusEffect(tpz.effect.MAGIC_DEF_DOWN, 0, 0, 10, 0, strength, 3)
	end

    local del = player:delItem(2178, 1) or player:delItem(2974, 1)
	
    target:updateClaim(player)
	
	-- Check for Augment "Quick Draw" set effect
	if (math.random(1, 100) < player:getMod(tpz.mod.AUGMENT_QUICK_DRAW)) then
		dmg = dmg * 3
	end
	
    return dmg
end