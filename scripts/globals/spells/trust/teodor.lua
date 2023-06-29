-----------------------------------------
-- Trust: Teodor
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
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 35, 0, 0)
    mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 50, 0, 0)
    mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())
    mob:addMod(tpz.mod.REFRESH, 10)
    mob:SetMobSkillAttack(1236)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
end

function onMobFight(mob)

    if os.time() > mob:getLocalVar("Teodor") then            
        if mob:getTP() >= 1000 then
            mob:useMobAbility(math.random(3381, 3384))
        end
        mob:setLocalVar("Teodor", os.time() + 10)
    end
    
    if os.time() > mob:getLocalVar("TeodorJA") then            
        mob:castSpell(math.random(496, 501))
        mob:setLocalVar("TeodorJA", os.time() + 30)
    end

    
    if mob:getLocalVar("Scratch") == 0 and mob:getTP() >= 1000 then
         
        mob:useMobAbility(3380) 
        mob:timer(5000, function(mobArg)
            mobArg:AnimationSub(1)
        end)
        mob:setLocalVar("Scratch", 1)
        mob:timer(60000, function(mobArg)
            mobArg:useMobAbility(3385)             
            mobArg:setLocalVar("Scratch", 0)
            mobArg:AnimationSub(0)
        end)
    end

end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end