---------------------------------------------
-- Necrobane
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
  -- if(mob:getFamily() == 316) then
    -- local mobSkin = mob:getModelId()

    -- if (mobSkin == 1840) then
        -- return 0
    -- else
        -- return 1
    -- end
  -- end
  -- if(mob:getFamily() == 91) then
    -- local mobSkin = mob:getModelId()

    -- if (mobSkin == 1839) then
        -- return 0
    -- else
        -- return 1
    -- end
  -- end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.PARALYSIS
    local typeEffect2 = tpz.effect.CURSE_I

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect1, 25, 0, 60))
    MobStatusEffectMove(mob, target, typeEffect2, 25, 0, 60)

    return typeEffect1
end
