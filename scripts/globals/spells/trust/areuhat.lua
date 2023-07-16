-----------------------------------------
-- Trust: Areuhat
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
    mob:addMod(tpz.mod.STORETP, 25)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:addMod(tpz.mod.ACC, mob:getMainLvl() * 50)
    
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 20, 0, 0) 
	mob:setHP(mob:getMaxHP())
    
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BERSERK)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.WARCRY, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WARCRY)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.WARCRY, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BLOOD_RAGE)
    
end

function onMobFight(mob, target)
    local isBusy = false
    local act    = mob:getCurrentAction()

    if
        act == tpz.act.WEAPONSKILL_START or
        act == tpz.act.WEAPONSKILL_FINISH or
        act == tpz.act.MOBABILITY_START or
        act == tpz.act.MOBABILITY_USING or
        act == tpz.act.MOBABILITY_FINISH or
        act == tpz.act.MAGIC_START or
        act == tpz.act.MAGIC_CASTING or
        act == tpz.act.MAGIC_FINISH
    then
        isBusy = true
    end

    if isBusy == false and mob:actionQueueEmpty() == true then
        local target = mob:getTarget()
        if os.time() > mob:getLocalVar("WSDELAY") and target:hasStatusEffect(tpz.effect.SKILLCHAIN) then
            local rand = math.random(1, 2)
            if mob:getTP() >= 1000 and rand == 1 then
                local WS = { 37, 40, 42, 225, 226 }
                mob:useWeaponskill(WS[math.random(1, 5)], target)
            end
            mob:setLocalVar("WSDELAY", os.time() + 3)
        elseif os.time() > mob:getLocalVar("WSDELAY") and mob:getTP() >= 2000 then
            local rand = math.random(1, 2)
            local WS = { 37, 40, 42, 225, 226 }
            mob:useWeaponskill(WS[math.random(1, 5)], target)
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
