-----------------------------------
-- Geomancer helpers
-----------------------------------
require("scripts/globals/pets")
require("scripts/globals/status")
-----------------------------------

tpz = tpz or {}
tpz.geo = tpz.geo or {}

tpz.geo.spawnLuopan = function(player, target, spell, tickEffect, tickPower, targetType)
	tpz.pet.spawnPet(player, tpz.pet.id.LUOPAN)
    local luopan = player:getPet()
	local power = tickPower
	local element = spell:getElement()
    local visibleAura = element
	
	-- Set up the luopan
	-- Save the mp cost for use with Full Circle
    luopan:setLocalVar("MP_COST", spell:getMPCost())

    -- Change the luopans appearance to match the effect
    -- TODO: This should be set in core
    local modelOffset = 2850
	
	if targetType == tpz.auraTarget.ENEMIES then
		modelOffset = 2858
	end
	
	luopan:setModelId(modelOffset + visibleAura)
	
	local regenDown = math.floor(luopan:getMainLvl() / 4)

	
	if (player:hasStatusEffect(tpz.effect.BLAZE_OF_GLORY)) then
		power = power * 1.5
		luopan:setHP(luopan:getMaxHP() * 0.5)
--		printf("geo.lua spawnLuopan BLAZE OF GLORY POWER: [%i]", power)
		player:delStatusEffect(tpz.effect.BLAZE_OF_GLORY)
	end
	
	if (player:hasStatusEffect(tpz.effect.BOLSTER)) then
		power = power * 2
		luopan:addMod(tpz.mod.HP, luopan:getMaxHP() * 0.75)
		regenDown = math.floor(luopan:getMainLvl() / 24)
--		printf("geo.lua spawnLuopan BOLSTER POWER: [%i]", power)
	end
	
	-- Apply the HP loss over time modifier
    luopan:addMod(tpz.mod.REGEN_DOWN, regenDown)

    -- Innate Damage Taken -50%
    luopan:addMod(tpz.mod.DMG, -50)
	
	-- Set the luopan's location to the target if using an offensive GEO-colure spell
	local pos = target:getPos()
	luopan:setPos(pos.x, pos.y, pos.z)
	
    -- Attach effect
	luopan:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, visibleAura, 3, 0, tickEffect, power, targetType, tpz.effectFlag.AURA)
--	printf("geo.lua spawnLuopan VISIBLE AURA: [%i]  TICK EFFECT: [%s]  POWER:  [%i]  TARGET TYPE: [%s]", visibleAura, tickEffect, power, targetType)
	
	-- Heals the luopan to full if the player has Bolster.
	-- Appears to apply too quickly and has no effect when added to the previous Bolster if statement.
	if (player:hasStatusEffect(tpz.effect.BOLSTER)) then
		luopan:setHP(luopan:getMaxHP())
	end
end

function GeomancyPotency(caster)
	local potency = 0
	local equip = {caster:getEquipID(tpz.slot.MAIN), caster:getEquipID(tpz.slot.SUB), caster:getEquipID(tpz.slot.RANGED), caster:getEquipID(tpz.slot.NECK)}
	
	-- [1]Idris 119 I, [2]Idris 119 II, [3]Eminent Bell, [4]Nepote Bell, [5]Dunna, [6]Bagua Charm, [7]Bagua Charm +1, [8]Bagua Charm +2
	local item = {21070, 21080, 21462, 21463, 21372, 25537, 25538, 25539}
	
	-- Geomancy potency (Geomancy +) is based off the highest value present
	-- The modifiers do NOT stack with each other
	if (equip[3] == item[3]) then
        potency = 3
--		printf("geo.lua GeomancyPotency Eminent Bell RECOGNIZED BUFF: [%i]\n", potency)
	end
	if (equip[3] == item[4] or equip[3] == item[5] or equip[4] == item[6]) then
        potency = 5
--		printf("geo.lua GeomancyPotency Nepote Bell/Dunna/Bagua Charm RECOGNIZED BUFF: [%i]\n", potency)
	end
	if (equip[4] == item[7]) then
		potency = 6
--		printf("geo.lua GeomancyPotency Bagua Charm +1 RECOGNIZED BUFF: [%i]\n", potency)
	end
	if (equip[4] == item[8]) then
		potency = 7
--		printf("geo.lua GeomancyPotency Bagua Charm +2 RECOGNIZED BUFF: [%i]\n", potency)
	end
	if (equip[1] == item[1] or equip[1] == item[2] or equip[2] == item[1] or equip[2] == item[2]) then
		potency = 10
--		printf("geo.lua GeomancyPotency Idris RECOGNIZED BUFF: [%i]\n", potency)
	end

    return potency
end