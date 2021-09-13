-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Depths Digestor
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 40)
	mob:setMod(tpz.mod.STUNRES, 100)
	mob:setMod(tpz.mod.SILENCERES, 90)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.REFRESH, 20)
	mob:AnimationSub(2) -- Dark?
end

function onMobFight(mob)
	
end

function onSpellPrecast(mob, spell)
	mob:setLocalVar("LastSpellElement", spell:getElement())
	
	if (spell:getID() == 227) then -- Poisonga
		mob:setLocalVar("LastSpellElement", 7)
	elseif (spell:getID() == 357) then -- Slowga
		mob:setLocalVar("LastSpellElement", 8)
	elseif (spell:getID() == 359) then -- Silencega
		mob:setLocalVar("LastSpellElement", 9)
	end
end

function onAdditionalEffect(mob, target, damage)
	local element = mob:getLocalVar("LastSpellElement")
	local addEffect
	local effects = {tpz.mob.ae.ENFIRE, tpz.mob.ae.ENSTONE, tpz.mob.ae.ENWATER, tpz.mob.ae.ENAERO, tpz.mob.ae.ENBLIZZARD, tpz.mob.ae.ENTHUNDER}
	local strength = math.random(80, 110)

	if (element == 0 or element == nil) then -- No element
		return 0
	elseif (element >= 1) then
		
		if (element <= 6) then
			addEffect = effects[element]
		elseif (element == 7) then
			addEffect = tpz.mob.ae.POISON
			strength = 35
		elseif (element == 8) then
			addEffect = tpz.mob.ae.SLOW
			strength = 2920
		elseif (element == 9) then
			addEffect = tpz.mob.ae.SILENCE
			strength = 1
		end
	end
	
	return tpz.mob.onAddEffect(mob, target, damage, addEffect, {chance = 100, power = strength})
end

function onMobDeath(mob, player, isKiller)
	
end