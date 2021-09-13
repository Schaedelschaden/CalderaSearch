---------------------------------------------
-- Accursed Armor
--
-- Description: Covers the user in cursed spikes. Enemies that hit it become cursed.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = 0
    local duration = 180
    local typeEffect = tpz.effect.DAMAGE_SPIKES

	skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration, 0, 4))
	
	local effect = mob:getStatusEffect(tpz.effect.DAMAGE_SPIKES)
	
	effect:setSubPower(4)
	mob:addMod(tpz.mod.SPIKES, 4)

    return typeEffect
end