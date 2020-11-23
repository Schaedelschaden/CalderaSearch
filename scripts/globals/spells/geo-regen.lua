-----------------------------------------
-- Spell: Geo-Regen
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
    local geo_skill = caster:getCharSkillLevel(tpz.skill.GEOMANCY)
    local power = (geo_skill / 20) / 10
    if power < 1 then
        power = 1
    end

    tpz.geo.spawnLuopan(caster, target, spell, tpz.effect.GEO_REGEN, power, tpz.auraTarget.ALLIES)
end