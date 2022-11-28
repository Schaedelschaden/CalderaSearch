-----------------------------------
-- Trust: Gessho
-----------------------------------
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
-----------------------------------
--Notes to Self/Bart
	--Abilities:
		--Shiko no Mitate
			--Yagudo Parry
		--Rinpyotosha
			--Warcry
	
	--Weaponskills
		--Happobarai
			--Yagudo Sweep
				--Reverberation
				--Impaction
		--Hane Fubuki
			--Feather Storm
				--Transfitpzon
		--Shibaraku
			--AoE
				--Darkness
				--Gravitation
		
	--Special Abilities
		--Shiko no Mitate
			--DEF+
			--Stoneskin
			--Issekigan
		--Rinpyotosha
			--25% ATK+ Warcry 
				--3 Min Duration
				--5 Min Recast
-----------------------------------
local spell_object = {}

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.teamworkMessage(mob, {
        [tpz.magic.spell.NAJA_SALAHEEM] = tpz.trust.message_offset.TEAMWORK_1,
        [tpz.magic.spell.ABQUHBAH] = tpz.trust.message_offset.TEAMWORK_2,
    })

    mob:addListener("WEAPONSKILL_USE", "GESSHO_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
        if wsid == 3257 then -- Shibaraku
            -- You have left me no choice. Prepare yourself!
            tpz.trust.message(mobArg, tpz.trust.message_offset.SPECIAL_MOVE_1)
        end
    end)
    
    mob:addListener("COMBAT_TICK", "GESSHO_CTICK", function(mobArg, target, wsid, tp, action)
        if (mob:hasStatusEffect(tpz.effect.WARCRY) == false) then
            mob:useMobAbility(3260)
            mob:addStatusEffect(tpz.effect.WARCRY, 25, 0, 180)
        end
    end)
    
    mob:addListener("TAKE_DAMAGE", "GESSHO_TAKE_DAMAGE", function(mobArg, target, wsid, tp, action)
        if (mob:hasStatusEffect(tpz.effect.DEFENSE_BOOST) == false) then
            mob:useMobAbility(3258)
            mob:addStatusEffect(tpz.effect.DEFENSE_BOOST, 15, 0, 300)
        end
    end)
    

    -- Shadows are represented by tpz.effect.COPY_IMAGE, but with different icons depending on the tier
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.YONIN, ai.r.JA, ai.s.SPECIFIC, tpz.ja.YONIN) --Yonin first to enhance ninja tools and add enmity
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.COPY_IMAGE, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.UTSUSEMI) --will use highest first, then sub in lower tiers
    
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE) --provoke is third priority after defense
    --mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_PT_HAS_TANK, ai.r.JA, ai.s.SPECIFIC, tpz.ja.PROVOKE) --once LSB upgrades are added he will only use provoke if the party doesn't have a tank.
    
    --this section is for ninja debuffs, will use these on cooldown 
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.BLINDNESS, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.KURAYAMI, 60)
    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.SLOW, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.HOJO, 60)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.POISON, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.DOKUMORI, 60)
	mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, tpz.effect.PARALYSIS, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.JUBAKU, 60)

    

    mob:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.HIGHEST) --currently looks for closers asap.
    --mob:setTrustTPSkillSettings(ai.tp.CLOSER_UNTIL_TP, ai.s.HIGHEST, 1500) -- this is for after LSB upgrades to hold for closers until 1500 then dump.
end

function onMobDespawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end

return spell_object
