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

function onAbilityCheck(player, target, ability)
    -- Retail behavior for Fly High is 10 second recasts
	if (player:hasStatusEffect(tpz.effect.FLY_HIGH)) then
		ability:setRecast(10)
	end
	
	return 0,0
end

function onUseAbility(player, target, ability, action)
	local atkmulti = 1 + (player:getMod(tpz.mod.SPIRIT_JUMP_ATT_BONUS) / 100)
	local tpbonus = player:getMod(tpz.mod.SPIRIT_JUMP_TP_BONUS)
	local alljumpsbonus = player:getMod(tpz.mod.ALL_JUMPS_WYVERN_HP)
	
	local params = {}
	
	params.numHits = 1
	
	if (math.random(100) < player:getMod(tpz.mod.ALL_JUMPS_DOUBLE_ATTACK)) then
		params.numHits = 2
	end
	
	params.bonusJumpfSTR = player:getStat(tpz.mod.VIT) / 256
    params.ftp100 = 1.20 params.ftp200 = 1.20 params.ftp300 = 1.20
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = true
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = atkmulti params.atk200 = atkmulti params.atk300 = atkmulti
    params.bonusTP = tpbonus
    params.hitsHigh = true
	
	if ((player:hasPet() == true) and (player:getPetID() == tpz.pet.id.WYVERN)) then
		-- printf("spirit_jump.lua onUseAbility  PLAYER HAS WYVERN")
		local pet = player:getPet()
		params.alljumpsdmg = pet:getHP() * (alljumpsbonus / 100)
		atkmulti = atkmulti + (25 / 100)
		params.atk100 = atkmulti params.atk200 = atkmulti params.atk300 = atkmulti
		params.crit100 = 1.0 params.crit200 = 1.0 params.crit300 = 1.0
		tpbonus = tpbonus + 135
	end
	
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

    if target:isMob() then
        target:lowerEnmity(player, 30)
    end
	
	return damage
end