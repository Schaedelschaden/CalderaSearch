---------------------------------------------
--  Cytokinesis
--
--  Description: Calls forth reinforcements. (Deals AoE damage to enemies in range, applies Weight and knockback.)
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: 18' radial
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 3
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_1_SHADOW)
	
	local typeEffect = tpz.effect.WEIGHT
    MobStatusEffectMove(mob, target, typeEffect, 50, 0, 120)
	
	local mobID = mob:getID()
	local petSpawns = mob:getLocalVar("Fistule_PetSpawns")
	
	-- Fistule spawns Pustules
	if (mobID == 16838913) then
		if (mob:getHPP() <= 83 and petSpawns == 0) then
			for Pustule = mob:getID() + 1, mob:getID() + 2 do
				SpawnMob(Pustule, 300):updateEnmity(target)
			end
			mob:setLocalVar("Fistule_PetSpawns", 1)
		elseif (mob:getHPP() <= 66 and petSpawns == 1) then
			for Pustule = mob:getID() + 3, mob:getID() + 4 do
				SpawnMob(Pustule, 300):updateEnmity(target)
			end
			mob:setLocalVar("Fistule_PetSpawns", 2)
		elseif (mob:getHPP() <= 49 and petSpawns == 2) then
			for Pustule = mob:getID() + 5, mob:getID() + 6 do
				SpawnMob(Pustule, 300):updateEnmity(target)
			end
			mob:setLocalVar("Fistule_PetSpawns", 3)
		elseif (mob:getHPP() <= 33 and petSpawns == 3) then
			for Pustule = mob:getID() + 7, mob:getID() + 8 do
				SpawnMob(Pustule, 300):updateEnmity(target)
			end
			mob:setLocalVar("Fistule_PetSpawns", 4)
		elseif (mob:getHPP() <= 16 and petSpawns == 4) then
			for Pustule = mob:getID() + 9, mob:getID() + 10 do
				SpawnMob(Pustule, 300):updateEnmity(target)
			end
		end
	end
	
    return dmg
end