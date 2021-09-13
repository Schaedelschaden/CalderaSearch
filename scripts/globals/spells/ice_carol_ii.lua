-----------------------------------------
-- Spell: Ice Carol II
-- Increases ice resistance for party members within the area of effect.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local sLvl = caster:getSkillLevel(tpz.skill.SINGING) -- Gets skill level of Singing
    local iLvl = caster:getWeaponSkillLevel(tpz.slot.RANGED)

    local power = 40
	local nullChance = 15

    if (sLvl+iLvl > 200) then
        power = power + math.floor((sLvl+iLvl-200) / 10)
    end

    local iBoost = caster:getMod(tpz.mod.CAROL_EFFECT) + caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
    power = power + iBoost*8
	nullChance = nullChance + math.ceil(iBoost * 1.3)

    if (caster:hasStatusEffect(tpz.effect.SOUL_VOICE)) then
        power = power * 2
		nullChance = nullChance * 2
    elseif (caster:hasStatusEffect(tpz.effect.MARCATO)) then
        power = power * 1.5
		nullChance = nullChance * 1.5
    end
    caster:delStatusEffect(tpz.effect.MARCATO)
	
	if (power >= 100) then
        power = 100
    end
	
	if (nullChance > 40) then
		nullChance = 40
	end
	
	if (caster:getMod(tpz.mod.AUGMENT_SONGS) > 0) then
		power = power + (1000 * caster:getMod(tpz.mod.AUGMENT_SONGS))
	end

    local duration = 120
    duration = duration * ((iBoost * 0.1) + (caster:getMod(tpz.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(tpz.effect.TROUBADOUR)) then
        duration = duration * 2
    end

    if not (target:addBardSong(caster, tpz.effect.CAROL, power, 0, duration, caster:getID(), tpz.magic.ele.ICE, nullChance)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.CAROL
end