-----------------------------------------
-- Spell: Final Sting
-- Deals damage proportional to HP. Reduces HP to 1 after use. Damage varies with TP.
-- Spell cost: 88 MP
-- Monster Type: Vermin
-- Spell Type: Physical
-- Blue Magic Points: 1
-- Stat Bonus: HP-20 AGI+5
-- Level: 81
-- Casting Time: 5 seconds
-- Recast Time: 11 seconds
-- Skillchain Property: Fusion
-- Combos: Zanshin
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/bluemagic")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    caster:setLocalVar("final_sting_hp", caster:getHP())

    return 0
end

function onSpellCast(caster,target,spell)
    local playerHP    = caster:getLocalVar("final_sting_hp")
    local playerLvl   = caster:getMainLvl() - 1 -- Allows for Decent Challenge+ mobs
    local mobHP       = target:getMaxHP()
    local mobLvl      = target:getMainLvl()
    local damage      = playerHP
    local boostChance = math.random(1,100)

    if playerLvl >= 98 then
        if boostChance >= 1 and boostChance <= 70 then
            damage = damage * 2
        elseif boostChance >= 71 and boostChance <= 80 then
            damage = damage * 4
        elseif boostChance >= 81 and boostChance <= 90 then
            damage = damage * 6
        elseif boostChance >= 91 and boostChance <= 100 then
            damage = damage * 8
        end
    end

    -- Mobs harder than Decent Challenge+ are capped at 50% of their max HP
    -- Mobs weaker than Decent Challenge+ are capped at 65% of their max HP
    if mobLvl >= playerLvl then
        mobHP = mobHP * 0.5
    else
        mobHP = mobHP * 0.65
    end

    -- If the player's HP is less than 50/65% of the mob's max HP then inflict full damage based on HP
    -- If the player's HP is more than 50/65% of the mob's max HP then restrict the damage to the 50/65% amount
    if playerHP < mobHP then
        target:takeSpellDamage(caster, spell, playerHP, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
        caster:setHP(1)
    else
        target:takeSpellDamage(caster, spell, mobHP, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
        caster:setHP(1)
    end

    return damage
end
