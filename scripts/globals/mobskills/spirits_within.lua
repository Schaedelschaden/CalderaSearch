---------------------------------------------
-- Spirits Within
--
-- Description: Delivers an unavoidable attack. Damage varies with HP and TP.
-- Type: Magical/Breath
-- Utsusemi/Blink absorb: Ignores shadows and most damage reduction.
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")

function onMobSkillCheck(target, mob, skill)
    if mob:getPool() ~= 4249 then
        mob:messageBasic(tpz.msg.basic.READIES_WS, 0, 39)
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if mob:getPool() == 4249 then -- Volker@Throne_Room only
        target:showText(mob, zones[tpz.zone.THRONE_ROOM].text.RETURN_TO_THE_DARKNESS)
    end

    local tp  = skill:getTP()
    local hp  = mob:getHP()
    local dmg = 0

	local targetMaxHP = target:getMaxHP() * 0.95

	if dmg > targetMaxHP then
		dmg = targetMaxHP
	end

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
