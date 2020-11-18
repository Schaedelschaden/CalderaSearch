-----------------------------------
-- Ability: Run Wild
-- Your familiar will gain heightened powers, but will disappear when the effect expires. 
-- Obtained: Beastmaster Level 93
-- Recast Time: 15:00
-- Duration: 05:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
--	local pet = player:getPet()
	target:addStatusEffect(tpz.effect.RUN_WILD, 1, 0, 30)
	
	local ATTP = target:getMod(tpz.mod.ACC) * 0.25
	local DEFP = target:getMod(tpz.mod.DEF) * 0.25
	local ACCP = target:getMod(tpz.mod.ACC) * 0.25
	local MATTP = target:getMod(tpz.mod.MATT) * 0.25
	local MACCP = target:getMod(tpz.mod.MACC) * 0.25
	local EVAP = target:getMod(tpz.mod.EVA) * 0.25
	local MEVAP = target:getMod(tpz.mod.MEVA) * 0.25
	
--	print(ACCP)

	target:addMod(tpz.mod.ATT, ATTP)
	target:addMod(tpz.mod.DEF, DEFP)
	target:addMod(tpz.mod.ACC, ACCP)
	target:addMod(tpz.mod.MATT, MATTP)
	target:addMod(tpz.mod.MACC, MACCP)
	target:addMod(tpz.mod.EVA, EVAP)
	target:addMod(tpz.mod.MEVA, MEVAP)
	target:addMod(tpz.mod.REGEN, 12)
end
