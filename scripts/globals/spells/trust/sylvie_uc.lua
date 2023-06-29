-----------------------------------------
-- Trust: Sylvie UC
-----------------------------------------
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/spell_data")
require("scripts/globals/status")
require("scripts/globals/trust")
-----------------------------------------
-- NOTES

-- Uses spells based on the Players Main Job (Check MASTER.tpz.job??)
	-- Refer to Gessho.lua/Sakura.lua

-- Keeps Master Hasted REGARDLESS of Main Job

-- Spell/Ability List (Level Obtained)
	-- Indi-Regen(20)
	-- Indi-Refresh(30)
	-- Entrust(93)
	-- Indi-Precision(93)
	-- Indi-Fury(93)
	-- Indi-Acumen(93)
	-- Indi-Haste(93)
	-- Indi-Focus(93)
	
-- Jobs tied to spell combinations
	-- Indi-Fury/Prcision - ENTRUST-Frailty
		-- WAR(1), MNK(2), THF(6), DRK(8), BST(9), RNG(11), SAM(12), DRG(14), BLU(16), COR(17), PUP(18), DNC(19)
	-- Indi-Haste - ENTRUST-Refresh
		-- PLD(7), RUN(22)
	-- Indi-Haste - ENTRUST-Regen
		-- NIN(13)
	-- Indi-Acumen/Focus - ENTRUST-Refresh
		-- BLM(4), RDM(5), SCH(20)
	-- Indi-Refresh - ENTRUST-Acumen
		-- WHM(3), BRD(10), SMN(15)
	-- Indi-Refresh - ENTRUST-NONE
		-- GEO(21)
-----------------------------------

