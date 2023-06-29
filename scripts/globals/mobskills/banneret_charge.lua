---------------------------------------------
-- Banneret Charge
--
-- Description: Reduces all within an area of effect to critical HP levels.
-- Additional Effect: Enmity reset
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local currentHP = mob:getHP()

    if currentHP < 25 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local targHP    = target:getHP()
    local dmg       = targHP - 1

    if math.random(1, 100) < target:getMod(tpz.mod.DEATHRES) then
        dmg = targHP * 0.5
    end

    mob:resetEnmity(target)

    return dmg
end
