-----------------------------------------
-- Spell: Drain
-- Drain functions only on skill level!!
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)

    -- Calculate base damage based off Dark Magic Skill. Spell has 20 default damage.
	local DarkMagic = caster:getSkillLevel(tpz.skill.DARK_MAGIC)
    local dmg = (DarkMagic + 20)
	
	if (DarkMagic >= 301) then
		dmg = ((DarkMagic) * (5 / 8)) + 132.5
	end

    --get resist multiplier (1x if no resist)
    local params = {}
    params.diff = caster:getStat(tpz.mod.INT)-target:getStat(tpz.mod.INT)
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.DARK_MAGIC
    params.bonus = 1.0
    local resist = applyResistance(caster, target, spell, params)
    --get the resisted damage
    dmg = dmg*resist
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg)
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement())
    --add in final adjustments

    if (dmg < 0) then
        dmg = 0
    end

    if (target:getHP() < dmg) then
        dmg = target:getHP()
    end

    if (target:isUndead()) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- No effect
        return dmg
    end

    dmg = finalMagicAdjustments(caster,target,spell,dmg)
	
	if caster:hasStatusEffect(tpz.effect.NETHER_VOID) then
		caster:delStatusEffect(tpz.effect.NETHER_VOID)
	end

    caster:addHP(dmg)
    return dmg

end
