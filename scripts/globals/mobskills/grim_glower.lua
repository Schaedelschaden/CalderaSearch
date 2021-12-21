---------------------------------------------
-- Grim Glower
-- Stares with glowing eyes that petrifies any target that makes eye contact.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	mob:AnimationSub(1)
	
	if (mob:getID() == 16838872 or mob:getID() == 16839070 or mob:getID() == 16839073) then
		mob:setLocalVar("Kukulkan_YellowEyes", os.time())
	end
	
	skill:setMsg(tpz.msg.basic.NONE)

    return
end
