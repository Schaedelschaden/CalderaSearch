-----------------------------------------
-- Trust: Elivira
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
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BERSERK, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BERSERK)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:addMod(tpz.mod.TRIPLE_ATTACK, 10)
    mob:addMod(tpz.mod.QUAD_ATTACK, 10)
end

function onMobFight(mob)
    local target = mob:getTarget()
    local shuffle = math.random(1, 5)
    
    if os.time() > mob:getLocalVar("SKILL_ROTATE") then
        if mob:getTP() >= 1000 then
            if shuffle == 1 then
                mob:useWeaponskill(217, target)
            elseif shuffle == 2 then
                mob:useWeaponskill(220, target)
            elseif shuffle == 3 then
                mob:useWeaponskill(218, target)
            elseif shuffle == 4 then
                mob:useWeaponskill(225, target)
            elseif shuffle == 5 then
                mob:useWeaponskill(226, target)    
            end
        end
        mob:setLocalVar("SKILL_ROTATE", os.time() + 5)        
    end    

end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end