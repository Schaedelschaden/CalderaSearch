---------------------------------------------
-- Level 3 Holy (Cait Sith Blood Pact)
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
--	printf("Level 3 Holy PET onPetAbility\n")
	local mobName = target:getName()
	local fixedName = string.gsub(mobName, "_", " ")
	local moblevel = target:getMainLvl()
	local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))

	local damage = 1100
	
	if (moblevel % 3 == 0) then -- Divides moblevel by 3 then checks if there is any remainder
		damage = damage + (dINT * 1.5)
		damage = MobMagicalMove(pet,target,skill,damage,tpz.magic.ele.LIGHT,1,TP_NO_EFFECT,2)
		damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.LIGHT)
		damage = AvatarFinalAdjustments(damage,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.LIGHT,1)

		target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
		target:updateEnmityFromDamage(pet,damage)
	
		player:PrintToPlayer(string.format("The %s takes %i damage.", fixedName, damage),tpz.msg.channel.NS_SAY)
		skill:setMsg(tpz.msg.basic.HIT_DMG)

		return damage
	else
		player:PrintToPlayer(string.format("Cait Sith's ability has no effect on the %s.", fixedName),tpz.msg.channel.NS_SAY)
		return 0
	end
end