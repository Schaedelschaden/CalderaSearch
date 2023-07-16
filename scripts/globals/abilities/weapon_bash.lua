-----------------------------------
-- Ability: Weapon Bash
-- Delivers an attack that can stun the target. Requires Two-handed weapon.
-- Obtained: Dark Knight Level 20
-- Cast Time: Instant
-- Recast Time: 3:00 minutes
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if not player:isWeaponTwoHanded() then
        return tpz.msg.basic.NEEDS_2H_WEAPON, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    local spell  = getSpell(252)
    local params = {}
			params.diff      = 0
			params.skillType = player:getWeaponSkillType(tpz.slot.MAIN)
			params.bonus     = 0
    local resist = applyResistance(player, target, spell, params)

    -- Applying Weapon Bash stun. Rate is said to be near 100%, so let's say 99%.
    if
        math.random(1, 100) < 99 and
        resist > 0.25
    then
        target:addStatusEffect(tpz.effect.STUN, 1, 0, 4)
    end

    -- Augments "Weapon Bash" causes Weapon Bash to inflict Chainbound (Konzen-ittai) on the target
    if
        player:getMod(tpz.mod.WEAPON_BASH_CHAINBOUND) > 0 and
        not target:hasStatusEffect(tpz.effect.CHAINBOUND, 0) and
        not target:hasStatusEffect(tpz.effect.SKILLCHAIN, 0)
    then
        target:addStatusEffectEx(tpz.effect.CHAINBOUND, 0, 2, 0, 10, 0, 1)
    end

    -- Weapon Bash deals damage dependant of Dark Knight level
    local darkKnightLvl = 0
    if player:getMainJob() == tpz.job.DRK then
        darkKnightLvl = player:getMainLvl()    -- Use Mainjob Lvl
    elseif player:getSubJob() == tpz.job.DRK then
        darkKnightLvl = player:getSubLvl()    -- Use Subjob Lvl
    end

    -- Calculating and applying Weapon Bash damage
    local damage = math.floor(((darkKnightLvl + 11) / 4) + player:getMod(tpz.mod.WEAPON_BASH))

    -- Diorama Abdhaljs-Ghelsba (PvP zone) sets damage to 15% of target's HP
    if target:getZoneID() == 43 then
        damage = target:getMaxHP() * 0.15
        target:takeDamage(damage, player, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
        ability:setMsg(tpz.msg.basic.JA_DAMAGE)
        return damage
    else
        target:takeDamage(damage, player, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
        target:updateEnmityFromDamage(player, damage)

        return damage
    end
end
