-----------------------------------------
-- Spell: Dream Flower
-- Puts all enemies within range to sleep.
-- Spell cost: 87 MP
-- Monster Type: Plantoids
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 3
-- Stat Bonus: HP+5 MP+5 CHR+2
-- Level: 87
-- Casting Time: 2.5 seconds
-- Recast Time: 45 seconds
-- Duration: 90-120 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: Magic Attack Bonus
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local typeEffect = tpz.effect.SLEEP_II
    local dINT = (caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
    local params = {}
		params.diff = nil
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
		params.bonus = 0
		params.effect = typeEffect
    local resist = applyResistanceEffect(caster, target, spell, params)
    local duration = 120 * resist

--	printf("Dream Flower onSpellCast DURATION: [%i]  RESIST: [%f]\n", duration, resist)
    if (resist > 0.75) then -- Do it!
        if (target:addStatusEffect(typeEffect,1,0,duration)) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return typeEffect
end