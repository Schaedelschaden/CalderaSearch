-----------------------------------------
-- ID: 17830
-- Item: Wooden Katana
-- Additional Effect: Varies based on server event
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
	-- local ID = target:getID()

    -- if (ID == 17301537 or ID == 17301538) then
        -- local dmg = math.random(2400, 2600)
        -- local params = {}
        -- params.bonusmab = 0
        -- params.includemab = false
        -- dmg = addBonusesAbility(player, tpz.magic.ele.THUNDER, target, dmg, params)
        -- dmg = dmg * applyResistanceAddEffect(player, target, tpz.magic.ele.THUNDER, 0)
        -- dmg = adjustForTarget(target, dmg, tpz.magic.ele.THUNDER)
        -- dmg = finalMagicNonSpellAdjustments(player, target, tpz.magic.ele.THUNDER, dmg)

        -- local message = tpz.msg.basic.ADD_EFFECT_DMG
        -- if (dmg < 0) then
            -- message = tpz.msg.basic.ADD_EFFECT_HEAL
        -- end

        -- return tpz.subEffect.LIGHTNING_DAMAGE, message, dmg
    -- end
end