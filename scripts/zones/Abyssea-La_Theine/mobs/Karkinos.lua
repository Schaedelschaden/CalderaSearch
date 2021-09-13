-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Karkinos
-----------------------------------
require("scripts/globals/utils")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.SLEEPRES, 100)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:addMod(tpz.mod.DEF, 600)
	mob:delMod(tpz.mod.MDEF, 60)
	mob:delMod(tpz.mod.MEVA, 150)
end

function onMobFight(mob)
	local hpp = mob:getHPP()

	-- Changes skill list from Big Scissors/Bubble Shower to Mega Scissors/Venom Shower at 50% HP
	if (hpp > 50) then
		mob:setMobMod(tpz.mobMod.SKILL_LIST, 1166)
	elseif (hpp <= 50) then
		mob:setMobMod(tpz.mobMod.SKILL_LIST, 1167)
	end
	
	-- Physical Damage Resistance increases as HP lowers
	mob:setMod(tpz.mod.UDMGPHYS, -(100 - utils.clamp(hpp, 15, 70)))
	mob:setMod(tpz.mod.UDMGRANGE, -(100 - utils.clamp(hpp, 15, 70)))
end

function onMobDeath(mob, player, isKiller)
	
end