-----------------------------------------
-- Spell: Cursna
-- Removes curse and bane from target.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/utils")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
	local healingSkill = caster:getSkillLevel(tpz.skill.HEALING_MAGIC)
    local curse = target:getStatusEffect(tpz.effect.CURSE_I)
    local curse2 = target:getStatusEffect(tpz.effect.CURSE_II)
    local bane = target:getStatusEffect(tpz.effect.BANE)
    local casterGear = caster:getMod(tpz.mod.ENHANCES_CURSNA)
	local targetGear = target:getMod(tpz.mod.ENHANCES_CURSNA_RCVD)
	local power = (utils.clamp(caster:getSkillLevel(tpz.skill.HEALING_MAGIC) / 12.5, 10, 40) * ((100 + casterGear) / 100)) * ((100 + targetGear) / 100)
    -- local power = utils.clamp(player:getSkillLevel(tpz.skill.HEALING_MAGIC) / 19.2, 10, 26) * ((100 + bonus) / 100)
	
	local PoisonRES = target:getMod(tpz.mod.POISONRES)
	local ParaRES = target:getMod(tpz.mod.PARALYZERES)
	local BlindRES = target:getMod(tpz.mod.BLINDRES)
	local SilenceRES = target:getMod(tpz.mod.SILENCERES)
	local VirusRES = target:getMod(tpz.mod.VIRUSRES)
	local PetrifyRES = target:getMod(tpz.mod.PETRIFYRES)
	local CurseRES = target:getMod(tpz.mod.CURSERES)
	
	if (caster:hasStatusEffect(tpz.effect.DIVINE_CARESS_I)) then
		if PoisonRES >= 100 then
			PoisonRES = PoisonRES - 100
			target:setMod(tpz.mod.POISONRES, PoisonRES)
		else
			target:setMod(tpz.mod.POISONRES, PoisonRES)
		end
		if ParaRES >= 100 then
			ParaRES = ParaRES - 100
			target:setMod(tpz.mod.PARALYZERES, ParaRES)
		else
			target:setMod(tpz.mod.PARALYZERES, ParaRES)
		end
		if BlindRES >= 100 then
			BlindRES = BlindRES - 100
			target:setMod(tpz.mod.BLINDRES, BlindRES)
		else
			target:setMod(tpz.mod.BLINDRES, BlindRES)
		end
		if SilenceRES >= 100 then
			SilenceRES = SilenceRES - 100
			target:setMod(tpz.mod.SILENCERES, SilenceRES)
		else
			target:setMod(tpz.mod.SILENCERES, SilenceRES)
		end
		if VirusRES >= 100 then
			VirusRES = VirusRES - 100
			target:setMod(tpz.mod.VIRUSRES, VirusRES)
		else
			target:setMod(tpz.mod.VIRUSRES, VirusRES)
		end
		if PetrifyRES >= 100 then
			PetrifyRES = PetrifyRES - 100
			target:setMod(tpz.mod.PETRIFYRES, PetrifyRES)
		else
			target:setMod(tpz.mod.PETRIFYRES, PetrifyRES)
		end
		if CurseRES >= 100 then
			CurseRES = CurseRES - 100
			target:setMod(tpz.mod.CURSERES,CurseRES)
		else
			target:setMod(tpz.mod.CURSERES,CurseRES)
		end
		caster:delStatusEffect(tpz.effect.DIVINE_CARESS_I)
		target:delStatusEffect(tpz.effect.DIVINE_CARESS_II)
		target:addStatusEffect(tpz.effect.DIVINE_CARESS_II, 1, 0, 180)
		target:addMod(tpz.mod.CURSERES, 100)
	end

    spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    if (target:hasStatusEffect(tpz.effect.DOOM) and power > math.random(1, 100)) then
        -- remove doom
        final = tpz.effect.DOOM
        target:delStatusEffect(tpz.effect.DOOM)
        spell:setMsg(tpz.msg.basic.NARROWLY_ESCAPE)
    elseif (curse ~= nil and curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(tpz.effect.CURSE_I)
        target:delStatusEffect(tpz.effect.CURSE_II)
        target:delStatusEffect(tpz.effect.BANE)
        final = tpz.effect.CURSE_II
        spell:setMsg(tpz.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif (curse ~= nil and bane ~= nil) then
        target:delStatusEffect(tpz.effect.CURSE_I)
        target:delStatusEffect(tpz.effect.BANE)
        final = tpz.effect.CURSE_I
        spell:setMsg(tpz.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif (curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(tpz.effect.CURSE_II)
        target:delStatusEffect(tpz.effect.BANE)
        final = tpz.effect.CURSE_II
        spell:setMsg(tpz.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif (curse ~= nil) then
        target:delStatusEffect(tpz.effect.CURSE_I)
        final = tpz.effect.CURSE_I
        spell:setMsg(tpz.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif (curse2 ~= nil) then
        target:delStatusEffect(tpz.effect.CURSE_II)
        final = tpz.effect.CURSE_II
        spell:setMsg(tpz.msg.basic.MAGIC_REMOVE_EFFECT)
    elseif (bane ~= nil) then
        target:delStatusEffect(tpz.effect.BANE)
        final = tpz.effect.BANE
        spell:setMsg(tpz.msg.basic.MAGIC_REMOVE_EFFECT)
    end

    return final
end