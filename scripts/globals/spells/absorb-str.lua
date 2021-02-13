--------------------------------------
-- Spell: Absorb-STR
-- Steals an enemy's strength.
--------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)

    if (target:hasStatusEffect(tpz.effect.STR_DOWN) or caster:hasStatusEffect(tpz.effect.STR_BOOST)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect
    else
        local dINT = caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT)
        local params = {}
        params.diff = nil
        params.attribute = tpz.mod.INT
        params.skillType = 37
        params.bonus = 0
        params.effect = nil
        local resist = applyResistance(caster, target, spell, params)
		
		local globalMult = ABSORB_SPELL_AMOUNT
		local baseAbsorb = math.floor(3 + (caster:getMainLvl() / 5)) * globalMult
		local GearMods = (100 + caster:getMod(tpz.mod.AUGMENTS_ABSORB)) / 100
		local NVBonus = (100 + caster:getMod(tpz.mod.NETHER_VOID_BONUS)) / 100
		local Absorb = math.floor(math.floor(baseAbsorb * GearMods) * NVBonus)
		
		if caster:hasStatusEffect(tpz.effect.NETHER_VOID) then
			caster:delStatusEffect(tpz.effect.NETHER_VOID)
		end
		
		local duration = calculateDuration(90, spell:getSkillType(), spell:getSpellGroup(), caster, target)
		
        if (resist <= 0.125) then
            spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_ABSORB_STR)
            caster:addStatusEffect(tpz.effect.STR_BOOST, Absorb, ABSORB_SPELL_TICK, duration) -- caster gains STR
            target:addStatusEffect(tpz.effect.STR_DOWN, Absorb, ABSORB_SPELL_TICK, duration) -- target loses STR
        end
    end
    return tpz.effect.STR_DOWN
end