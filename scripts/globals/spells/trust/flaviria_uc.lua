-----------------------------------------
-- Trust: Flaviria UC
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
    
    mob:addMod(tpz.mod.STORETP, 100)
    mob:addMod(tpz.mod.JUMP_TP_BONUS, 125)
    
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BERSERK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SUPER_JUMP)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
    mob:addMod(tpz.mod.JUMP_ATT_BONUS, 500)
    mob:addMod(tpz.mod.FORCE_JUMP_CRIT, 100)  
    mob:setLocalVar("trigger", 1)    
end

function onMobFight(mob)
    
    local target = mob:getTarget()
    if os.time() > mob:getLocalVar("WSDELAY") then
        if mob:getTP() >= 1000 then
            local WS = { 118, 120, 124,}
            mob:useWeaponskill(WS[math.random(1, 3)], target) 
            mob:setLocalVar("WSDELAY", os.time() + 3)
        end
    end
    
    if os.time() > mob:getLocalVar("JUMP") then 
        if mob:getTP() < 1000 then
            local JUMP = { 66, 67, 260, 293 }
            mob:useJobAbility(JUMP[mob:getLocalVar("trigger")], target)
            mob:setLocalVar("trigger", mob:getLocalVar("trigger") + 1)            
            mob:setLocalVar("JUMP", os.time() + 15)
        end
    end
    
    if mob:getLocalVar("trigger") > 4 then
        mob:setLocalVar("trigger", 1)
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    mob:removeListener("JUMP_CD")
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end

