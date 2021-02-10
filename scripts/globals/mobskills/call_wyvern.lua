---------------------------------------------
-- Call Wyvern
-- Call my pet.
---------------------------------------------
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:hasPet() or mob:getPet() == nil then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local idAbsoluteVirtue = 16912876

	if (mob:getID() == idAbsoluteVirtue) then
		SpawnMob(idAbsoluteVirtue + 1)
		SpawnMob(idAbsoluteVirtue + 2)
		SpawnMob(idAbsoluteVirtue + 3)
	else
		mob:spawnPet()
	end

    skill:setMsg(tpz.msg.basic.NONE)

    return 0
end