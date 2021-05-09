-----------------------------------
-- Ability: Soul Jump
-- Delivers a high jumping attack on a targeted enemy which suppresses enmity. Effect enhanced when wyvern is present.
-- Obtained: Dragoon Level 85
-- Recast Time: 2:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/weaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	-- Retail behavior for Fly High is 10 second recasts. Caldera is set to 2 second
	if (player:hasStatusEffect(tpz.effect.FLY_HIGH)) then
		ability:setRecast(utils.clamp(2, 0, 2))
	end
	return 0,0
end

function onUseAbility(player, target, ability, action)
    local ftp = 1 + (player:getStat(tpz.mod.VIT) / 256)
	local atkmulti = (player:getMod(tpz.mod.SOUL_JUMP_ATT_BONUS) + 100) / 100
	local tpbonus
	local alljumpsbonus = player:getMod(tpz.mod.ALL_JUMPS_WYVERN_HP)
	local alljumpsdmg = 0
	
	local params = {}
    
	if ((player:hasPet() == true) and (player:getPetID() == tpz.pet.id.WYVERN)) then
		local pet = player:getPet()
		alljumpsdmg = pet:getHP() * (alljumpsbonus / 100)
		atkmulti = atkmulti + (50 / 100)
		params.crit100 = 1.0 params.crit200 = 1.0 params.crit300 = 1.0
		tpbonus = 270
	end
	
	params.numHits = 1
	
	if (math.random(100) < player:getMod(tpz.mod.ALL_JUMPS_DOUBLE_ATTACK)) then
		params.numHits = 2
	end
	
    params.ftp100 = ftp params.ftp200 = ftp params.ftp300 = ftp
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.0 params.mnd_wsc = 0.0 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = true
    params.acc100 = 0.0 params.acc200= 0.0 params.acc300= 0.0
    params.atk100 = atkmulti params.atk200 = atkmulti params.atk300 = atkmulti
    params.bonusTP = tpbonus
    params.hitsHigh = true

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
	
	target:lowerEnmity(player, 65)

	if (alljumpsbonus > 0) then
--		printf("Damage 1: [%i] All Jumps DMG: [%i]\n", damage, alljumpsdmg)
		damage = damage + alljumpsdmg
--		printf("Damage 2: [%i]\n", damage)
		return damage	
	else
		return damage
	end
end