-----------------------------------------
-- Spell: Geo-Attunement
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/geo")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    if caster:getPet() ~= nil then
        return tpz.msg.basic.LUOPAN_ALREADY_PLACED
    elseif not caster:canUseMisc(tpz.zoneMisc.PET) then
        return tpz.msg.basic.CANT_BE_USED_IN_AREA
    else
        return 0
    end
end

function onSpellCast(caster, target, spell)
    local skill = caster:getSkillLevel(tpz.skill.GEOMANCY)
	
	if (caster:getWeaponSkillType(tpz.slot.RANGED) == tpz.skill.HANDBELL) then
		skill = skill + caster:getSkillLevel(tpz.skill.HANDBELL)
	end
	
    local power = (skill / 13.8462) + (GeomancyPotency(caster) * 6)
	
    if power < 1 then
        power = 1
    end

    tpz.geo.spawnLuopan(caster, target, spell, tpz.effect.GEO_MAGIC_EVASION_BOOST, power, tpz.auraTarget.ALLIES)
end