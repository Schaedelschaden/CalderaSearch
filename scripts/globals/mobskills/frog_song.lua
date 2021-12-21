---------------------------------------------
-- Frog Song
-- Family: Poroggo
-- Description: Charms target and transforms them into a frog.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Single Target
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
		
		target:setLocalVar("FROG_SONG_USED", os.time())
	
		target:addListener("TICK", "FROG_SONG_USED", function(target)
			if (os.time() - target:getLocalVar("FROG_SONG_USED") == 5 and target:isPC()) then
				target:costume(1811)
				target:removeListener("FROG_SONG_USED")
			end
		end)
    end
		
    skill:setMsg(msg)

    return typeEffect
end