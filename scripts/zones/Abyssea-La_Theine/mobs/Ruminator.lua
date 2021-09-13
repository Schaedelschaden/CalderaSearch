-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Ruminator
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/utils")
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.DEF, 400)

	-- Mighty Strikes adds Triple Attack
	mob:addListener("EFFECT_GAIN", "MIGHTY_STRIKES_GAIN", function(mob, effect)
		if effect:getType() == tpz.effect.MIGHTY_STRIKES then
			mob:setMod(tpz.mod.TRIPLE_ATTACK, 50)
		end
    end)
	
	mob:addListener("EFFECT_LOSE", "MIGHTY_STRIKES_LOSE", function(mob, effect)
		if effect:getType() == tpz.effect.MIGHTY_STRIKES then
			mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
		end
    end)
end

function onMobFight(mob)
	local hpp = mob:getHPP()

	-- Regain increases as HP lowers
	mob:setMod(tpz.mod.REGAIN, 150 - hpp)
	
	local resistances = {tpz.mod.FIRERES, tpz.mod.ICERES, tpz.mod.WINDRES, tpz.mod.EARTHRES, tpz.mod.THUNDERRES, tpz.mod.WATERRES, tpz.mod.LIGHTRES, tpz.mod.DARKRES}
	
	if (mob:getBattleTime() % 10 == 0) then
		for i = 1, 8 do
			if (os.time() - mob:getLocalVar("ELEMENTAL_RESIST_"..i) >= 10 and mob:getMod(resistances[i]) > 0) then
				mob:delMod(resistances[i], 15)
			end
		end
	end
end

function onMagicHit(caster, mob, spell)
	-- Damage Type - Fire: 1 Ice: 2 Wind: 3 Earth: 4 Thunder: 5 Water: 6 Light: 7 Dark: 8
    local element = spell:getElement()
	local resistances = {tpz.mod.FIRERES, tpz.mod.ICERES, tpz.mod.WINDRES, tpz.mod.EARTHRES, tpz.mod.THUNDERRES, tpz.mod.WATERRES, tpz.mod.LIGHTRES, tpz.mod.DARKRES}

	for i = 1, 8 do
		if (element == i and mob:getMod(resistances[i]) < 750) then
			mob:addMod(resistances[i], 15)
			mob:setLocalVar("ELEMENTAL_RESIST_"..i, os.time())
		end
	end
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	mob:removeListener("MIGHTY_STRIKES_GAIN")
	mob:removeListener("MIGHTY_STRIKES_LOSE")
end