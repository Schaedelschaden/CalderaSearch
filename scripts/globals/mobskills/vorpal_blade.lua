---------------------------------------------
-- Vorpal Blade
--
-- Description: Delivers a four-hit attack. Chance of critical varies with TP.
-- Type: Physical
-- Utsusemi/Blink absorb: Shadow per hit
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onMobSkillCheck(target, mob, skill)
    -- Check for Grah Family id 122, 123, 124
    -- if not in Paladin form, then ignore.
    if
        (mob:getFamily() == 122 or
         mob:getFamily() == 123 or
         mob:getFamily() == 124) and
        mob:AnimationSub() ~= 1
    then
        return 1
	end

	return 0
end

function onMobWeaponSkill(target, mob, skill)
    if mob:getPool() == 4249 then -- Volker@Throne_Room only
        target:showText(mob, zones[tpz.zone.THRONE_ROOM].text.BLADE_ANSWER)
    end

    local numhits = 4
    local accmod  = 1
    local dmgmod  = 1.25

    if mob:getObjType() == tpz.objType.TRUST then
        dmgmod = math.random(2, 4) + math.random()
    end

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_CRIT_VARIES, 25, 45, 65)
    local dmg  = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)

    -- AA EV: Approx 900 damage to 75 DRG/35 THF.  400 to a NIN/WAR in Arhat, but took shadows.
    return dmg
end
