-----------------------------------------
-- Trust: Valaineral
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
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
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.SPAWN)
	
	local defBonus = mob:getMainLvl() * 1.1
	
	mob:addMod(tpz.mod.CURE_POTENCY, 50)
	mob:addMod(tpz.mod.ENMITY, 35)
	mob:addMod(tpz.mod.SPELLINTERRUPT, 35)
	mob:addMod(tpz.mod.REFRESH, 2)
	mob:addMod(tpz.mod.DMG, -8)
	mob:addMod(tpz.mod.DEF, defBonus)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, tpz.ja.SENTINEL)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.MAJESTY, ai.r.JA, ai.s.SPECIFIC, tpz.ja.MAJESTY)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DEFENDER, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DEFENDER)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.RAMPART, ai.r.JA, ai.s.SPECIFIC, tpz.ja.RAMPART)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.FEALTY, ai.r.JA, ai.s.SPECIFIC, tpz.ja.FEALTY)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DIVINE_EMBLEM,ai.r.JA, ai.s.SPECIFIC, tpz.ja.DIVINE_EMBLEM)
	mob:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, tpz.ja.CHIVALRY)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.PALISADE, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PALISADE)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FLASH)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.REPRISAL, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.REPRISAL)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ENLIGHT, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ENLIGHT)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)
end

function onMobDespawn(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DEATH)
end