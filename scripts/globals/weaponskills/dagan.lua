------------------------
--    Dagan     --
-- Description: Restores HP and MP. Amount restored varies with TP. Gambanteinn: Aftermath.
-- Acquired permanently by completing the appropriate Walk of Echoes Weapon Skill Trials.
-- Can also be used by equipping Gambanteinn (85), Gambanteinn (90), Canne de Combat +1 or Canne de Combat +2.
-- Skillchain Properties: N/A
-- Modifiers: Max HP / Max MP
-- Amount restored in HP/MP by TP
-- Does not deal damage.
--------------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
---------------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    if player:isPC() then
        -- Apply aftermath
        tpz.aftermath.addStatusEffect(player, tp, tpz.slot.MAIN, tpz.aftermath.type.EMPYREAN)
    end

    local ftpHp     = fTP(tp, 0.22, 0.33, 0.52)
    local ftpMp     = fTP(tp, 0.15, 0.22, 0.35)
    local restoreHp = ftpHp * player:getMaxHP()
    local restoreMp = ftpMp * player:getMaxMP()

    -- Only add HP, MP is handled in the return
    target:addHP(restoreHp)

    -- Structure: damage, tphitslanded, extra hits landed, MP restore
    return 1, 0, false, restoreMp
end
