---------------------------------------------
-- Ultimate Terror (Diabolos Blood Pact)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	return 0,0
end

function onPetAbility(target, pet, skill)
	local globalMult = ABSORB_SPELL_AMOUNT
	local absorbAmount = 21 * globalMult
	local absorbSelector = math.random(1,8)
	
--	printf("Ultimate Terror PET onPetAbility GLOBAL MULT: [%i]  ABSORB AMOUNT: [%i]  SELECTOR: [%i]\n", globalMult, absorbAmount, absorbSelector)
	
	if (absorbSelector == 1) then
--		printf("Ultimate Terror PET onPetAbility STR DRAINED\n")
		target:addStatusEffect(tpz.effect.STR_DOWN, absorbAmount, 0, 90)
		pet:addStatusEffect(tpz.effect.STR_BOOST, absorbAmount, 0, 90)
	end
	if (absorbSelector == 2) then
--		printf("Ultimate Terror PET onPetAbility DEX DRAINED\n")
		target:addStatusEffect(tpz.effect.DEX_DOWN, absorbAmount, 0, 90)
		pet:addStatusEffect(tpz.effect.DEX_BOOST, absorbAmount, 0, 90)
	end
	if (absorbSelector == 3) then
--		printf("Ultimate Terror PET onPetAbility VIT DRAINED\n")
		target:addStatusEffect(tpz.effect.VIT_DOWN, absorbAmount, 0, 90)
		pet:addStatusEffect(tpz.effect.VIT_BOOST, absorbAmount, 0, 90)
	end
	if (absorbSelector == 4) then
--		printf("Ultimate Terror PET onPetAbility AGI DRAINED\n")
		target:addStatusEffect(tpz.effect.AGI_DOWN, absorbAmount, 0, 90)
		pet:addStatusEffect(tpz.effect.AGI_BOOST, absorbAmount, 0, 90)
	end
	if (absorbSelector == 5) then
--		printf("Ultimate Terror PET onPetAbility INT DRAINED\n")
		target:addStatusEffect(tpz.effect.INT_DOWN, absorbAmount, 0, 90)
		pet:addStatusEffect(tpz.effect.INT_BOOST, absorbAmount, 0, 90)
	end
	if (absorbSelector == 6) then
--		printf("Ultimate Terror PET onPetAbility MND DRAINED\n")
		target:addStatusEffect(tpz.effect.MND_DOWN, absorbAmount, 0, 90)
		pet:addStatusEffect(tpz.effect.MND_BOOST, absorbAmount, 0, 90)
	end
	if (absorbSelector == 7) then
--		printf("Ultimate Terror PET onPetAbility CHR DRAINED\n")
		target:addStatusEffect(tpz.effect.CHR_DOWN, absorbAmount, 0, 90)
		pet:addStatusEffect(tpz.effect.CHR_BOOST, absorbAmount, 0, 90)
	end
	if (absorbSelector == 8) then
--		printf("Ultimate Terror PET onPetAbility ACC DRAINED\n")
		target:addStatusEffect(tpz.effect.ACC_DOWN, absorbAmount, 0, 90)
		pet:addStatusEffect(tpz.effect.ACC_BOOST, absorbAmount, 0, 90)
	end
	
	skill:setMsg(tpz.msg.basic.NONE)
	
	return 0
end