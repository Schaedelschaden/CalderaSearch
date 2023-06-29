-----------------------------------------
-- Spell: Flash
-- Temporarily blinds an enemy, greatly lowering its accuracy.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    -- Pull base stats.
    local dINT = (caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND))

    local params = {}
		params.diff = nil
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.DIVINE_MAGIC
		params.bonus =  100
		params.effect = nil

    local resist = applyResistance(caster, target, spell, params)
    local duration = 6 -- * resist
    -- printf("flash.lua onSpellCast  CASTER: [%s]  RESIST: [%1.4f]", caster:getName(), resist)

    if (resist > 0.0625) then
        if (target:addStatusEffect(tpz.effect.FLASH, 200, 0, duration)) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end
	
	if (caster:hasStatusEffect(tpz.effect.DIVINE_EMBLEM)) then
		caster:delStatusEffect(tpz.effect.DIVINE_EMBLEM)
	end
	
	magicReduceAllianceEnmity(caster, target)
	
    return tpz.effect.FLASH
end