---------------------------------------------
--  Formation Attack
--
-- Description: Deals damage to a single target.
-- Type: Physical
-- Utsusemi/Blink absorb: 1-3 shadows
-- Range: Melee
-- Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 3 -- Number of bombs left

    switch (mob:AnimationSub): caseof
    {
        [1] = function ()
            numhits = 2
        end,
        [2] = function ()
            numhits = 1
        end,
    }

    local accmod = 1
    local dmgmod = math.random(0.70, 1)
    local info   = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)

    return dmg
end
