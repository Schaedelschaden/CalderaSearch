---------------------------------------------------
-- Ruinous Omen
---------------------------------------------------
require("/scripts/globals/settings")
require("/scripts/globals/status")
require("/scripts/globals/monstertpmoves")
require("/scripts/globals/magic")
---------------------------------------------------

function onAbilityCheck(player, target, ability)
	local currentMP = player:getMP()
	local level = player:getMainLvl()
	local cost = level * 2 -- Set the Blood Pact MP Cost here
	
	if(currentMP < cost) then
        return 87,0
    end
	
	player:setMP(0)
		
--	printf("Howling Moon PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill)
	local mobHealth = target:getHP()
	local damage = math.random(1,99) / 100
	
	if (target:isNM()) then
		damage = math.random(1,10) / 100
	end
	
	damage = mobHealth * damage
    damage = MobMagicalMove(pet, target, skill, damage, tpz.magic.ele.DARK, 1, TP_NO_EFFECT, 0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.DARK)
    damage = AvatarFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, 1)

    target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.DARK)

    return damage
end