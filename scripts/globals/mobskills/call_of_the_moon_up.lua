---------------------------------------------
--  Call of the Moon (Two-legged)
--  Howls at the moon to intimidate attackers.
--  Utsusemi/Blink absorb: Ignores Shadows
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if (mob:AnimationSub() == 1) then
		return 0
	else
		mob:useMobAbility(2172)
		return 1
	end
end

function onMobWeaponSkill(target, mob, skill)
	mob:setMod(tpz.mod.HUMANOID_KILLER, 15)
	mob:setLocalVar("CalloftheMoon", os.time())
	skill:setMsg(tpz.msg.basic.NONE)
	mob:setTP(0)
end