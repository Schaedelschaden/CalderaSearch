---------------------------------------------
-- Frog Vhorus
-- Family: Poroggo
-- Description: Charms all targets in an area of effect and transforms them into frogs.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Radial
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.CHARM_I
    local power = 2 -- Indicates that this Charm will apply a costume to the affected players

    if (not target:isPC()) then
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
        return typeEffect
    end
       
	local msg = MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)
    if (msg == tpz.msg.basic.SKILL_ENFEEB_IS) then
        mob:charm(target)
		
		target:setLocalVar("FROG_CHORUS_USED", os.time())
	
		target:addListener("TICK", "FROG_CHORUS_USED", function(target)
			if (os.time() - target:getLocalVar("FROG_CHORUS_USED") == 5 and target:isPC()) then
				target:costume(1811)
				target:removeListener("FROG_CHORUS_USED")
			end
		end)
    end
		
    skill:setMsg(msg)

    return typeEffect
end