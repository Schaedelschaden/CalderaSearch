---------------------------------------------
-- No name
-- Abyssea red !! stagger
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local ID = zones[target:getZoneID()]

    mob:addStatusEffectEx(tpz.effect.TERROR, tpz.effect.TERROR, 1, 0, 30)

    player:messageSpecial(ID.text.STAGGERED, 0)
    player:messageSpecial(ID.text.RED_STAGGER, 0)
    
    return 0
end
