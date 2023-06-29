---------------------------------------------------
-- zantetsuken
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    
    if mob:getObjType() == tpz.objType.TRUST then
        local target = mob:getMaster():getTarget()
    end
    
    if (target:isNM()) then
        local dmg = (target:getMaxHP() * 0.15)
    
        if (dmg > 99999) then
            dmg = 99999
        end
        target:takeDamage(dmg)
        mob:setHP(0)
        return dmg
    else
        local chance = (100 * 1.2) / skill:getTotalTargets()
		local rollRandom = math.random(0,99)
--		printf("Zantetsuken PET onPetAbility CHANCE: [%f]  RANDOM: [%i]\n", chance, rollRandom)
        if rollRandom < chance and target:getAnimation() ~= 33 then
            skill:setMsg(tpz.msg.basic.SKILL_ENFEEB_IS)
            target:takeDamage(target:getHP())
			return tpz.effect.KO
        else
            skill:setMsg(tpz.msg.basic.EVADES)
			return 0
        end
        mob:setHP(0)
    end
end
