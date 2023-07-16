-----------------------------------------
-- Trust: Volker
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

local message_page_offset = 7

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.teamworkMessage(mob, {
        [tpz.magic.spell.NAJI]  = tpz.trust.message_offset.TEAMWORK_1,
        [tpz.magic.spell.CID]   = tpz.trust.message_offset.TEAMWORK_2,
        [tpz.magic.spell.KLARA] = tpz.trust.message_offset.TEAMWORK_3,
    })
    
    mob:addMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() / 2)    
    mob:addMod(tpz.mod.STORETP, 25)

    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_GTE, 1000, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WARRIORS_CHARGE)

	--Abilities
		--Tank Stance
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.DEFENDER)
    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.RETALIATION)
		--Damage Stance
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.AGGRESSOR)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.BERSERK)
		--Provokes regularly to remain Off-Tank
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE)    
    mob:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.WARCRY)  
    
    mob:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.HIGHEST)    
    
end

function onMobFight(mob, target)

end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
