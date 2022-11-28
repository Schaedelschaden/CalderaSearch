------------------------
-- Nott
-- Description: Restores HP and MP. Amount restored varies with TP.
-- Used by TRUST Yoran-Oran UC.
-- Skillchain Properties: N/A
-- Modifiers: Max HP / Max MP
-- Amount restored in HP/MP by TP
-- Does not deal damage.
--------------------------------------
require("scripts/globals/msg")
require("scripts/globals/utils")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
---------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local tp        = mob:getLocalVar("NOTT_TP") -- mob:getTP()
    local ftpHp     = fTP(tp, 0.22, 0.33, 0.52)
    local ftpMp     = fTP(tp, 0.15, 0.22, 0.35)
    local restoreHp = ftpHp * mob:getMaxHP()
    local restoreMp = ftpMp * mob:getMaxMP()

    target:addHP(restoreHp)
	target:addMP(restoreMp)

    if mob:getObjType() == tpz.objType.TRUST then
        mob:injectActionPacket(3, 89)
        skill:setMsg(tpz.msg.basic.SELF_HEAL_SECONDARY)
    end

    return restoreHp
end
