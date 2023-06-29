-----------------------------------------
-- Trust: Qultada
-----------------------------------------
require("scripts/globals/trust")
require("scripts/globals/gambits")
-----------------------------------------

local melee = {tpz.job.WAR, tpz.job.MNK, tpz.job.THF, tpz.job.BST, tpz.job.DRK, tpz.job.RNG, tpz.job.DRG, tpz.job.SAM, tpz.job.BLU, tpz.job.COR, tpz.job.PUP, tpz.job.DNC}
local tank  = {tpz.job.PLD, tpz.job.RUN, tpz.job.NIN}
local mage  = {tpz.job.BLM, tpz.job.RDM, tpz.job.SCH, tpz.job.WHM, tpz.job.BRD, tpz.job.SMN, tpz.job.GEO}   


function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.MATT, mob:getMainLvl())
    
    local caster = mob:getMaster()
    
    for i = 1, #melee do
        if (caster:getMainJob() == melee[i]) then
            mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.CHAOS_ROLL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.CHAOS_ROLL)
            mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SAMURAI_ROLL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SAMURAI_ROLL)
        end
    end
    
    for i = 1, #tank do
        if (caster:getMainJob() == tank[i]) then
            mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.GALLANTS_ROLL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.GALLANTS_ROLL)
            mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.AVENGERS_ROLL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.AVENGERS_ROLL)
        end
    end
    
    for i = 1, #mage do
        if (caster:getMainJob() == mage[i]) then
            mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.WARLOCKS_ROLL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WARLOCKS_ROLL)
            mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.EVOKERS_ROLL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.EVOKERS_ROLL)
        end
    end
end

function onMobFight(mob)
    
    local target = mob:getTarget()
    local shuffle = math.random(1, 3)
    
    if os.time() > mob:getLocalVar("SKILL_ROTATE") then
        if mob:getTP() >= 1000 then
            if shuffle == 1 then
                mob:useWeaponskill(33, target)
            elseif shuffle == 2 then
                mob:useWeaponskill(42, target)
            elseif shuffle == 3 then
                mob:useWeaponskill(218, target)
            end
        end
        mob:setLocalVar("SKILL_ROTATE", os.time() + 5)        
    end    
    
    if os.time() > mob:getLocalVar("SHOT_CD") then
        if target:hasStatusEffectByFlag(tpz.effectFlag.DISPELABLE) then
            mob:useJobAbility(tpz.jobAbility.DARK_SHOT, target)
        elseif target:hasStatusEffect(tpz.effect.DIA) then
            mob:useJobAbility(tpz.jobAbility.LIGHT_SHOT, target)
        end
        mob:setLocalVar("SHOT_CD", os.time() + 60)
    end    
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
