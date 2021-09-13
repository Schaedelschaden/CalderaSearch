-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Cannered Noz
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.MOVE, 100)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.SILENCERES, 85)
	mob:addMod(tpz.mod.MDEF, 100)
	mob:addMod(tpz.mod.MEVA, 100)
	mob:setMod(tpz.mod.FASTCAST, 35)
	mob:setMod(tpz.mod.ELEMENTAL_CELERITY, 25)
	mob:setMod(tpz.mod.SPELLINTERRUPT, 100)
end

function onMobEngaged(mob, target)
	-- Uses Corpse Breath immediately on spawn
	mob:useMobAbility(2511)
end

function onMobFight(mob, target)
	local hpp = mob:getHPP()

	-- Physical Damage Resistance increases as HP lowers
	mob:setMod(tpz.mod.UDMGPHYS, -(100 - utils.clamp(hpp, 50, 100)))
	mob:setMod(tpz.mod.UDMGRANGE, -(100 - utils.clamp(hpp, 50, 100)))
	
	if (hpp <= 66 and hpp >= 34) then
		mob:setSpellList(452)
	elseif (hpp <= 33) then
		mob:setSpellList(453)
	end
end

function onMobDeath(mob, player, isKiller)
	
end