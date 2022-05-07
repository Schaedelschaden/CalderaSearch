-----------------------------------
-- Energy Steal
-- Dagger weapon skill
-- Skill level: 150
-- Steals enemy's MP. Amount stolen varies with TP. 
-- Element: Dark
-- Modifiers: MND:100%
-- 100%TP    200%TP    300%TP
-- 1.00       1.00      1.00
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.ftp100 = 1 params.ftp200 = 1 params.ftp300 = 1
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 1.0 params.chr_wsc = 0.0
    params.ele = tpz.magic.ele.DARK
    params.skill = tpz.skill.DAGGER
    params.includemab = true
	params.doesNoDamage = true -- Prevents the weaponskill from doing damage and waking up the target

    local damage, criticalHit, tpHits, extraHits = doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
	
	if (damage > 50) then
		damage = fTP(tp, 10, 25, 50)
	end
	
	action:messageID(target:getID(), tpz.msg.basic.MP_DRAINED)
	
	if (target:getMP() >= damage and target:getMP() > 0) then
		player:addMP(damage)
		target:delMP(damage)
	elseif (target:getMP() < damage and target:getMP() > 0) then
		damage = target:getMP()
		player:addMP(damage)
		target:delMP(damage)
	else
		damage = 0
		action:messageID(target:getID(), tpz.msg.basic.NO_EFFECT)
	end
	
	action:param(target:getID(), damage)
	
    return tpHits, extraHits, criticalHit, damage
end