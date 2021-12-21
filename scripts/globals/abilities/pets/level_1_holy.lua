---------------------------------------------
-- Level 1 Holy (Cait Sith Blood Pact)
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
--	printf("Level 1 Holy PET onPetAbility\n")
	local mobName = target:getName()
	local fixedName = string.gsub(mobName, "_", " ")
	local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))

	local damage = 225
	damage = damage + (dINT * 1.5)
	damage = MobMagicalMove(pet,target,skill,damage,tpz.magic.ele.LIGHT,1,TP_NO_EFFECT,2)
	damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.LIGHT)
	damage = AvatarFinalAdjustments(damage,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.LIGHT,1)

	target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
	target:updateEnmityFromDamage(pet,damage)
	
	pet:PrintToArea(string.format("The %s takes %i points of damage.", fixedName, damage),tpz.msg.channel.NS_SAY, tpz.msg.area.SAY)
	-- player:PrintToPlayer(string.format("The %s takes %i damage.", fixedName, damage),tpz.msg.channel.NS_SAY)
	skill:setMsg(tpz.msg.basic.HIT_DMG)

	return damage
end