-----------------------------------------
-- ID: 21102
-- Item: Mafic Cudgel
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 10

    if (math.random(0, 99) >= chance) then
        return 0, 0, 0
    else
        local dmg = math.random(35, 40)
        local params = {}
        params.bonusmab = 0
        params.includemab = false
        dmg = addBonusesAbility(player, tpz.magic.ele.EARTH, target, dmg, params)
        dmg = dmg * applyResistanceAddEffect(player, target, tpz.magic.ele.EARTH, 0)
        dmg = adjustForTarget(target, dmg, tpz.magic.ele.EARTH)
        dmg = finalMagicNonSpellAdjustments(player, target, tpz.magic.ele.EARTH, dmg)

        local message = tpz.msg.basic.ADD_EFFECT_DMG
        if (dmg < 0) then
            message = tpz.msg.basic.NONE
        end

        return tpz.subEffect.EARTH_DAMAGE, message, dmg
    end
end

function onItemCheck(target, itemCheck)
	local equipID = target:getEquipID(tpz.slot.MAIN)
	
	if (itemCheck == 1 and equipID == 21102) then --Equip
		target:addMod(tpz.mod.SERAPH_STRIKE_DMG, 500)
	end
	
	if (itemCheck == 2 and equipID == 21102) then -- Unequip
		target:delMod(tpz.mod.SERAPH_STRIKE_DMG, 500)
	end
end