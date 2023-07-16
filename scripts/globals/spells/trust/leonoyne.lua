-----------------------------------------
-- Trust: Leonoyne
-----------------------------------------
require("scripts/globals/trust")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
	tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)
    
    mob:addMod(tpz.mod.ACC, mob:getMainLvl() * 3)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 25, 0, 0)
    mob:setMP(mob:getMaxMP())
    mob:addMod(tpz.mod.REFRESH, 1)
    mob:addMod(tpz.mod.ABSORB_PHYSDMG_TO_MP, 5)
    mob:addMod(tpz.mod.STORETP, 55)
end

function onMobFight(mob, target)
    
    local power = mob:getMainLvl() + math.random(15, 35)
    mob:addStatusEffect(tpz.effect.ENBLIZZARD, power, 0, 0)

    if os.time() > mob:getLocalVar("COMBATDELAY") then
        if mob:getTP() >= 1000 then
            local rand = math.random(1, 3)
            if rand == 1 then
                mob:useWeaponskill(50, target) -- Freezebite
            elseif rand == 2 then
                mob:useWeaponskill(51, target) -- Shockwave
            elseif rand == 3 then
                mob:useWeaponskill(58, target) -- Herculean Slash
            end
        end
        
        if not mob:hasStatusEffect(tpz.effect.ICE_SPIKES) then
            mob:castSpell(tpz.magic.spell.ICE_SPIKES, mob)
        end
        mob:setLocalVar("COMBATDELAY", os.time() + 3)
    end
    
    -- Magic script.
    if os.time() > mob:getLocalVar("magic_cooldown") then
        local mLvl = mob:getMainLvl()
        if mLvl < 57 then
            mob:castSpell(179, target)
        elseif mLvl >= 57 and mLvl < 71 then
            mob:castSpell(180, target)
        elseif mLvl >= 71 then
            mob:castSpell(181, target)
        end
        mob:setLocalVar("magic_cooldown", os.time() + 30)
    end
end