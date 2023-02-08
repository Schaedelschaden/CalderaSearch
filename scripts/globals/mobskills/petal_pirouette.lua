---------------------------------------------
-- Petal Pirouette
--
-- Description: Whirling petals reduce tp to zero.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (mob:getName() == "Chaneque") then

        if target:getObjType() == tpz.objType.TRUST then
            target:setHP(0)
        end

        if target:getObjType() == tpz.objType.PC then
            if target:getEquipID(tpz.slot.MAIN) == 0 and
                target:getEquipID(tpz.slot.SUB) == 0 and
                target:getEquipID(tpz.slot.HEAD) == 26705 and --Mandragora Masque
                target:getEquipID(tpz.slot.BODY) == 27854 and --Mandy suit
                target:getEquipID(tpz.slot.AMMO) == 0 and
                target:getEquipID(tpz.slot.HANDS) == 0 and
                target:getEquipID(tpz.slot.LEGS) == 0 and
                target:getEquipID(tpz.slot.RANGED) == 0 and
                target:getEquipID(tpz.slot.NECK) == 0 and
                target:getEquipID(tpz.slot.WAIST) == 0
            then
                target:setTP(3000)
                skill:setMsg(tpz.msg.basic.TP_INCREASE) -- TP spike if you have mandy suit on
                return 3000
            elseif target:getEquipID(tpz.slot.MAIN) == 0 and --totally naked is a TP reduction and hate reset.
                target:getEquipID(tpz.slot.SUB) == 0 and
                target:getEquipID(tpz.slot.HEAD) == 0 and
                target:getEquipID(tpz.slot.BODY) == 0 and
                target:getEquipID(tpz.slot.AMMO) == 0 and
                target:getEquipID(tpz.slot.HANDS) == 0 and
                target:getEquipID(tpz.slot.LEGS) == 0 and
                target:getEquipID(tpz.slot.RANGED) == 0 and
                target:getEquipID(tpz.slot.NECK) == 0 and
                target:getEquipID(tpz.slot.WAIST) == 0
            then
                local tpReduced = 0
                target:setTP(0)
                mob:resetEnmity(target)

                skill:setMsg(tpz.msg.basic.TP_REDUCED)
                return tpReduced
            else
                target:warp()
                skill:setMsg(tpz.msg.basic.TP_REDUCED)
                return tpReduced
            end
        end
    else
        local tpReduced = 0
        target:setTP(tpReduced)

        skill:setMsg(tpz.msg.basic.TP_REDUCED)
        return tpReduced
    end
end
