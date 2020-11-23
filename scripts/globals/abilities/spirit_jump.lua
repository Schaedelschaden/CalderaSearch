-----------------------------------
-- Ability: Spirit Jump
-- Delivers a short jumping attack on a targeted enemy which suppresses enmity. Effect enhanced when wyvern is present.
-- Obtained: Dragoon Level 77
-- Recast Time: 1:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/weaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    -- Retail behavior for Fly High is 10 second recasts. Caldera is set to 2 second
	if (player:hasStatusEffect(tpz.effect.FLY_HIGH)) then
		ability:setRecast(utils.clamp(2, 0, 2))
	end
	return 0,0
end

function onUseAbility(player,target,ability,action)
    local ftp = 1 + (player:getStat(tpz.mod.VIT) / 256)
	local atkmulti = (player:getMod(tpz.mod.JUMP_ATT_BONUS) + 100) / 100
--	printf("Spirit Jump onUseAbility atkmulti Var 1: [%f]\n", atkmulti)
	local tpbonus = player:getMod(tpz.mod.JUMP_TP_BONUS)
	local alljumpsbonus = player:getMod(tpz.mod.ALL_JUMPS_WYVERN_HP)
--	printf("Spirit Jump onUseAbility All Jumps Bonus Var: [%i]\n", alljumpsbonus)
	local alljumpsdmg = 0
	
	if ((player:hasPet() == true) and (player:getPetID() == tpz.pet.id.WYVERN)) then
		local pet = player:getPet()
		alljumpsdmg = pet:getHP() * (alljumpsbonus / 100)
--		printf("Spirit Jump onUseAbility All Jumps Damage Var: [%i]\n", alljumpsdmg)
		atkmulti = atkmulti + 3
--		printf("Spirit Jump onUseAbility atkmulti Var 2: [%f]\n", atkmulti)
--		player:addMod(tpz.mod.JUMP_ATT_BONUS, 25)
		player:addMod(tpz.mod.FORCE_JUMP_CRIT, 1)
		tpbonus = tpbonus + 135
	end
	
	local params = {}
	
	params.numHits = 1
    params.ftp100 = ftp params.ftp200 = ftp params.ftp300 = ftp
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = true
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = atkmulti params.atk200 = atkmulti params.atk300 = atkmulti
    params.bonusTP = tpbonus
    params.hitsHigh = false
	
	if (player:getMod(tpz.mod.FORCE_JUMP_CRIT) > 0) then
        params.crit100 = 1.0 params.crit200 = 1.0 params.crit300 = 1.0
    end

    local taChar = player:getTrickAttackChar(target)
    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, 0, params, 0, action, true, taChar)
	
    if (tpHits + extraHits > 0) then
        if (criticalHit) then
            action:speceffect(target:getID(), 38)
        end
        action:messageID(target:getID(), tpz.msg.basic.USES_JA_TAKE_DAMAGE)
        action:speceffect(target:getID(), 32)
    else
        action:messageID(target:getID(), tpz.msg.basic.JA_MISS_2)
        action:speceffect(target:getID(), 0)
    end
		
	target:lowerEnmity(player, 30)
	
	if (player:hasPet() == true) then
		if (alljumpsbonus > 0) then
--			printf("Damage 1: [%i] All Jumps DMG: [%i]\n", damage, alljumpsdmg)
			damage = damage + alljumpsdmg
--			printf("Damage 2: [%i]\n", damage)
--			player:delMod(tpz.mod.JUMP_ATT_BONUS, 25)
			player:delMod(tpz.mod.FORCE_JUMP_CRIT, 1)
		end
	end
	return damage
end