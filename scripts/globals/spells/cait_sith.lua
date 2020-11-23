-----------------------------------------
-- Spell: Cait Sith
-- Summons Cait Sith to fight by your side
-----------------------------------------
require("scripts/globals/summon")
require("scripts/globals/pets")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    if (not caster:canUseMisc(tpz.zoneMisc.PET)) then
        return tpz.msg.basic.CANT_BE_USED_IN_AREA
    elseif (caster:hasPet()) then
        return tpz.msg.basic.ALREADY_HAS_A_PET
    else
        return 0
    end
end

function onSpellCast(caster, target, spell)
    tpz.pet.spawnPet(caster, tpz.pet.id.CAIT_SITH)
    return 0
end