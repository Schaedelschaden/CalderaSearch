---------------------------------------------------
-- Magic Mortar
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    return master:countEffect(tpz.effect.LIGHT_MANEUVER)
end

function onPetAbility(target, automaton, skill, master, action)
    local ftp
    local tp = skill:getTP()

    if not USE_ADOULIN_WEAPON_SKILL_CHANGES then
        ftp = 0.5 + ((0.5 / 3000) * tp)
    else
        -- Might be wrong, it may only use max hp in its new form, also it may be able to miss and take defense into account as well
        if tp >= 3000 then
            ftp = 6.5 + ((1.00 / 3000) * tp) -- 2.5
        elseif tp >= 2000 then
            ftp = 5.75 + ((0.75 / 3000) * tp) -- 1.75
        else
            ftp = 5.5 + ((0.25 / 3000) * tp) -- 1.5
        end
    end

    local hpdamage = (automaton:getMaxHP() - automaton:getHP()) * ftp
    local skilldamage = automaton:getSkillLevel(tpz.skill.AUTOMATON_MELEE) * ftp
    local damage = (hpdamage > skilldamage) and hpdamage or skilldamage

    if damage > 0 then
       target:addTP(20)
       automaton:addTP(80)
    end

    target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
    return damage
end