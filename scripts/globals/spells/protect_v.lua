-----------------------------------------
-- Spell: Protect V
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local power = 220
	local shieldDEF = 0
    local tier = 5
    local spelllevel = 76
    local duration = calculateDuration(1800, spell:getSkillType(), spell:getSpellGroup(), caster, target, false)
    duration = calculateDurationForLvl(duration, spelllevel, target:getMainLvl())
    local buff = 0
    if target:getMod(tpz.mod.ENHANCES_PROT_SHELL_RCVD) > 0 then
        buff = 2 -- 2x Tier from MOD
    end
	
	-- Add Shield Barrier to base power if the target has a shield equipped
	if (target:hasTrait(26) and target:getShieldSize() ~= 0) then
		local shieldItemID = target:getEquipID(tpz.slot.SUB)
		shieldDEF = caster:getItemMod(shieldItemID, 1) -- Check for shield's DEF
		power = power + shieldDEF
	end

    local power = power + (buff * tier)

    local typeEffect = tpz.effect.PROTECT
        if target:addStatusEffect(typeEffect, power, 0, duration, 0, 0, tier) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    end

    return typeEffect
end