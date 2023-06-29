-----------------------------------------
-- Trust: Rongelouts
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/spell_data")
require("scripts/globals/status")
require("scripts/globals/roe")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    -- mob:setModelId(1393)
    
    local master    = mob:getMaster()
    local masterlvl = master:getMainLvl()

    if masterlvl < 25 then
        mob:addMod(tpz.mod.AGI, 1)
        mob:addMod(tpz.mod.MND, 1)
        mob:addMod(tpz.mod.CHR, 2)
        mob:addMod(tpz.mod.VIT, 3)
        mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 10)
        mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 10)
        mob:addStatusEffect(AUTO_REGEN, 1)
    end
    if masterlvl < 50 and masterlvl >= 25 then
        mob:addMod(tpz.mod.MND, 1)
        mob:addMod(tpz.mod.AGI, 1)
        mob:addMod(tpz.mod.DEX, 2)
        mob:addMod(tpz.mod.STR, 1)
        mob:addMod(tpz.mod.VIT, 4)
        mob:addMod(tpz.mod.CHR, 3)
        mob:addMod(tpz.mod.EVA, 10)
        mob:addMod(tpz.mod.SLEEPRES, 10)
        mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 15, 0, 0)
        mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 10, 0, 0)
        mob:addStatusEffect(AUTO_REGEN, 1)
    end
    if masterlvl < 75 and masterlvl >= 50 then
        mob:addMod(tpz.mod.MND, 1)
        mob:addMod(tpz.mod.INT, 1)
        mob:addMod(tpz.mod.AGI, 3)
        mob:addMod(tpz.mod.DEX, 2)
        mob:addMod(tpz.mod.STR, 1)
        mob:addMod(tpz.mod.VIT, 5)
        mob:addMod(tpz.mod.CHR, 3)
        mob:addMod(tpz.mod.EVA, 10)
        mob:addMod(tpz.mod.SLEEPRES, 10)
        mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 15, 0, 0)
        mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 15, 0, 0)
        mob:addStatusEffect(AUTO_REGEN, 1)
        mob:addStatusEffect(STORE_TP, 10)
    end
    if masterlvl < 99 and masterlvl >= 75 then
        mob:addMod(tpz.mod.MND, 2)
        mob:addMod(tpz.mod.INT, 1)
        mob:addMod(tpz.mod.AGI, 8)
        mob:addMod(tpz.mod.DEX, 3)
        mob:addMod(tpz.mod.STR, 2)
        mob:addMod(tpz.mod.VIT, 6)
        mob:addMod(tpz.mod.CHR, 4)
        mob:addMod(tpz.mod.EVA, 10)
        mob:addMod(tpz.mod.SLEEPRES, 15)
        mob:addMod(tpz.mod.COUNTER, 8)
        mob:addMod(tpz.mod.CONSERVE_MP, 28)
        mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 20, 0, 0)
        mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 20, 0, 0)
        mob:addStatusEffect(AUTO_REGEN, 1)
        mob:addStatusEffect(STORE_TP, 10)
    end
    if masterlvl >= 99 then
        mob:addMod(tpz.mod.MND, 2)
        mob:addMod(tpz.mod.INT, 1)
        mob:addMod(tpz.mod.AGI, 13)
        mob:addMod(tpz.mod.DEX, 13)
        mob:addMod(tpz.mod.STR, 8)
        mob:addMod(tpz.mod.VIT, 19)
        mob:addMod(tpz.mod.CHR, 7)
        mob:addMod(tpz.mod.EVA, 58)
        mob:addMod(tpz.mod.SLEEPRES, 15)
        mob:addMod(tpz.mod.COUNTER, 8)
        mob:addMod(tpz.mod.CONSERVE_MP, 28)
        mob:addMod(tpz.mod.CRIT_DMG_INCREASE, 8)
        mob:addMod(tpz.mod.ACC, 35)
        mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 20, 0, 0)
        mob:addStatusEffect(tpz.effect.MAX_MP_BOOST, 25, 0, 0)
        mob:addStatusEffect(MPP, 20)
        mob:addStatusEffect(AUTO_REGEN, 1)
        mob:addStatusEffect(STORE_TP, 10)
        mob:addStatusEffect(PARRY, 9)
        mob:addStatusEffect(FAST_CAST, 25)
    end

    mob:setHP(mob:getMaxHP())
    mob:setMP(mob:getMaxMP())
    mob:addStatusEffect(tpz.effect.DIFFUSION, 1, 0, 0)

    mob:addListener("WEAPONSKILL_USE", "RONGELOUTS_WEAPONSKILL_USE", function(mobArg2, target, wsid, tp, action)
        if wsid == 46 then --expacion
            mobArg2:addMP(mobArg2:getMaxMP() * 0.20)
        end
        if wsid == 225 then --CDC
            mobArg2:addMP(mobArg2:getMaxMP() * 0.20)
        end
        if wsid == 42 then -- savage blade
            mobArg2:addMP(mobArg2:getMaxMP() * 0.20)
        end
        if wsid == 226 then --RESQ
            mobArg2:addMP(mobArg2:getMaxMP() * 0.20)
        end
    end)

    -- Priority
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.UNBRIDLED_LEARNING, ai.r.JA, ai.s.SPECIFIC, tpz.ja.UNBRIDLED_LEARNING)
    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS, tpz.effect.UNBRIDLED_LEARNING, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DIFFUSION)
    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS, tpz.effect.UNBRIDLED_LEARNING, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.MIGHTY_GUARD)    
   
    -- Heals
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 65, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.MAGIC_FRUIT)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 65, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.WILD_CARROT)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 65, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.HEALING_BREEZE)

    -- Refresh
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.REFRESH, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BATTERY_CHARGE)

    -- Stoneskin
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.STONESKIN, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.DIAMONDHIDE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.STONESKIN, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.METALLIC_BODY)

    -- Haste
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ERRATIC_FLUTTER)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.HASTE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.REFUELING)

    -- Buffs
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DEFENSE_BOOST, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.COCOON)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ACCURACY_BOOST, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.WARM_UP)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ATTACK_BOOST, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.NATURES_MEDITATION)

    -- Blink
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BLINK, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.OCCULTATION)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BLINK, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ZEPHYR_MANTLE)

