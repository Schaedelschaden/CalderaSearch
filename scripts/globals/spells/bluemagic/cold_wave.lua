-----------------------------------------
-- Spell: Cold Wave
-- Deals ice damage that lowers Agility and gradually reduces HP of enemies within range.
-- Spell cost: 37 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 1
-- Stat Bonus: INT-1
-- Level: 52
-- Casting Time: 4 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Induration, Distortion, and Darkness
-- Combos: Auto Refresh
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local casterLvl = caster:getMainLvl()
	local duration = 90
	local sINT = caster:getStat(tpz.mod.INT)
	local DOT = math.ceil((casterLvl / 5) + 3)
    local effect = target:getStatusEffect(typeEffect)
    local params = {}
		params.diff = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
		
    local resist = applyResistance(caster, target, spell, params)
	duration = duration * resist

    if (target:hasStatusEffect(tpz.effect.BURN)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    elseif (resist >= 0.33) then
        target:delStatusEffect(tpz.effect.CHOKE)
        target:delStatusEffect(tpz.effect.FROST)
		
        target:addStatusEffect(tpz.effect.FROST, DOT, 3, duration)
		spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end

    return typeEffect
end