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
    target:takeDamage(dmg)
    skill:setMsg(tpz.msg.basic.DAMAGE)
    if target:getObjType() == tpz.objType.PC then
        target:setCharVar("DOOMVOID", 1)
        target:timer(10000, function(targetArg)
            local rand = math.random(1, 6)
            if rand == 1 then
                targetArg:setPos(278, 0.1, -703, 176, 51) --Bart (Tinnin)
            elseif rand == 2 then
                targetArg:setPos(322, -14, -581, 233, 61) --Nar (Seramaya)
            elseif rand == 3 then
                targetArg:setPos(-766, -12, 632, 239, 79) --TK (Tyger)
            elseif rand == 4 then
                targetArg:setPos(-451, -7, 389, 86, 54) --Ben (Nuhn)
            elseif rand == 5 then
                targetArg:setPos(-34, -32, 481, 221, 52) --Phel (Dea)
            elseif rand == 6 then
                targetArg:setPos(-198, 8, -60, 207, 68) --Ace (Nosferatu)
            end        
        end)
    end
    
    return dmg
end
