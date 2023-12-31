---------------------------------------------
-- Sonic Buffet (Siren Blood Pact)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	return 0,0
end

function onPetAbility(target, pet, skill, player)
	local animationID = 182
	local mobName = target:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
    local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
    local tp = skill:getTP()
    local damage = math.floor(800 + 0.025 * (tp))
	
    damage = damage + (dINT * 1.5)
    damage = MobMagicalMove(pet, target, skill, damage, tpz.magic.ele.WIND, 1, TP_NO_EFFECT, 0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.WIND)
    damage = AvatarFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, 1)

    target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    target:updateEnmityFromDamage(pet, damage)
	target:dispelStatusEffect()
	
	pet:PrintToArea(string.format("The %s takes %i points of damage.", fixedName, damage),tpz.msg.channel.NS_SAY, tpz.msg.area.SAY)
	-- player:PrintToPlayer(string.format("The %s takes %i points of damage.", fixedMobName, damage),tpz.msg.channel.NS_SAY)
	
	PlayPetAnimation(pet, target, 13, animationID)

    return damage
end