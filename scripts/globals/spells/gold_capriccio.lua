-----------------------------------------
-- Spell: Gold Capriccio
-- Enhances resistance against petrification for party members within area of effect. 
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

    local power = 10

    if (sLvl+iLvl > 200) then
        power = power + math.floor((sLvl+iLvl-200) / 116)
    end

    if (power >= 16) then
        power = 16
    end

    local iBoost = caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
    power = power + iBoost * 2

	if (caster:hasStatusEffect(tpz.effect.SOUL_VOICE)) then
        power = power * 2
    elseif (caster:hasStatusEffect(tpz.effect.MARCATO)) then
        power = power * 1.5
    end
    caster:delStatusEffect(tpz.effect.MARCATO)
	
	if (caster:getMod(tpz.mod.AUGMENT_SONGS) > 0) then
		power = power + (1000 * caster:getMod(tpz.mod.AUGMENT_SONGS))
	end

    local duration = 120
    duration = duration * ((iBoost * 0.1) + (caster:getMod(tpz.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(tpz.effect.TROUBADOUR)) then
        duration = duration * 2
    end

    if not (target:addBardSong(caster, tpz.effect.CAPRICCIO, power, 0, duration, caster:getID(), tpz.magic.ele.WIND, 1)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.CAPRICCIO
end