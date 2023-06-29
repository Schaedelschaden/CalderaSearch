-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Titlacauan
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 05/26/22 - Needs to be set up

	mob:addMod(tpz.mod.EVA, 100)
	mob:setMod(tpz.mod.MACC, 650)
	mob:setMod(tpz.mod.MATT, 200)
end    

function onMobFight(mob, target)
	
end
	
function onSpellPrecast(mob, spell)
    --FIRAGA IV = add blaze spikes
	if (spell:getID() == 177) then
		mob:delStatusEffect(tpz.effect.DREAD_SPIKES)
		mob:delStatusEffect(tpz.effect.ICE_SPIKES)
		mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 1, 0, 0)
	end
	--BLIZZAGA IV = add ice spikes and frost
	if (spell:getID() == 182) then
		mob:delStatusEffect(tpz.effect.DREAD_SPIKES)
		mob:delStatusEffect(tpz.effect.BLAZE_SPIKES)
		mob:addStatusEffect(tpz.effect.ICE_SPIKES, 1, 0, 0)
	end
	--DREAD SPIKES setup
	if (spell:getID() == 245) then
		local duration = 120
        local typeEffect = tpz.effect.DREAD_SPIKES
        local drainAmount = mob:getMaxHP() / 50

        mob:addStatusEffect(typeEffect, 0, 0, duration, 0, drainAmount, 1)
		mob:delStatusEffect(tpz.effect.BLAZE_SPIKES)
		mob:delStatusEffect(tpz.effect.ICE_SPIKES)
	end
end  

function onSpikesDamage(mob, target, damage)
	local dmg = 200

	if (mob:hasStatusEffect(tpz.effect.BLAZE_SPIKES)) then
		return tpz.subEffect.BLAZE_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
	elseif (mob:hasStatusEffect(tpz.effect.ICE_SPIKES)) then
		return tpz.subEffect.ICE_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
	end
end

function onMobDespawn(mob)
   
end

function onMobDeath(mob, player, isKiller)

end
