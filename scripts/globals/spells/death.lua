-----------------------------------------
-- Spell: Death
-- Consumes all MP. Has a chance to knock out the target. If Death fails to knock out the target, it
-- will instead deal darkness damage. Ineffective against undead.
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    --spell:setFlag(tpz.magic.spellFlag.IGNORE_SHADOWS)
	
	-- Bloodeye Vileberry cannot cast Death while above 50% HP
	if (caster:isMob() and caster:getHPP() >= 50 and caster:getID() == 16839068 or caster:getID() == 16839071 or caster:getID() == 16839074) then
		return 1
	else
		return 0
	end
end

function onSpellCast(caster, target, spell)
    if target:isUndead() or target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) or math.random(0, 99) < target:getMod(tpz.mod.DEATHRES) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        return 0
    end

    target:setHP(0)
	
    return 0
end