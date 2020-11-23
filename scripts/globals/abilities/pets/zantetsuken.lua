---------------------------------------------
-- Zantetsuken
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    -- Does not get checked by Odin or the player
end

function onPetAbility(target, pet, skill, summoner)
    local power = (summoner:getMP() / summoner:getMaxMP())
	if (power < 1) then
		power = power + 1
	end
	printf("Zantetsuken PET onPetAbility  POWER: [%f]\n", power)

    if (target:isNM()) then
        local dmg = 0.1 * target:getHP() + 0.1 * target:getHP() * power
        if (dmg > 99999) then
            dmg = 99999
        end
        dmg = MobMagicalMove(pet,target,skill,dmg,tpz.magic.ele.DARK,1,TP_NO_EFFECT,0)
        dmg = mobAddBonuses(pet, nil, target, dmg.dmg, tpz.magic.ele.DARK)
        dmg = AvatarFinalAdjustments(dmg,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.DARK,1)
		printf("Zantetsuken PET onPetAbility  NM DAMAGE: [%i]\n", dmg)
        target:takeDamage(dmg, pet, tpz.attackType.MAGICAL, tpz.damageType.DARK)
        target:updateEnmityFromDamage(pet,dmg)
        summoner:setMP(0)
		return dmg
    else
        local chance = (100 * power) / skill:getTotalTargets()
		local rollRandom = math.random(0,99)
		printf("Zantetsuken PET onPetAbility CHANCE: [%f]  RANDOM: [%i]\n", chance, rollRandom)
        if rollRandom < chance and target:getAnimation() ~= 33 then
            skill:setMsg(tpz.msg.basic.SKILL_ENFEEB_IS)
            target:takeDamage(target:getHP(), pet, tpz.attackType.MAGICAL, tpz.damageType.DARK)
            summoner:setMP(0)
			return tpz.effect.KO
        else
            skill:setMsg(tpz.msg.basic.EVADES)
            summoner:setMP(0)
			return 0
        end
    end
end