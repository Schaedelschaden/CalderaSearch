---------------------------------------------
-- Raksha Stance
-- Dispels 3 effects. Unlocks Raksha TP moves
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:AnimationSub() == 1 and mob:getHPP() < 50 then
		if mob:getLocalVar("Stance") ~= 1 then
			return 1
		else
			mob:setLocalVar("Stance", 2)

            return 0
		end
    elseif mob:AnimationSub() == 1 and mob:getLocalVar("Stance") < 2 then
		return 0
	else
		return 1
	end
end

function onMobWeaponSkill(target, mob, skill)
    target:dispelStatusEffect(tpz.effectFlag.DISPELABLE)
    target:dispelStatusEffect(tpz.effectFlag.DISPELABLE)
    target:dispelStatusEffect(tpz.effectFlag.DISPELABLE)
	
	mob:AnimationSub(2)
	
	skill:setMsg(tpz.msg.basic.NONE)
end