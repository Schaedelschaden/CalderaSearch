---------------------------------------------------
-- Gorger NM Fission Skill
-- Checks eligibility to use
-- maxBabies set by NM lua
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local momma = mob:getID()
    local fam = 1
    for i = momma + 1, momma + mob:getLocalVar("maxBabies") do
        local baby = GetMobByID(i)
        if not baby:isSpawned() then
            fam = 0
            break
        end
    end
    return fam
end

function onMobWeaponSkill(target, mob, skill)
    local momma = mob:getID()
    local pos = mob:getPos()
	local alreadyPopped = false
	
    for babyID = momma + 1, momma + mob:getLocalVar("maxBabies") do
		local baby = GetMobByID(babyID)

		SpawnMob(babyID):updateEnmity(target)
		
		if (babyID == momma + 1) then
			baby:setPos(pos.x + 3 , pos.y, pos.z + 3)
		elseif (babyID == momma + 2) then
			baby:setPos(pos.x - 3 , pos.y, pos.z - 3)
		elseif (babyID == momma + 3) then
			baby:setPos(pos.x - 3 , pos.y, pos.z + 3)
		elseif (babyID == momma + 4) then
			baby:setPos(pos.x + 3 , pos.y, pos.z - 3)
		end
    end
	
	skill:setMsg(tpz.msg.basic.NONE)
end