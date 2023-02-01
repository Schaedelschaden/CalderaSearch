---------------------------------------------
-- Arrogance Incarnate
--
-- Description: Delivers an unavoidable attack. Damage varies with HP and TP.
-- Type: Magical/Breath
-- Utsusemi/Blink absorb: Ignores shadows and most damage reduction.
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/msg")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/weaponskills")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local tp    = skill:getTP()
    local hp    = mob:getHP()
    local mult  = fTP(tp, 0.125, 0.50, 1.00)
	local maxHP = mob:getMaxHP()
    local dmg   = maxHP * mult

    -- Believe it or not, it's been proven to be breath damage.
    dmg = target:breathDmgTaken(dmg)

    -- Handling phalanx
    dmg = dmg - target:getMod(tpz.mod.PHALANX)

    if dmg < 0 then
        return 0
    end

    dmg = utils.stoneskin(target, dmg)

    if dmg > 0 then
        target:wakeUp()
        target:updateEnmityFromDamage(mob, dmg)
    end

	target:addHP(-dmg)

    return dmg
end
