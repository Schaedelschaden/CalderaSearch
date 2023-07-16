-----------------------------------------
-- Trust: Babban
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
	mob:addMod(tpz.mod.COUNTER_DMG, 150)
    mob:setMobMod(tpz.mobMod.DUAL_WIELD, 1)
    
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 25, 0, 0) 
	mob:setHP(mob:getMaxHP())
    
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
    
end

function onMobFight(mob, target)
    local target = mob:getTarget()
    if os.time() > mob:getLocalVar("WSDELAY") then
        if mob:getTP() >= 1000 then
            if not target:hasStatusEffect(tpz.effect.VIT_DOWN) then
                mob:useMobAbility(302, target)
            elseif target:getTP() > 100 and target:getTP() <= 1000 then
                mob:useMobAbility(2210, target)
            else
                mob:useMobAbility(300, target)
            end
            mob:setLocalVar("WSDELAY", os.time() + 3)
        end
    end
    
    if os.time() > mob:getLocalVar("REGEN") then
        if mob:getHPP() <= 66 then
            mob:useMobAbility(304, mob) 
            mob:setLocalVar("REGEN", os.time() + 60)
        end
    end

end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end