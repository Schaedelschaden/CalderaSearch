---------------------------------------------
--  Shield Bash
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onPetAbility(target, automaton, skill, master, action)
    local chance = 90
    local damage = (automaton:getSkillLevel(tpz.skill.AUTOMATON_MELEE)/2) + automaton:getMod(tpz.mod.SHIELD_BASH)
    local spell  = getSpell(252)
    local params = {}
			params.diff      = 0
			params.skillType = tpz.skill.AUTOMATON_MELEE
			params.bonus     = 0
    local resist = applyResistance(player, target, spell, params)

    damage = math.floor(damage)

    chance = chance + (automaton:getMainLvl() - target:getMainLvl()) * 5

    if
        math.random(1, 100) < chance and
        resist > 0.25
    then
        target:addStatusEffect(tpz.effect.STUN, 1, 0, 4)
    end

    local slowPower = automaton:getMod(tpz.mod.AUTO_SHIELD_BASH_SLOW)

    if slowPower > 0 then
        local duration = 20
        if slowPower == 12 then
            duration = math.random(20, 35)
        elseif slowPower == 19 then
            duration = math.random(51, 57)
        elseif slowPower == 25 then
            duration = math.random(70, 75)
        end
        target:addStatusEffect(tpz.effect.SLOW, slowPower * 100, 0, duration)
    end

    -- randomize damage
    local ratio = automaton:getStat(tpz.mod.ATT)/target:getStat(tpz.mod.DEF)
    if ratio > 1.3 then
        ratio = 1.3
    end
    if ratio < 0.2 then
        ratio = 0.2
    end

    local pdif = math.random(ratio*0.8*1000, ratio*1.2*1000)

    damage = damage * (pdif / 1000)

    damage = utils.stoneskin(target, damage)
    target:takeDamage(damage, automaton, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
    target:updateEnmityFromDamage(automaton, damage)
    target:addEnmity(automaton, 1200, 4800)

    return damage
end