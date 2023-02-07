-----------------------------------------
-- Spell: Goddess's Hymnus
-- Grants Reraise.
-----------------------------------------

require("scripts/globals/status")

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local power = 1
	
	if (caster:getMod(tpz.mod.AUGMENT_SONGS) > 0) then
		power = power + (1000 * caster:getMod(tpz.mod.AUGMENT_SONGS))
	end

    local duration = 120

    duration = duration + (duration * (caster:getMod(tpz.mod.SONG_DURATION_BONUS)/100))

    target:addBardSong(caster, tpz.effect.HYMNUS, power, 0, duration, caster:getID(), 0, 1)

    return tpz.effect.HYMNUS
end