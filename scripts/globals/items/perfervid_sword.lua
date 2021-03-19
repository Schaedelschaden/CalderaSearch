-----------------------------------------
-- ID: 20716
-- Item: Perfervid Sword
-- Additional Effect: Fire Damage
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
        dmg = addBonusesAbility(player, tpz.magic.ele.FIRE, target, dmg, params)
        dmg = dmg * applyResistanceAddEffect(player, target, tpz.magic.ele.FIRE, 0)
        dmg = adjustForTarget(target, dmg, tpz.magic.ele.FIRE)
        dmg = finalMagicNonSpellAdjustments(player, target, tpz.magic.ele.FIRE, dmg)

        local message = tpz.msg.basic.ADD_EFFECT_DMG
        if (dmg < 0) then
            message = tpz.msg.basic.NONE
        end

        return tpz.subEffect.FIRE_DAMAGE, message, dmg
    end
end

function onItemCheck(target, itemCheck)
	local equipID = target:getEquipID(tpz.slot.MAIN)
	
	if (itemCheck == 1 and equipID == 20716) then --Equip
		target:addMod(tpz.mod.RED_LOTUS_BLADE_DMG, 600)
	end
	
	if (itemCheck == 2 and equipID == 20716) then -- Unequip
		target:delMod(tpz.mod.RED_LOTUS_BLADE_DMG, 600)
	end
end