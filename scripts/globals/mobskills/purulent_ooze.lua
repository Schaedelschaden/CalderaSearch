---------------------------------------------------
-- Purulent Ooze
-- Family: Slugs
-- Description: Deals Water damage in a fan-shaped area of effect. Additional effect: Bio and Max HP Down
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Cone
-- Notes:
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local baseDamage = mob:getWeaponDmg() * 3
    local info = MobMagicalMove(mob, target, skill, baseDamage, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)

    MobStatusEffectMove(mob, target, tpz.effect.BIO, 5, 3, 120, 0, 10)
	
	local master = mob:getMaster()
	
	if (master:isPC()) then
		local mobName = target:getName()
		local fixedName = string.gsub(mobName, "_", " ")
		
		if (MobStatusEffectMove(mob, target, tpz.effect.MAX_HP_DOWN, 10, 0, 120)) then
			mob:PrintToArea(string.format("The %s gains the effect of Max HP Down.", fixedName),tpz.msg.channel.NS_SAY, tpz.msg.area.SAY)
		end
	else
		MobStatusEffectMove(mob, target, tpz.effect.MAX_HP_DOWN, 10, 0, 120)
	end

    return dmg
end