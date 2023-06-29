---------------------------------------------
-- Metallic Body
--
-- Gives the effect of "Stoneskin."
-- Type: Magical
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.STONESKIN
    local power      = 200
    local master     = mob:getMaster()

    -- BST Jug Pet Metallic Body is also given to the BST
    if master ~= nil then
        master:addStatusEffect(typeEffect, power, 0, 300)
    end

    -- Nahn receives a 2500 damage stoneskin
    if mob:getID() == 17317897 then
        power = 2500
    end

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, 300))

    return typeEffect
end
