-----------------------------------------
-- Trust: Joachim
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/roe")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

local message_page_offset = 15

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)

    -- Records of Eminence: Alter Ego: Joachim
    if caster:getEminenceProgress(937) then
        tpz.roe.onRecordTrigger(caster, 937)
    end

    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.POISON, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.POISONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.PARALYNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BLINDNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SILENA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.VIRUNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.CURSE_I, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DOOM, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA)

	-- Song slot 1
	-- Paeon has priority
	mob:addFullGambit({
        ['predicates'] =
        {
            {
                ['target'] = ai.t.SELF, ['condition'] = ai.c.HPP_LT, ['argument'] = 90,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.PAEON,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.MARCH,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.MINUET,
            },
        },
        ['actions'] =
        {
            {
                ['reaction'] = ai.r.MA, ['select'] = ai.s.HIGHEST, ['argument'] = tpz.magic.spellFamily.ARMYS_PAEON,
            },
        },
    })
	
	-- March has second priority
	mob:addFullGambit({
        ['predicates'] =
        {
            {
                ['target'] = ai.t.SELF, ['condition'] = ai.c.HPP_GTE, ['argument'] = 90,
            },
			-- {
                -- ['target'] = ai.t.TARGET, ['condition'] = ai.c.HPP_GTE, ['argument'] = 75,
            -- },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.PAEON,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.MINUET,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.MARCH,
            },
        },
        ['actions'] =
        {
            {
                ['reaction'] = ai.r.MA, ['select'] = ai.s.HIGHEST, ['argument'] = tpz.magic.spellFamily.MARCH,
            },
        },
    })
	
	-- Minuet has third priority and will only be used if he does not have Paeon and already has March & Madrigal
	mob:addFullGambit({
        ['predicates'] =
        {
            {
                ['target'] = ai.t.SELF, ['condition'] = ai.c.HPP_GTE, ['argument'] = 90,
            },
			-- {
                -- ['target'] = ai.t.TARGET, ['condition'] = ai.c.HPP_LT, ['argument'] = 75,
            -- },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.PAEON,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.MINUET,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.STATUS, ['argument'] = tpz.effect.MARCH,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.STATUS, ['argument'] = tpz.effect.MADRIGAL,
            },
        },
        ['actions'] =
        {
            {
                ['reaction'] = ai.r.MA, ['select'] = ai.s.HIGHEST, ['argument'] = tpz.magic.spellFamily.VALOR_MINUET,
            },
        },
    })
	
	-- Song slot 2
	-- Ballad has priority
	mob:addFullGambit({
        ['predicates'] =
        {
            {
                ['target'] = ai.t.SELF, ['condition'] = ai.c.MPP_LT, ['argument'] = 75,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.BALLAD,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.MADRIGAL,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.MINNE,
            },
        },
        ['actions'] =
        {
            {
                ['reaction'] = ai.r.MA, ['select'] = ai.s.HIGHEST, ['argument'] = tpz.magic.spellFamily.MAGES_BALLAD,
            },
        },
    })
	
	-- Madrigal has second priority
	mob:addFullGambit({
        ['predicates'] =
        {
            {
                ['target'] = ai.t.SELF, ['condition'] = ai.c.MPP_GTE, ['argument'] = 75,
            },
			-- {
                -- ['target'] = ai.t.TARGET, ['condition'] = ai.c.HPP_GTE, ['argument'] = 75,
            -- },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.BALLAD,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.MADRIGAL,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.MINNE,
            },
        },
        ['actions'] =
        {
            {
                ['reaction'] = ai.r.MA, ['select'] = ai.s.HIGHEST, ['argument'] = tpz.magic.spellFamily.MADRIGAL,
            },
        },
    })
	
	-- Minne has third priority and will only be used if he does not have Ballad and already has March & Madrigal
	mob:addFullGambit({
        ['predicates'] =
        {
            {
                ['target'] = ai.t.SELF, ['condition'] = ai.c.MPP_GTE, ['argument'] = 75,
            },
			-- {
                -- ['target'] = ai.t.TARGET, ['condition'] = ai.c.HPP_LT, ['argument'] = 75,
            -- },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.BALLAD,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.MINNE,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.STATUS, ['argument'] = tpz.effect.MARCH,
            },
			{
                ['target'] = ai.t.SELF, ['condition'] = ai.c.STATUS, ['argument'] = tpz.effect.MADRIGAL,
            },
        },
        ['actions'] =
        {
            {
                ['reaction'] = ai.r.MA, ['select'] = ai.s.HIGHEST, ['argument'] = tpz.magic.spellFamily.KNIGHTS_MINNE,
            },
        },
    })

    -- TODO: Better logic than this
	mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.ELEGY, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.ELEGY)
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.MARCH, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.MARCH)
	-- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.MADRIGAL, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.MADRIGAL)
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 75, tpz.effect.BALLAD, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.MAGES_BALLAD)
	-- mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.MARCH, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.VALOR_MINUET)
	-- mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.MADRIGAL, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.KNIGHTS_MINNE)
	-- mob:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 90, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.ARMYS_PAEON)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

    -- Try and ranged attack every 60s
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0, 60)

    mob:SetAutoAttackEnabled(false)
	
	local power = mob:getMainLvl() * 2.5
	
	if (mob:getMainLvl() > 99) then
		power = mob:getMainLvl() * 3.5
	end
	
	mob:addMod(tpz.mod.RANGED_DMG_RATING, power)
	mob:addMod(tpz.mod.RATT, power * 1.25)
	mob:addMod(tpz.mod.RACC, power)
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
