-----------------------------------------
-- Spell: Victory March
-- Gives party members Haste
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local sLvl = caster:getSkillLevel(tpz.skill.SINGING) -- Gets skill level of Singing
    local iLvl = caster:getWeaponSkillLevel(tpz.slot.RANGED)

    local power = 43
    local tier  = 2

    if (sLvl+iLvl > 600) then
        power = 163
	elseif (sLvl+iLvl > 300) then
		power = power + math.floor((sLvl+iLvl-300) / 7)
    end

    if (power >= 163) then
        power = 163
    end

    local iBoost = caster:getMod(tpz.mod.MARCH_EFFECT) + caster:getMod(tpz.mod.ALL_SONGS_EFFECT)
    power = power + iBoost*16.25

    if (caster:hasStatusEffect(tpz.effect.SOUL_VOICE)) then
        power = power * 2
    elseif (caster:hasStatusEffect(tpz.effect.MARCATO)) then
        power = power * 1.5
    end
    caster:delStatusEffect(tpz.effect.MARCATO)

    -- convert to new haste system
    power = (power / 1024) * 10000
	
	if (caster:getMod(tpz.mod.AUGMENT_SONGS) > 0) then
		tier = tier + (1000 * caster:getMod(tpz.mod.AUGMENT_SONGS))
	end

    local duration = 120
    duration = duration * ((iBoost * 0.1) + (caster:getMod(tpz.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(tpz.effect.TROUBADOUR)) then
        duration = duration * 2
    end

    if not (target:addBardSong(caster, tpz.effect.MARCH, power, 0, duration, caster:getID(), 0, tier)) then
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end

    return tpz.effect.MARCH
end
