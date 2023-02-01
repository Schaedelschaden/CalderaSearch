-----------------------------------
-- Moonlight
-- Club weapon skill
-- Skill level: 100
-- Restores MP. Amount restored varies with TP. 
-- Element: None
-- Modifiers: Club Skill
-- 100%TP    200%TP    300%TP
-- 2.25      3.50      4.75
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local skill     = player:getSkillLevel(tpz.skill.CLUB)
    local damage    = skill * 0.11
    local damagemod = damage * fTP(tp, 2.25, 3.50, 4.75)

    damagemod = damagemod * WEAPON_SKILL_POWER

	target:addMP(damagemod)

	action:param(target:getID(), damagemod)

    return 1, 0, false, damagemod
end
