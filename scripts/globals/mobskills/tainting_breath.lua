---------------------------------------------
-- Tainting Breath
-- Family: Morbol
-- Description: A horrific curse turning those within a cone into Morbols and under the control of Eccentric Eve.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Conal 15'
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
		
		target:setLocalVar("TAINTING_BREATH_USED", os.time())
	
		target:addListener("TICK", "TAINTING_BREATH_USED", function(target)
			if (os.time() - target:getLocalVar("TAINTING_BREATH_USED") == 4) then
				target:costume(381)
				target:removeListener("TAINTING_BREATH_USED")
			end
		end)
    end
	
    skill:setMsg(msg)

    return typeEffect
end
