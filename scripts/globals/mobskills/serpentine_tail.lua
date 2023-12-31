---------------------------------------------
--  Serpentine Tail
--
--  Description: Deals heavy damage to a target behind the user.
--  Type: Physical
--  2-3 Shadows
--  Range: Back
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)

    if (mob:getFamily() == 316) then
        local mobSkin = mob:getModelId()

        if (mobSkin == 1796) then
            return 0
        else
            return 1
        end
    else
        if (target:isBehind(mob, 48) == true) then
            return 0
        else
            return 1
        end
    end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 4.15
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 2, 3, 4)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_3_SHADOW)

    return dmg
end
