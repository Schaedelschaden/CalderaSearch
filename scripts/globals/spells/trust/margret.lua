-----------------------------------------
-- Trust: Margret
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

    -- Ranged Attack as much as possible (limited by "weapon" delay)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0)
    mob:addMod(tpz.mod.RANGED_DMG_RATING, mob:getMainLvl() * 2)
    mob:addMod(tpz.mod.RACC, mob:getMainLvl() * 2)
    mob:addMod(tpz.mod.TREASURE_HUNTER, 1)
    
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BARRAGE, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BARRAGE)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SHARPSHOT, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SHARPSHOT)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DOUBLE_SHOT, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DOUBLE_SHOT)

end

function onMobFight(mob, target)
    local target = mob:getTarget()
    --Weaponskill
    if os.time() > mob:getLocalVar("combat_delay") then
        if mob:getTP() >= 1000 then
            local rand = math.random(1, 4)
            if rand == 1 then
                mob:useWeaponskill(193, target) -- piercing arrow
            elseif rand == 2 then    
                mob:useWeaponskill(198, target) -- arching arrow
            elseif rand == 3 then    
                mob:useWeaponskill(196, target) -- sidewinder
            elseif rand == 4 then    
                mob:useWeaponskill(201, target) -- refulgent arrow
            end            
        end 
        mob:setLocalVar("combat_delay", os.time() + 3)
    end
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
