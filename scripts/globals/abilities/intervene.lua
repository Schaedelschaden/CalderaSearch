-----------------------------------
-- Ability: Intervene
-- Strikes the target with your shield and decreases its attack and accuracy.
-- Obtained: Paladin Level 96
-- Recast Time: 1:00:00
-- Duration: 00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:getShieldSize() == 0 then
        return tpz.msg.basic.REQUIRES_SHIELD, 0
    else
        return 0, 0
    end
end

function onUseAbility(player,target,ability)
    local shieldSize = player:getShieldSize()
    local damage = 0
	damage = player:getMod(tpz.mod.SHIELD_BASH)
	
	-- Determine Bash damage
	if shieldSize == 1 then
        damage = 100 + damage
    elseif shieldSize == 2 then
        damage = 152 + damage
    elseif shieldSize == 3 then
        damage = 260 + damage
    elseif shieldSize == 4 then
        damage = 360 + damage
	 elseif shieldSize == 5 then
        damage = 100 + damage
	 elseif shieldSize == 6 then
        damage = 100 + damage
    end
	
    damage = math.floor(damage * 6)
	
	-- Randomize damage
	local ratio = player:getStat(tpz.mod.ATT)/target:getStat(tpz.mod.DEF)

    if ratio > 1.3 then
        ratio = 1.3
    end

    if ratio < 0.2 then
        ratio = 0.2
    end

    local pdif = math.random(ratio * 0.8 * 1000, ratio * 1.2 * 1000)
	
    if target:getZoneID() == 43 then
        damage = target:getMaxHP() * 0.30
        target:takeDamage(damage, player, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
        ability:setMsg(tpz.msg.basic.JA_DAMAGE)
        return damage
    else
        damage = damage * (pdif / 1000)
        damage = utils.stoneskin(target, damage)
        target:takeDamage(damage, player, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
        target:updateEnmityFromDamage(player,damage)
        ability:setMsg(tpz.msg.basic.JA_DAMAGE)
        target:addStatusEffect(tpz.effect.INTERVENE,1,0,30)
        
        return damage
    end
end
