-----------------------------------------
-- Trust: Iron Eater
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

local message_page_offset = 21

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.teamworkMessage(mob, {
        [tpz.magic.spell.NAJI] = tpz.trust.message_offset.TEAMWORK_1,
    })

    mob:addSimpleGambit(ai.t.MASTER, ai.c.HPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.BERSERK, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BERSERK)
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.RESTRAINT, ai.r.JA, ai.s.SPECIFIC, tpz.ja.RESTRAINT)
	
	--If Restraint is active, store TP to 3000.
	mob:addFullGambit(
	{
		['predicates'] =
		{
			{['target'] = ai.t.SELF, ['condition'] = ai.c.STATUS, ['argument'] = tpz.effect.RESTRAINT,},
			{['target'] = ai.t.SELF, ['condition'] = ai.c.TP_GTE, ['argument'] = 3000,},
		},
		['actions'] =
		{
			{['reaction'] = ai.tp.ASAP, ['select'] = ai.s.HIGHEST,},
		},
	})
	--If Restraint is not active, WS as soon as TP is above 1000.
	mob:addFullGambit(
	{
		['predicates'] =
		{
			{['target'] = ai.t.SELF, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.RESTRAINT,},
		},
		['actions'] =
		{
			{['reaction'] = ai.tp.ASAP, ['select'] = ai.s.HIGHEST,},
		},
	})
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
