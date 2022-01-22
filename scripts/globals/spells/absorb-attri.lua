--------------------------------------
-- Spell: Absorb-Attri
-- Steals an enemy's beneficial status effects.
--------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    --get resist multiplier (1x if no resist)
    local params = {}
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.DARK_MAGIC
    local resist = applyResistance(caster, target, spell, params)
	
    local effect = 0
	local bonusEffect = 0
	local countEffects = 0

    if (resist > 0.0625) then
        spell:setMsg(tpz.msg.basic.STATUS_DRAIN)
        effect = caster:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
	
		if (caster:hasStatusEffect(tpz.effect.NETHER_VOID)) then
			bonusEffect = caster:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
			caster:delStatusEffect(tpz.effect.NETHER_VOID)
		end
		
		if (bonusEffect ~= 0) then
			countEffects = 2
		elseif (effect ~= 0) then
			countEffects = 1
		end
	
        if (effect == 0) then
            -- no effect
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return countEffects
end