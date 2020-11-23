-----------------------------------
--
-- tpz.effect.ELEMENTAL_SFORZO
--
-----------------------------------
require("scripts/globals/status")

function onEffectGain(target, effect)
    local StatusRES =
	{tpz.mod.SLEEPRES, tpz.mod.POISONRES, tpz.mod.PARALYZERES, tpz.mod.BLINDRES, tpz.mod.SILENCERES, tpz.mod.VIRUSRES, tpz.mod.PETRIFYRES, tpz.mod.BINDRES,
	tpz.mod.CURSERES, tpz.mod.GRAVITYRES, tpz.mod.SLOWRES, tpz.mod.STUNRES, tpz.mod.CHARMRES, tpz.mod.AMNESIARES, tpz.mod.LULLABYRES, tpz.mod.DEATHRES}
	
	target:addMod(tpz.mod.UDMGMAGIC, -100)
	
	for i,v in ipairs(StatusRES) do
		target:addMod(StatusRES[i], 100)
	end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	local StatusRES =
	{tpz.mod.SLEEPRES, tpz.mod.POISONRES, tpz.mod.PARALYZERES, tpz.mod.BLINDRES, tpz.mod.SILENCERES, tpz.mod.VIRUSRES, tpz.mod.PETRIFYRES, tpz.mod.BINDRES,
	tpz.mod.CURSERES, tpz.mod.GRAVITYRES, tpz.mod.SLOWRES, tpz.mod.STUNRES, tpz.mod.CHARMRES, tpz.mod.AMNESIARES, tpz.mod.LULLABYRES, tpz.mod.DEATHRES}

    target:delMod(tpz.mod.UDMGMAGIC, -100)
	
	for i,v in ipairs(StatusRES) do
		target:delMod(StatusRES[i], 100)
	end
end