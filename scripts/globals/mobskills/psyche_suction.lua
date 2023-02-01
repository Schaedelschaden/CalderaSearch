---------------------------------------------
--  Psyche Suction
--
--  Description: Drains HP and absorbs attributes of all targets within area of effect.
--  Type: Magical (Dark)
--
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

local statEffects =
{
    {tpz.effect.STR_BOOST, tpz.effect.STR_DOWN},
    {tpz.effect.DEX_BOOST, tpz.effect.DEX_DOWN},
    {tpz.effect.VIT_BOOST, tpz.effect.VIT_DOWN},
    {tpz.effect.AGI_BOOST, tpz.effect.AGI_DOWN},
    {tpz.effect.INT_BOOST, tpz.effect.INT_DOWN},
    {tpz.effect.MND_BOOST, tpz.effect.MND_DOWN},
    {tpz.effect.CHR_BOOST, tpz.effect.CHR_DOWN},
}

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	local dmgmod = 1
    local info   = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 6, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg    = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    
	skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg))

    for i = 1, 7 do
        local debuffPower = math.random(100, 200)

        if not mob:hasStatusEffect(statEffects[i][1]) then
            mob:addEffect(statEffects[i][1], debuffPower, 3, 60)
        else
            local effect = mob:getStatusEffect(statEffects[i][1])

            effect:setPower(effect:getPower() + debuffPower)
        end

        target:addEffect(statEffects[i][2], debuffPower, 3, 60)
    end

    return dmg
end
