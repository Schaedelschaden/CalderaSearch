---------------------------------------------
-- Vampiric Lash
--
-- Description: Deals dark damage to a single target. Additional effect: Drain
-- Type: Magical
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee
-- Notes: In ToAU zones, this has an additional effect of absorbing all status effects, including food.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_1_SHADOW)

    skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg))

	-- Clingy Clare can use Vampiric Lash three times in a row
	if (mob:getID() == 16838946) then
		local counter = 2 - mob:getLocalVar("ClingyClare_MultiLash")
		
		if (counter > 0 and counter <= 2) then
			mob:useMobAbility(317)
			mob:setLocalVar("ClingyClare_MultiLash", mob:getLocalVar("ClingyClare_MultiLash") + 1)
		elseif (counter == 0) then
			mob:setLocalVar("ClingyClare_MultiLash", 0)
		end
	end

    return dmg
end