-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Adze
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 80)
	mob:setMod(tpz.mod.MOVE, 100)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "EMETIC_DISCHARGE_USED", function(mob, skillID)
		if (skillID == 1334) then
			local total = mob:getLocalVar("EMETIC_DISCHARGE_TOTAL")
			
			for i = 1, total do
				local effect = mob:getLocalVar("EMETIC_DISCHARGE_"..i)
				mob:delStatusEffect(effect)
				mob:setLocalVar("EMETIC_DISCHARGE_"..i, 0)
			end
			
			mob:getLocalVar("EMETIC_DISCHARGE_TOTAL", 0)
		end
    end)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("ADZE_ADD_EFFECT_TIMER", os.time())
end

function onMobFight(mob)
	local currentEffect = mob:getLocalVar("ADZE_ADD_EFFECT")
	local effectTimer = mob:getLocalVar("ADZE_ADD_EFFECT_TIMER")

	-- Switch Additional Effect
	if (os.time() - effectTimer >= 60 and currentEffect < 4) then
		mob:setLocalVar("ADZE_ADD_EFFECT", currentEffect + 1)
		mob:setLocalVar("ADZE_ADD_EFFECT_TIMER", os.time())
	elseif (os.time() - effectTimer >= 60 and currentEffect == 4) then
		mob:setLocalVar("ADZE_ADD_EFFECT", 0)
		mob:setLocalVar("ADZE_ADD_EFFECT_TIMER", os.time())
	end
end

function onAdditionalEffect(mob, target, damage)
	local additionalEffect
	local currentEffect = mob:getLocalVar("ADZE_ADD_EFFECT")
	
	local params = {}
		params.chance = 10
	
	if (currentEffect == 0) then
		additionalEffect = tpz.mob.ae.PLAGUE
		params.power = 5
	elseif (currentEffect == 1) then
		additionalEffect = tpz.mob.ae.SILENCE
	elseif (currentEffect == 2) then
		additionalEffect = tpz.mob.ae.PETRIFY
		params.duration = 15
	elseif (currentEffect == 3) then
		additionalEffect = tpz.mob.ae.SLOW
		params.power = 2500
	elseif (currentEffect == 4) then
		additionalEffect = tpz.mob.ae.DOOM
	end
	
    return tpz.mob.onAddEffect(mob, target, damage, additionalEffect, params)
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("EMETIC_DISCHARGE_USED")
	tpz.abyssea.kiOnMobDeath(mob, player)
end