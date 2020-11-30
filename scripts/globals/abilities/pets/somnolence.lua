---------------------------------------------
-- Somnolence (Diabolos Blood Pact)
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

function onPetAbility(target, pet, skill)
    local bonus = math.floor((pet:getStat(tpz.mod.INT) * 7) / 4)
	local damage = ((10 + (pet:getMainLvl() * 2)) + bonus)
    local resist = applyPlayerResistance(pet,-1,target, 0, tpz.skill.ELEMENTAL_MAGIC, tpz.magic.ele.DARK)
    local duration = 120

    damage = MobMagicalMove(pet,target,skill,damage,tpz.magic.ele.DARK,1,TP_NO_EFFECT,0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.DARK)
    damage = AvatarFinalAdjustments(damage,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.DARK,1)

    target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    target:updateEnmityFromDamage(pet,damage)

    if (resist < 0.15) then  --the gravity effect from this ability is more likely to land than Tail Whip
        resist = 0
    end

    duration = duration * resist

    if (duration > 0 and target:hasStatusEffect(tpz.effect.WEIGHT) == false) then
        target:addStatusEffect(tpz.effect.WEIGHT, 50, 0, duration)
    end

    return damage
end