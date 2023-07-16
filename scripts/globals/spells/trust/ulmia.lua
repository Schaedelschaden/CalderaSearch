-----------------------------------------
-- Trust: Ulmia
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
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)
    
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
    
    mob:SetAutoAttackEnabled(false)
    
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end