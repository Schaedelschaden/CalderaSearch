-----------------------------------
-- Ability: Shield Bash
-- Delivers an attack that can stun the target. Shield required.
-- Obtained: Paladin Level 15, Valoredge automaton frame Level 1
-- Recast Time: 1:00 minute (3:00 for Valoredge version)
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if player:getShieldSize() == 0 then
        return tpz.msg.basic.REQUIRES_SHIELD, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)

    local shieldSize = player:getShieldSize()
    local damage = 0
    local chance = math.random(50, 90)
	local stun = math.random(1, 100)
    damage = player:getMod(tpz.mod.SHIELD_BASH)

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

    -- Main job factors
    if player:getMainJob() ~= tpz.job.PLD then
        damage = math.floor(damage / 2.5) * 3
        chance = 60
    else
        damage = math.floor(damage * 3)
    end
	
    -- Stun proc
    if stun < chance then
        target:addStatusEffect(tpz.effect.STUN, 1, 0, 6)
    end

    -- Randomize damage
    local ratio = player:getStat(tpz.mod.ATT)/target:getStat(tpz.mod.DEF)

    if ratio > 1.3 then
        ratio = 1.3
    end

    if ratio < 0.2 then
        ratio = 0.2
    end

    local pdif = math.random(ratio * 0.8 * 1000, ratio * 1.2 * 1000)

    -- printf("damge %d, ratio: %f, pdif: %d\n", damage, ratio, pdif)
	
	if player:getMod(tpz.mod.SHIELD_BASH_DISPEL) > 0 then
		ability:setMsg(tpz.msg.basic.MAGIC_ERASE)
		target:dispelStatusEffect()
		if (effect == tpz.effect.NONE) then -- No effect to Dispel
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
	end

    damage = damage * (pdif / 1000)
    damage = utils.stoneskin(target, damage)
    target:takeDamage(damage, player, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
    target:updateEnmityFromDamage(player,damage)
    ability:setMsg(tpz.msg.basic.JA_DAMAGE)

    return damage
end
