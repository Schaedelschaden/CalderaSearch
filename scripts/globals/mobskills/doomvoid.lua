---------------------------------------------
-- Doomvoid
--
-- Description: eats player and poops them out somewhere else.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmg = 666

    if mob:getLocalVar("DV_TOTAL_TARGS") < 1 then
        mob:setLocalVar("DV_TOTAL_TARGS", skill:getTotalTargets() - 1)
        mob:setLocalVar("TARGET_POS", math.random(1, 6))
        mob:setLocalVar("darkness", 0)
    elseif mob:getLocalVar("DV_TOTAL_TARGS") >= 1 then
        mob:setLocalVar("DV_TOTAL_TARGS", mob:getLocalVar("DV_TOTAL_TARGS") - 1)
    end

    target:setLocalVar("TARGET_POS", mob:getLocalVar("TARGET_POS"))

    target:takeDamage(dmg)

    skill:setMsg(tpz.msg.basic.DAMAGE)

    if target:getObjType() == tpz.objType.PC then
        target:setCharVar("DOOMVOID", 1)

        target:timer(10000, function(targetArg)
            local targetZone = targetArg:getLocalVar("TARGET_POS")

            if targetZone == 1 then
                targetArg:setPos(278, 0.1, -703, 176, 51) --Bart (Tinnin)
            elseif targetZone == 2 then
                targetArg:setPos(322, -14, -581, 233, 61) --Nar (Seramaya)
            elseif targetZone == 3 then
                targetArg:setPos(-766, -12, 632, 239, 79) --TK (Tyger)
            elseif targetZone == 4 then
                targetArg:setPos(-451, -7, 389, 86, 54) --Ben (Nuhn)
            elseif targetZone == 5 then
                targetArg:setPos(-34, -32, 481, 221, 52) --Phel (Dea)
            elseif targetZone == 6 then
                targetArg:setPos(-198, 8, -60, 207, 68) --Ace (Nosferatu)
            end        
        end)
    end

    return dmg
end
