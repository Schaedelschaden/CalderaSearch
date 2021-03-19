------------------------
--    Moonlight     --
------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
    local skill = player:getSkillLevel(11) -- get club skill
	local ftp = 1
	
	if (tp >= 1000 and tp < 2000) then
		ftp = 2.25
	elseif (tp >= 2000 and tp < 3000) then
		ftp = 3.5
	elseif (tp == 3000) then
		ftp = 4.75
	end
	
    local damagemod = (skill * 0.11) * ftp
    damagemod = damagemod * WEAPON_SKILL_POWER
	
	if (player:getEquipID(tpz.slot.MAIN) == 21103) then
		damagemod = damagemod * 4
	end
	
    return 1, 0, false, damagemod
end