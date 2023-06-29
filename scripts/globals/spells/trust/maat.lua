-----------------------------------------
-- Trust: Maat
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/status")
require("scripts/globals/trust")
-----------------------------------------

local message_page_offset = 37

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell, 1006)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)
   
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)
    mob:addMod(tpz.mod.TREASURE_HUNTER, 3)
    mob:addMod(tpz.mod.WSACC, 40)
    mob:addMod(tpz.mod.CHAKRA_MULT, mob:getMainLvl() / 3)
  
  -- On cooldown
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.MAX_HP_BOOST, ai.r.JA, ai.s.SPECIFIC, tpz.ja.MANTRA)
	mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PERFECT_COUNTER)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, tpz.ja.CHAKRA)
end

function onMobFight(mob)

    if mob:hasStatusEffect(tpz.effect.MAX_HP_BOOST) == true then
        mob:setMod(tpz.mod.HASTE_MAGIC, 1500)
    else
        mob:setMod(tpz.mod.HASTE_MAGIC, 0)
    end
    
    local ctrDmg = mob:getMainLvl() / 1.5
    if mob:hasStatusEffect(tpz.effect.PERFECT_COUNTER) == true then
        mob:setMod(tpz.mod.COUNTER, 90)
        mob:setMod(tpz.mod.COUNTER_DMG, ctrDmg)
    else
        mob:setMod(tpz.mod.COUNTER, 0)
        mob:setMod(tpz.mod.COUNTER_DMG, 0)
    end
    
    local target = mob:getTarget()
    local family = target:getSystem()
    if family == tpz.eco.AMORPH then
        mob:useJobAbility(tpz.ja.FORMLESS_STRIKES, mob)
    end  
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
