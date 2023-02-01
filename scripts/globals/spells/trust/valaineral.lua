-----------------------------------------
-- Trust: Valaineral
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

local message_page_offset = 14

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)

    -- Records of Eminence: Alter Ego: Valaineral
    if caster:getEminenceProgress(933) then
        tpz.roe.onRecordTrigger(caster, 933)
    end

    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    --[[
        Summon: With your courage and valor, Altana's children will live to see a brighter day.
        Summon (Formerly): Let the Royal Family’s blade be seared forever into their memories!
    ]]
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)

	local defBonus = mob:getMainLvl() * 1.1

    mob:setMobMod(tpz.mobMod.MOBMOD_CAN_SHIELD_BLOCK, 1)
    mob:setMod(tpz.mod.SHIELDBLOCKRATE, 45)
	mob:addMod(tpz.mod.CURE_POTENCY, 50)
	mob:addMod(tpz.mod.ENMITY, 35)
	mob:addMod(tpz.mod.SPELLINTERRUPT, 35)
	mob:addMod(tpz.mod.REFRESH, 2)
	mob:addMod(tpz.mod.DMG, -8)
	mob:addMod(tpz.mod.DEF, defBonus)

	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.MAJESTY, ai.r.JA, ai.s.SPECIFIC, tpz.ja.MAJESTY)
	-- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.FEALTY, ai.r.JA, ai.s.SPECIFIC, tpz.ja.FEALTY)
	-- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.PALISADE, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PALISADE)

    -- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.REPRISAL, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.REPRISAL)
	-- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ENLIGHT, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ENLIGHT)
    -- mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

    -- Special counters
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, tpz.effect.CHAINSPELL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.RAMPART)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, tpz.effect.MANAFONT, ai.r.JA, ai.s.SPECIFIC, tpz.ja.RAMPART)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.STATUS, tpz.effect.ASTRAL_FLOW, ai.r.JA, ai.s.SPECIFIC, tpz.ja.RAMPART)

    -- Enmity control
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.FLASH, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DIVINE_EMBLEM)      -- uses DE specifically with flash for enmity boost.
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FLASH)

    -- Healing / Sleep counter
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURE)         -- wakes up sleepers
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURE)        -- wakes up sleepers

    -- Self Buffs
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SENTINEL)          -- Uses SENTINEL first
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DEFENDER)          -- Uses Defender when SENTINEL wears
    
    -- MP recovery
    mob:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, tpz.ja.CHIVALRY) 
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        local master = mob:getMaster()
        local party  = master:getPartyWithTrusts()
        local mLvl   = mob:getMainLvl()
        local cure   = 1

        if mLvl >= 17 and mLvl <= 29 then
            cure = 2
        elseif mLvl >= 30 and mLvl <= 54 then
            cure = 3
        elseif mLvl >= 55 then
            cure = 4
        end

        for i, v in ipairs(party) do
            if v:getHPP() <= 50 then
                mob:castSpell(cure, v)
            end
        end

        if
            not mob:hasStatusEffect(tpz.effect.ENLIGHT) and
            mob:getMP() > 50
        then
            -- printf("valaineral.lua onMobFight  ENLIGHT TRIGGER")
            mob:castSpell(tpz.magic.spell.ENLIGHT)
        end

        if
            not mob:hasStatusEffect(tpz.effect.PHALANX) and
            mob:getMP() > 50
        then
            -- printf("valaineral.lua onMobFight  PHALANX TRIGGER")
            mob:castSpell(tpz.magic.spell.PHALANX)
        end

        if
            not mob:hasStatusEffect(tpz.effect.REPRISAL) and
            mob:getMP() > 50
        then
            -- printf("valaineral.lua onMobFight  REPRISAL TRIGGER")
            mob:castSpell(tpz.magic.spell.REPRISAL)
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 1)
    end
end

function onMobDespawn(mob)
    mob:removeListener("VALAINERAL_MAGIC_START")
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    mob:removeListener("VALAINERAL_MAGIC_START")
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end