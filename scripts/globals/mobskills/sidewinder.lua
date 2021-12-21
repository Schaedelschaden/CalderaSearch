---------------------------------------------------
-- Sidewinder
-- Trust: Semih Lafihna
-- Reverberation/Transfixion/Detonation skillchain properties
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 7

    local info = MobRangedMove(mob, target, skill, numhits, accmod, dmgmod, TP_ACC_VARIES, 0.8, 0.9, 1)

    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.PIERCING, MOBPARAM_1_SHADOW)

    return dmg	
end