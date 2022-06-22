-----------------------------------------
-- Trust: Trion
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

local message_page_offset = 9

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.teamworkMessage(mob, message_page_offset, {
        [tpz.magic.spell.CURILLA] = tpz.trust.message_offset.TEAMWORK_1,
        [tpz.magic.spell.RAHAL] = tpz.trust.message_offset.TEAMWORK_2,
        [tpz.magic.spell.HALVER] = tpz.trust.message_offset.TEAMWORK_3,
    })
	
	local defBonus = mob:getMainLvl() * 1.5
	
	mob:addMod(tpz.mod.DEF, defBonus)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE)
						
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SENTINEL,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.SENTINEL)
						
	mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.SHIELD_BASH)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.FLASH,
                        ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FLASH)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75,
                        ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)
end

-- function onMobFight(mob)
	-- local isBusy = false
	
	-- if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or
	   -- act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        -- isBusy = true 
    -- end
	
	-- printf("trion.lua onMobFight TRION FIGHTING")
-- end

function onMobDespawn(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DEATH)
end
