---------------------------------------------
-- Pyric Bulwark
--
-- Description: Grants a Physical Shield effect for a time.
-- Type: Enhancing
--
-- Range: Self
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)

  if (mob:getFamily() == 316) then
    local mobSkin = mob:getModelId()

    if (mobSkin == 1796) then
        return 0
    else
        return 1
    end
  end

   if (mob:AnimationSub() == 0 and mob:getLocalVar("Bulwark") == 0) then
      return 0
   else
      return 1
   end
end

function onMobWeaponSkill(target, mob, skill)

    -- addEx to pervent dispel
    mob:addStatusEffectEx(tpz.effect.PHYSICAL_SHIELD, 0, 2, 0, 45)
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    if (mob:getFamily() == 313) then -- Tinnin follows this up immediately with Nerve Gas
        mob:useMobAbility(1580)
    end
	
	mob:setLocalVar("Bulwark", 1)
	mob:setLocalVar("BulwarkTime", os.time())

    return tpz.effect.PHYSICAL_SHIELD
end