-----------------------------------------
-- Trust: August
-----------------------------------------
require("scripts/globals/trust")
require("scripts/globals/gambits")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    -- MELEE ATTACKS --
    mob:SetMobSkillAttack(1228) 
    -- DEFENSE MOD --
    local defBonus = mob:getMainLvl() * 1.5
    mob:addMod(tpz.mod.DEF, defBonus)
    -- BLOCKING --
    mob:setMobMod(tpz.mobMod.MOBMOD_CAN_SHIELD_BLOCK, 1)
    mob:setMod(tpz.mod.SHIELDBLOCKRATE, 75)
    -- KILLER EFFECTS --
    mob:setMod(tpz.mod.VERMIN_KILLER, 20)
    mob:setMod(tpz.mod.BIRD_KILLER, 20)
    mob:setMod(tpz.mod.AMORPH_KILLER, 20)
    mob:setMod(tpz.mod.LIZARD_KILLER, 20)
    mob:setMod(tpz.mod.AQUAN_KILLER, 20)
    mob:setMod(tpz.mod.PLANTOID_KILLER, 20)
    mob:setMod(tpz.mod.BEAST_KILLER, 20)
    mob:setMod(tpz.mod.UNDEAD_KILLER, 20)
    mob:setMod(tpz.mod.ARCANA_KILLER, 30)
    mob:setMod(tpz.mod.DRAGON_KILLER, 20)
    mob:setMod(tpz.mod.DEMON_KILLER, 20)
    mob:setMod(tpz.mod.EMPTY_KILLER, 20)
    mob:setMod(tpz.mod.LUMORIAN_KILLER, 20)
    mob:setMod(tpz.mod.LUMINION_KILLER, 20)

    -- BASIC TANK MODIFIERS --
    mob:addMod(tpz.mod.CURE_POTENCY, 50)
	mob:addMod(tpz.mod.ENMITY, 35)
	mob:addMod(tpz.mod.SPELLINTERRUPT, 35)
	mob:addMod(tpz.mod.REFRESH, 2)
    mob:setMod(tpz.mod.DMG, -35)
	-- 3K HP ADJUSTMENT --
    mob:addStatusEffect(tpz.effect.MAX_HP_BOOST, 8, 0, 0)
    mob:setHP(mob:getMaxHP())
    -- MELEE ATTACK ADJUSTMENT --
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2.5)
    mob:addMod(tpz.mod.ACC, (mob:getMainLvl() * 4)) 

    -- ENMITY TOOLS
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SENTINEL)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DEFENDER)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FLASH)
    
    -- DE HOLY
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DIVINE_EMBLEM, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DIVINE_EMBLEM)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, tpz.effect.FLASH, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HOLY)

    -- REPRISAL / PALISADE
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.REPRISAL, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.REPRISAL)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.REPRISAL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PALISADE)

    -- HEALING
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 33, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)
end

function onMobFight(mob)
    local master = mob:getMaster()
    if mob:getHPP() < 66 and mob:getLocalVar("DAYBREAK") == 0 then
        master:PrintToPlayer(string.format("August: I don't have wings, but I still have a flute!"),tpz.msg.channel.NS_PARTY)
        mob:useMobAbility(3652)
        mob:setLocalVar("DAYBREAK", 1)
        mob:setLocalVar("ROTATION", 0)
    end

    if os.time() > mob:getLocalVar("SKILL_ROTATE") then
        local daybreak = mob:getLocalVar("DAYBREAK")
        local rotation = mob:getLocalVar("ROTATION")
        if mob:getLocalVar("ROTATION") == 0 and mob:getTP() >= 1000 then
            mob:useMobAbility(3653) -- Tartaric Sigil
            mob:setLocalVar("ROTATION", 1)            
        elseif mob:getLocalVar("ROTATION") == 1 and mob:getTP() >= 1000 then
            mob:useMobAbility(3654) -- Null Field
            mob:setLocalVar("ROTATION", 2)   
        elseif mob:getLocalVar("ROTATION") == 2 and mob:getTP() >= 1000 then
            mob:useMobAbility(3655) -- Alabaster Burst
            mob:setLocalVar("ROTATION", 3)   
        elseif mob:getLocalVar("ROTATION") == 3 and mob:getTP() >= 1000 then
            mob:useMobAbility(3656) -- Noble Frenzy
            mob:setLocalVar("ROTATION", 4)    
        elseif mob:getLocalVar("ROTATION") == 4 and mob:getTP() >= 1000 then
            mob:useMobAbility(3657) -- Fulminous Fury
            mob:setLocalVar("ROTATION", 5)     
        elseif mob:getLocalVar("DAYBREAK") == 1 and mob:getLocalVar("ROTATION") == 5 and mob:getTP() >= 1000 then
            master:PrintToPlayer(string.format("August: Get ready for all the slicey-stabby things!"),tpz.msg.channel.NS_PARTY)
            mob:useMobAbility(3658) -- No Quarter
            mob:setLocalVar("DAYBREAK", 0)  
        elseif mob:getLocalVar("DAYBREAK") == 0 and mob:getLocalVar("ROTATION") == 5 and mob:getTP() >= 1000 then
            mob:setLocalVar("ROTATION", 0)
        end
        mob:setLocalVar("SKILL_ROTATE", os.time() + 10)
    end        
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end