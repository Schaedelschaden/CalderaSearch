-----------------------------------------
-- Trust: Abenzio
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
    
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 100)    
	mob:addMod(tpz.mod.COUNTER, 90)
	mob:addMod(tpz.mod.ACC, mob:getMainLvl() * 50)
	mob:addMod(tpz.mod.COUNTER_DMG, 150)
    mob:setMobMod(tpz.mobMod.DUAL_WIELD, 1)
    
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 35, 0, 0) 
	mob:setHP(mob:getMaxHP())
    
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
    
end

function onMobFight(mob, target)
    local target = mob:getTarget()
    if os.time() > mob:getLocalVar("WSDELAY") then
        if mob:getTP() >= 1000 then
            local WS = { 586, 587, 584, 581 }
            mob:useMobAbility(WS[math.random(1, 4)], target)
            mob:setLocalVar("WSDELAY", os.time() + 3)
        end
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
