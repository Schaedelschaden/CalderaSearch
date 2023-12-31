---------------------------------------------
-- Hypothermal Combustion
-- Self-destructs, releasing ice at nearby targets.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Notes: Damage is based on remaining HP
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- if mob:isMobType(MOBTYPE_NOTORIOUS) then
        -- return 1
    -- end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local baseDmg = mob:getMainLvl() * 9
    local dmgmod  = 1

    if mob:getName() == "Snoll_Tzar" then
        baseDmg = 10000 / skill:getTotalTargets()
    end

    local info = MobMagicalMove(mob, target, skill, baseDmg, tpz.magic.ele.ICE, dmgmod, TP_MAB_BONUS, 1)
    local dmg  = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, MOBPARAM_WIPE_SHADOWS)

	if not mob:isNM() then
		mob:setHP(0)
	end

    return dmg
end
