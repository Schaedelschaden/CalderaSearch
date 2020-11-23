-----------------------------------------
-- Spell: Alexander
-- Summons Alexander to fight by your side
-----------------------------------------
require("scripts/globals/summon")
require("scripts/globals/bcnm")
require("scripts/globals/pets")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (not caster:canUseMisc(tpz.zoneMisc.PET)) then
        return tpz.msg.basic.CANT_BE_USED_IN_AREA
    elseif (not caster:hasStatusEffect(tpz.effect.ASTRAL_FLOW)) then
        return tpz.msg.basic.MAGIC_MUST_ASTRAL_FLOW
    elseif (caster:hasPet()) then
        return tpz.msg.basic.ALREADY_HAS_A_PET
    elseif (caster:getObjType() == tpz.objType.PC) then
        return avatarMiniFightCheck(caster)
    end
    return 0
end

function onSpellCast(caster,target,spell)
    caster:spawnPet(tpz.pet.id.ALEXANDER)
	
    local pet = caster:getPet()
	local bloodpact = 2143 -- mob_skill_id from mob_skills.sql

--	printf("Spell: Alexander onSpellCast SUMMON ALEXANDER")

	-- Create a listener for the end of Perfect Defense to despawn Alexander
    pet:addListener("WEAPONSKILL_STATE_EXIT", "PERFECT_DEFENSE_END", function(pet, skill)
       local master = pet:getMaster()
       master:despawnPet()
       pet:removeListener("PERFECT_DEFENSE_END")
    end)
	
	pet:useMobAbility(bloodpact, caster)
	
	return 0
end