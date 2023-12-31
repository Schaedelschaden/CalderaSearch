---------------------------------------------------
-- Clarsach Call
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
        return 87, 0
    end
	
	player:setMP(0)
		
--	printf("Searing Light PET onAbilityCheck\n")
	
	return 0,0
end

function onPetAbility(target, pet, skill, player)
	local animationID = 175
	local mobName = target:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
    local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))

    local level = pet:getMainLvl()
    local damage = 26 + (level * 6)
	
	if (level > 98) then
		damage = 2000 + (level * 12)
	end
	
    damage = damage + (dINT * 1.5)
    damage = MobMagicalMove(pet, target, skill, damage, tpz.magic.ele.ICE, 1, TP_NO_EFFECT, 0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.WIND)
    damage = AvatarFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, 1)

    target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    target:updateEnmityFromDamage(pet, damage)
	
	pet:PrintToArea(string.format("The %s takes %i points of damage.", fixedName, damage),tpz.msg.channel.NS_SAY, tpz.msg.area.SAY)
	-- player:PrintToPlayer(string.format("The %s takes %i points of damage.", fixedMobName, damage),tpz.msg.channel.NS_SAY)
	
	PlayPetAnimation(pet, target, 13, animationID)

    return damage
end