end

function onMobFight(mob)
    if os.time() > mob:getLocalVar("NUKE_SPELL_DELAY") then
        local dmgSpell = math.random(1, 4)
        if dmgSpell == 1 then
            mob:castSpell(723, target)
        elseif dmgSpell == 2 then
            mob:castSpell(714, target)
        elseif dmgSpell == 3 then
            mob:castSpell(643, target)
        elseif dmgSpell == 4 then
            mob:castSpell(653, target)
        end
        mob:setLocalVar("NUKE_SPELL_DELAY", os.time() + 20)
    end  
    
    -- if os.time() > mob:getLocalVar("MIGHTY_GUARD_DELAY") then
        -- if mob:hasStatusEffect(tpz.effect.UNBRIDLED_LEARNING) == false then
            -- mob:useJobAbility(tpz.ja.UNBRIDLED_LEARNING, mob)
        -- end
        
        -- if mob:hasStatusEffect(tpz.effect.UNBRIDLED_LEARNING) == true then
            -- mob:useJobAbility(tpz.ja.DIFFUSION, mob)
        -- end
        
        -- if mob:hasStatusEffect(tpz.effect.DIFFUSION) == true then
            -- mob:castSpell(tpz.magic.spell.MIGHTY_GUARD, mob)
        -- elseif mob:hasStatusEffect(tpz.effect.DIFFUSION) == false and mob:hasStatusEffect(tpz.effect.UNBRIDLED_LEARNING) == true then
            -- mob:castSpell(tpz.magic.spell.MIGHTY_GUARD, mob)
        -- end
        
        -- mob:setLocalVar("MIGHTY_GUARD_DELAY", os.time() + 1)
    -- end   
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
    mob:removeListener("RONGELOUTS_WEAPONSKILL_USE")
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
    mob:removeListener("RONGELOUTS_WEAPONSKILL_USE")
end
