-----------------------------------
--
-- tpz.effect.DIVINE_CARESS
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)

end

function onEffectTick(target,effect)

end

function onEffectLose(target,effect)
	local PoisonRES = target:getMod(tpz.mod.POISONRES)
	local ParaRES = target:getMod(tpz.mod.PARALYZERES)
	local BlindRES = target:getMod(tpz.mod.BLINDRES)
	local SilenceRES = target:getMod(tpz.mod.SILENCERES)
	local VirusRES = target:getMod(tpz.mod.VIRUSRES)
	local PetrifyRES = target:getMod(tpz.mod.PETRIFYRES)
	local CurseRES = target:getMod(tpz.mod.CURSERES)
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
end
