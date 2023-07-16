-----------------------------------------
-- Trust: Lehko Habhoka
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
    
    mob:addMod(tpz.mod.GILFINDER, 1)
    mob:addMod(tpz.mod.TREASURE_HUNTER, 4)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)    
    mob:addMod(tpz.mod.TRIPLE_ATTACK, 25)    
    mob:addMod(tpz.mod.QUAD_ATTACK, 20)
    mob:addMod(tpz.mod.FASTCAST, 50)
    mob:addMod(tpz.mod.STORE_TP, 50)
    mob:addMod(tpz.mod.SAVE_TP, 250)
    
    
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 20, 0, 0) 
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 150, 0, 0) 
	mob:setHP(9999)
	mob:setMP(9999)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.ENMITY_DOUSE)
    
    local power = mob:getMainLvl() * 2
    mob:addMod(tpz.mod.MATT, power)
    mob:addMod(tpz.mod.MACC, power)
    mob:addMod(tpz.mod.MAGIC_DAMAGE, power)
    mob:addMod(tpz.mod.HASTE_MAGIC, 1000)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BULLY)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.FEINT)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.LARCENY)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
    
end

function onMobFight(mob, target)

    
    -- Sneak Attack
    if mob:isBehind(target) then
        mob:useJobAbility(44, mob)
    end    
       
    -- inspirit 
    if mob:getMP() < mob:getMaxMP() / 2 or mob:getHP() < mob:getMaxHP() / 2 then
        if mob:getTP() >= 1000 then
            if os.time() > mob:getLocalVar("inspirit") then
                mob:useMobAbility(3230)
                mob:setLocalVar("inspirit", os.time() + 30)
            end
        end
    end
    
    --Weaponskill
    if os.time() > mob:getLocalVar("combat_delay") then
        if mob:getTP() >= 1000 then
            mob:useMobAbility(math.random(3231, 3233))
        end 
        mob:setLocalVar("combat_delay", os.time() + 3)
    end
    
    -- Magic script.
    if os.time() > mob:getLocalVar("magic_cooldown") then
        local mLvl = mob:getMainLvl()
        if mLvl < 26 then
            local spells = { 144, 149, 154, 159, 164, 169 }
            mob:castSpell(spells[math.random(1, 6)], target)
        elseif mLvl > 25 then
            local spells = { 145, 150, 155, 160, 165, 170 }
            mob:castSpell(spells[math.random(1, 6)], target)
        end
        mob:setLocalVar("magic_cooldown", os.time() + 30)
    end    
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end