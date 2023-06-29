---------------------------------------------
--  Overhead Slash (Ironclad "standard" attack)
--
--  Additional effect: Stun.
--  Type: Physical (Slashing)
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
    local accmod  = 2
    local dmgmod  = 2

    if mob:getID() == 17662498 then -- Ironclad Severer
        local roll = math.random(1, 100)

        if roll <= 25 then
            numhits = math.random(2, 4)
        elseif roll > 25 and roll <= 50 then
            dmgmod = math.random(3, 5) + math.random()
        end
    end

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, 1, 2, 3)
    local dmg  = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)

	if
        dmg > 0 and
        math.random(1, 100) > target:getMod(tpz.mod.STUNRES)
    then
		target:addStatusEffectEx(tpz.effect.STUN, tpz.effect.STUN, 1, 0, 3)
	end

	if info.hitslanded == 0 and dmg == 0 then
        skill:setMsg(tpz.msg.basic.NORMAL_MISS)
    elseif info.hitslanded == 1 and dmg == 1 then
        skill:setMsg(tpz.msg.basic.SHADOW_ABSORB)

        return info.hitslanded
    else
        skill:setMsg(tpz.msg.basic.HIT_DMG)
        mob:addTP(200)
    end

    return dmg
end 
