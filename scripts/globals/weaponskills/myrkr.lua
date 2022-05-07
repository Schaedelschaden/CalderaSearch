-----------------------------------
-- Myrkr
-- Staff weapon skill
-- Skill Level: N/A
-- Restores MP and removes status ailments. Amount of MP restored varies with TP. 
-- Available only while equipped with Hvergelmir, Taiaha, +1, +2, +3, or Paikea.
-- Modifiers: Max MP
-- 100%TP    200%TP    300%TP
--  20%       40%       60%
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/status")
require("scripts/globals/weaponskills")

function onUseWeaponSkill(player, target, wsID, tp, primary, action, taChar)
	local removables = {
						tpz.effect.FLASH, tpz.effect.BLINDNESS, tpz.effect.PARALYSIS, tpz.effect.POISON, tpz.effect.SILENCE, tpz.effect.CURSE_I, tpz.effect.CURSE_II, 
						tpz.effect.DISEASE, tpz.effect.PLAGUE, tpz.effect.WEIGHT, tpz.effect.BIND, tpz.effect.BIO, tpz.effect.DIA, tpz.effect.BURN, tpz.effect.FROST,
						tpz.effect.CHOKE, tpz.effect.RASP, tpz.effect.SHOCK, tpz.effect.DROWN, tpz.effect.STR_DOWN, tpz.effect.DEX_DOWN, tpz.effect.VIT_DOWN,
						tpz.effect.AGI_DOWN, tpz.effect.INT_DOWN, tpz.effect.MND_DOWN, tpz.effect.CHR_DOWN, tpz.effect.ADDLE, tpz.effect.SLOW, tpz.effect.HELIX,
						tpz.effect.ACCURACY_DOWN, tpz.effect.ATTACK_DOWN, tpz.effect.EVASION_DOWN, tpz.effect.DEFENSE_DOWN, tpz.effect.MAGIC_ACC_DOWN,
						tpz.effect.MAGIC_ATK_DOWN, tpz.effect.MAGIC_EVASION_DOWN, tpz.effect.MAGIC_DEF_DOWN, tpz.effect.MAX_TP_DOWN, tpz.effect.MAX_MP_DOWN,
						tpz.effect.MAX_HP_DOWN, tpz.effect.DOOM, tpz.effect.GRADUAL_PRETRIFICATION, tpz.effect.MUTE, tpz.effect.BANE
					   }
	local hasRemovable = {}
	local statusCounter = 1
	
	-- Build a list of statuses that the player is afflicted with
	for i = 1, #removables do
		if (player:hasStatusEffect(removables[i])) then
			hasRemovable[statusCounter] = removables[i]
			statusCounter = statusCounter + 1
		end
	end
	
	local removeStatus = {}
	
	-- Pick three statuses from the previous list
	for i = 1, 3 do
		local status = math.random(1, #hasRemovable)
		
		-- If a status has already been picked, pick another one
		if (hasRemovable[status] == 0 and statusCounter >= 1) then
			while (hasRemovable[status] == 0) do
				status = math.random(1, #hasRemovable)
			end
		end
		
		removeStatus[i] = hasRemovable[status]
		hasRemovable[status] = 0
		player:delStatusEffect(removeStatus[i])
		statusCounter = statusCounter - 1
	end

    -- Apply aftermath
    tpz.aftermath.addStatusEffect(player, tp, tpz.slot.MAIN, tpz.aftermath.type.EMPYREAN)

	local maxMP = player:getMaxMP()
    local ftpmp = fTP(tp, 0.2, 0.4, 0.6)
	local mpRestored = maxMP * ftpmp
	
    return 1, 0, false, mpRestored
end