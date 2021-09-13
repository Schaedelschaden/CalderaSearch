---------------------------------------------------
-- Nether Blast
-- Deals dark elemental damage.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local duration = 90
	
	target:addStatusEffect(tpz.effect.NIGHTMARE, 1, 0, duration)
	target:addStatusEffect(tpz.effect.SLEEP_I, 1, 0, duration)
	target:addStatusEffect(tpz.effect.BIO, 2, 3, duration)
	
	skill:setMsg(tpz.msg.basic.SKILL_ENFEEB)
	
	return tpz.effect.SLEEP_I
end