---------------------------------------------
-- Impact (Fenrir Blood Pact)
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
--	printf("Impact PET onPetAbility START\n")
	local petlvl = pet:getMainLvl()
	local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
--	printf("Impact PET onPetAbility TP [%f]\n",tp)
	local debuff = math.floor(player:getSkillLevel(tpz.skill.SUMMONING_MAGIC) / 18.75)
	local debuffmultiplier = 1
	local duration = 180
	local dmgmultiplier = 2.335 -- Originally 2.335
	
	if (petlvl > 99) then
		debuffmultiplier = 2
		debuff = debuff * debuffmultiplier
	end
	
	if (target:hasStatusEffect(tpz.effect.STR_DOWN) == false) then
        target:addStatusEffect(tpz.effect.STR_DOWN,debuffmultiplier,0,duration)
    end
    if (target:hasStatusEffect(tpz.effect.DEX_DOWN) == false) then
        target:addStatusEffect(tpz.effect.DEX_DOWN,debuffmultiplier,0,duration)
    end
    if (target:hasStatusEffect(tpz.effect.VIT_DOWN) == false) then
        target:addStatusEffect(tpz.effect.VIT_DOWN,debuffmultiplier,0,duration)
    end
    if (target:hasStatusEffect(tpz.effect.AGI_DOWN) == false) then
        target:addStatusEffect(tpz.effect.AGI_DOWN,debuffmultiplier,0,duration)
    end
    if (target:hasStatusEffect(tpz.effect.INT_DOWN) == false) then
        target:addStatusEffect(tpz.effect.INT_DOWN,debuffmultiplier,0,duration)
    end
    if (target:hasStatusEffect(tpz.effect.MND_DOWN) == false) then
        target:addStatusEffect(tpz.effect.MND_DOWN,debuffmultiplier,0,duration)
    end
    if (target:hasStatusEffect(tpz.effect.CHR_DOWN) == false) then
        target:addStatusEffect(tpz.effect.CHR_DOWN,debuffmultiplier,0,duration)
    end

	local damage = math.floor(939 * dmgmultiplier)
--	printf("Impact PET onPetAbility DAMAGE 1 [%i]\n",damage)
	damage = damage + (dINT * 1.5)
--	printf("Impact PET onPetAbility DAMAGE 2 [%i]\n",damage)
	damage = MobMagicalMove(pet,target,skill,damage,tpz.magic.ele.DARK,1,TP_DMG_BONUS,2)
--	printf("Impact PET onPetAbility DAMAGE 3 [%i]\n",damage)
	damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.DARK)
--	printf("Impact PET onPetAbility DAMAGE 4 [%i]\n",damage)
	damage = AvatarFinalAdjustments(damage,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.DARK,1)
--	printf("Impact PET onPetAbility DAMAGE 5 [%i]\n",damage)

	target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.DARK)
	target:updateEnmityFromDamage(pet,damage)
	
	target:addStatusEffect(tpz.effect.STR_DOWN,drainvalue,0,duration)

	return damage
end