-----------------------------------------
-- Trust: Shantotto II
-----------------------------------------
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/trust")
-----------------------------------------

local message_page_offset = 112

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell, tpz.magic.spell.SHANTOTTO)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)
    

    mob:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.NONE, 5)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.RANDOM, tpz.magic.spellFamily.NONE, 45)

    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 5)
    
    local power = mob:getMainLvl() * 2

    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
    mob:addMod(tpz.mod.MATT, power)
    mob:addMod(tpz.mod.MACC, power)
    mob:addMod(tpz.mod.MAGIC_DAMAGE, power)
    mob:addMod(tpz.mod.HASTE_MAGIC, 1000)
    
    mob:SetMobSkillAttack(1227)
    mob:SetAutoAttackEnabled(true)
    mob:setMod(tpz.mod.FASTCAST, 50)
        
end


function onMobDespawn(mob)
    mob:removeListener("SHANTOTTO_II_CTICK")
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    mob:removeListener("SHANTOTTO_II_CTICK")
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end