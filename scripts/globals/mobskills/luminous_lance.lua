---------------------------------------------
--  Luminous Lance
---------------------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local lanceTime = mob:getLocalVar("lanceTime")
    local lanceOut = mob:getLocalVar("lanceOut")
    if (not (target:hasStatusEffect(tpz.effect.PHYSICAL_SHIELD) and target:hasStatusEffect(tpz.effect.MAGIC_SHIELD)))
        and (lanceTime + 60 < mob:getBattleTime()) and target:getCurrentAction() ~= tpz.act.MOBABILITY_USING
        and lanceOut == 1 then

        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    mob:showText(mob, ID.text.SELHTEUS_TEXT + 1)

    local numhits = 1
    local accmod = 1
    local dmgmod = 4

    local info = MobRangedMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)

    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.PIERCING, info.hitslanded)
    
    if mob:getObjType() == tpz.objType.TRUST then
        dmg = dmg * (mob:getMainLvl() / 2.5)
    end

    mob:entityAnimationPacket("ids0")
    mob:setLocalVar("lanceTime", mob:getBattleTime())
    mob:setLocalVar("lanceOut", 0)
    target:AnimationSub(3)

    -- Cannot be resisted
    target:addStatusEffect(tpz.effect.STUN, 1, 0, 30)

    return dmg
end