local jobs1 = {tpz.job.WAR, tpz.job.MNK, tpz.job.THF, tpz.job.BST, tpz.job.DRK, tpz.job.RNG, tpz.job.DRG, tpz.job.SAM, tpz.job.BLU, tpz.job.COR, tpz.job.PUP, tpz.job.DNC}
local jobs2 = {tpz.job.PLD, tpz.job.RUN}
local jobs3 = {tpz.job.NIN}
local jobs4 = {tpz.job.BLM, tpz.job.RDM, tpz.job.SCH}
local jobs5 = {tpz.job.WHM, tpz.job.BRD, tpz.job.SMN}
local jobs6 = {tpz.job.GEO}

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    tpz.trust.message(mob, tpz.trust.message_offset.SPAWN)

	mob:addMod(tpz.mod.DMG, -25)
    mob:addMod(tpz.mod.REGAIN, 50)

    mob:addListener("COMBAT_TICK", "SYLVIE_ACC_CHECK", function(mobArg, targetArg)
		local master    = mobArg:getMaster()
        local masterACC = master:getACC()
		local enemyEVA  = targetArg:getEVA()

		if masterACC - enemyEVA > 100 then
			-- printf("sylvie_uc.lua onMobSpawn  MASTER ACC: [%i]  ENEMY EVA: [%i]  DIFF: [%i]", masterACC, enemyEVA, masterACC - enemyEVA)
			mobArg:setLocalVar("SYLVIE_ACC_SPELL_TRIGGER", 1)
		else
			-- printf("sylvie_uc.lua onMobSpawn  TRIGGER 2")
			mobArg:setLocalVar("SYLVIE_ACC_SPELL_TRIGGER", 2)
		end
    end)

    mob:addListener("COMBAT_TICK", "SYLVIE_ENTRUST", function(mobArg, targetArg)
        mobArg:useJobAbility(386, mobArg)
    end)

    mob:addListener("COMBAT_TICK", "SYLVIE_ENTRUSTED_CAST", function(mobArg, targetArg)
        local master       = mobArg:getMaster()
        local masterJob    = master:getMainJob()
        local castSpell    = tpz.magic.spell.INDI_FRAILTY

        -- Indi-Frailty: WAR, MNK, THF, DRK, BST, RNG, SAM, DRG, BLU, COR, PUP, DNC
        -- Indi-Refresh: BLM, RDM, PLD, SCH, RUN
        -- Indi-Regen  : NIN
        -- Indi-Acumen : WHM, BRD, SMN
        -- Indi-Languor: GEO

        switch (masterJob): caseof
        {
            [ 3] = function () -- WHM
                castSpell = tpz.magic.spell.INDI_ACUMEN
            end,
            [ 4] = function () -- BLM
                castSpell = tpz.magic.spell.INDI_REFRESH
            end,
            [ 5] = function () -- RDM
                castSpell = tpz.magic.spell.INDI_REFRESH
            end,
            [ 7] = function () -- PLD
                castSpell = tpz.magic.spell.INDI_REFRESH
            end,
            [10] = function () -- BRD
                castSpell = tpz.magic.spell.INDI_ACUMEN
            end,
            [13] = function () -- NIN
                castSpell = tpz.magic.spell.INDI_REGEN
            end,
            [15] = function () -- SMN
                castSpell = tpz.magic.spell.INDI_ACUMEN
            end,
            [20] = function () -- SCH
                castSpell = tpz.magic.spell.INDI_REFRESH
            end,
            [21] = function () -- GEO
                castSpell = tpz.magic.spell.INDI_LANGUOR
            end,
            [22] = function () -- RUN
                castSpell = tpz.magic.spell.INDI_REFRESH
            end,
        }

        if mobArg:hasStatusEffect(tpz.effect.ENTRUST) then
            mobArg:castSpell(castSpell, master)
        end
    end)

    mob:addListener("MAGIC_STATE_EXIT", "SYLVIE_MAGIC_END", function(mobArg, spell)
        local spellID = spell:getID()

        if
            spellID >= tpz.magic.spell.INDI_REGEN and
            spellID <= tpz.magic.spell.INDI_GRAVITY
        then
            mobArg:delStatusEffect(tpz.effect.ENTRUST)
        end
    end)

	local caster = mob:getMaster()

    -- GAMBITS

    -- Cure spells
	mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 25, ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

    -- Status Removal Spells
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.POISON, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.POISONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.PARALYNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.BLINDNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.SILENA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.STONA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.VIRUNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.CURSE_I, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, tpz.effect.DOOM, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.CURSNA)    
    mob:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, tpz.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ERASE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.STATUS_FLAG, tpz.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ERASE)

	-- Indi-Fury/Precision Entrust (MASTER) Frailty
	for i = 1, #jobs1 do
		if (caster:getMainJob() == jobs1[i]) then
			mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.COLURE_ACTIVE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.INDI_FURY)
			-- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ENTRUST, ai.r.JA, ai.s.SPECIFIC, tpz.ja.ENTRUST)

			mob:addFullGambit({
			['predicates'] =
			{
				{
					['target'] = ai.t.SELF, ['condition'] = ai.c.STATUS, ['argument'] = tpz.effect.ENTRUST,
				},
				{
					['target'] = ai.t.MASTER, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.COLURE_ACTIVE,
				},
			},
			['actions'] =
			{
				{
					['reaction'] = ai.r.MA, ['select'] = ai.s.SPECIFIC, ['argument'] = tpz.magic.spell.INDI_FRAILTY,
				},
			},
		})
		end
	end

	-- Indi-Haste Entrust (MASTER) Refresh
	for i = 1, #jobs2 do
		if (caster:getMainJob() == jobs2[i]) then
			mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.COLURE_ACTIVE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.INDI_HASTE)
			-- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ENTRUST, ai.r.JA, ai.s.SPECIFIC, tpz.ja.ENTRUST)

			mob:addFullGambit({
			['predicates'] =
			{
				{
					['target'] = ai.t.SELF, ['condition'] = ai.c.STATUS, ['argument'] = tpz.effect.ENTRUST,
				},
				{
					['target'] = ai.t.MASTER, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.COLURE_ACTIVE,
				},
			},
			['actions'] =
			{
				{
					['reaction'] = ai.r.MA, ['select'] = ai.s.SPECIFIC, ['argument'] = tpz.magic.spell.INDI_REFRESH,
				},
			},
		})
		end
	end

	-- Indi-Haste Entrust (MASTER) Regen
	for i = 1, #jobs3 do
		if (caster:getMainJob() == jobs3[i]) then
			mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.COLURE_ACTIVE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.INDI_HASTE)
			-- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ENTRUST, ai.r.JA, ai.s.SPECIFIC, tpz.ja.ENTRUST)

			mob:addFullGambit({
			['predicates'] =
			{
				{
					['target'] = ai.t.SELF, ['condition'] = ai.c.STATUS, ['argument'] = tpz.effect.ENTRUST,
				},
				{
					['target'] = ai.t.MASTER, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.COLURE_ACTIVE,
				},
			},
			['actions'] =
			{
				{
					['reaction'] = ai.r.MA, ['select'] = ai.s.SPECIFIC, ['argument'] = tpz.magic.spell.INDI_REGEN,
				},
			},
		})	
		end
	end

	-- Indi-Acumen/Focus Entrust (MASTER) Refresh
	for i = 1, #jobs4 do
		if (caster:getMainJob() == jobs4[i]) then
			mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.COLURE_ACTIVE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.INDI_ACUMEN)
			-- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ENTRUST, ai.r.JA, ai.s.SPECIFIC, tpz.ja.ENTRUST)

			mob:addFullGambit({
			['predicates'] =
			{
				{
					['target'] = ai.t.SELF, ['condition'] = ai.c.STATUS, ['argument'] = tpz.effect.ENTRUST,
				},
				{
					['target'] = ai.t.MASTER, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.COLURE_ACTIVE,
				},
			},
			['actions'] =
			{
				{
					['reaction'] = ai.r.MA, ['select'] = ai.s.SPECIFIC, ['argument'] = tpz.magic.spell.INDI_REFRESH,
				},
			},
		})
		end
	end

	-- Indi-Refresh Entrust (MASTER) Acumen
	for i = 1, #jobs5 do
		if (caster:getMainJob() == jobs5[i]) then
			mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.COLURE_ACTIVE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.INDI_REFRESH)
			-- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ENTRUST, ai.r.JA, ai.s.SPECIFIC, tpz.ja.ENTRUST)

			mob:addFullGambit({
			['predicates'] =
			{
				{
					['target'] = ai.t.SELF, ['condition'] = ai.c.STATUS, ['argument'] = tpz.effect.ENTRUST,
				},
				{
					['target'] = ai.t.MASTER, ['condition'] = ai.c.NOT_STATUS, ['argument'] = tpz.effect.COLURE_ACTIVE,
				},
			},
			['actions'] =
			{
				{
					['reaction'] = ai.r.MA, ['select'] = ai.s.SPECIFIC, ['argument'] = tpz.magic.spell.INDI_ACUMEN,
				},
			},
		})	
		end
	end

	-- Indi-Refresh Entrust (MASTER) NONE
	for i = 1, #jobs6 do
		if (caster:getMainJob() == jobs6[i]) then
			mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.COLURE_ACTIVE, ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.INDI_REFRESH)
		end
	end

    -- Uses Nott/Dagan at 3000 TP
    -- mob:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.RANDOM)

	-- Does she engage? y-true // n-false
	mob:SetAutoAttackEnabled(false)
end

function onMobDespawn(mob)
	mob:removeListener("SYLVIE_ACC_CHECK")
    mob:removeListener("SYLVIE_ENTRUST")
    mob:removeListener("SYLVIE_ENTRUSTED_CAST")
    mob:removeListener("SYLVIE_MAGIC_END")
    tpz.trust.message(mob, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
	mob:removeListener("SYLVIE_ACC_CHECK")
    mob:removeListener("SYLVIE_ENTRUST")
    mob:removeListener("SYLVIE_ENTRUSTED_CAST")
    mob:removeListener("SYLVIE_MAGIC_END")
    tpz.trust.message(mob, tpz.trust.message_offset.DEATH)
end
