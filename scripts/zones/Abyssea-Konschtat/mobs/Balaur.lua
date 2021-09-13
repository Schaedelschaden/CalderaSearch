-----------------------------------
-- Area: Abyssea - Konschtat (15)
--   NM: Balaur
-- TODO: When its HP is under 50%, Balaur has a chance to gain
-- a spikes effect after using Breath attacks (matches element of breath)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob, target)
    -- Uses different upgraded breath attack starting at 50% hp.
    if mob:getHPP() >= 50 then
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 790)
    else
        -- I'm assuming that if it heals up, it goes back to the other skill list.
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 791)
        -- This 'else' can be removed if that isn't the case, and a localVar added so it only execs once.
    end
end

function onAdditionalEffect(mob, target, damage)
	if (mob:hasStatusEffect(tpz.effect.ICE_SPIKES) or mob:hasStatusEffect(tpz.effect.SHOCK_SPIKES) or mob:hasStatusEffect(tpz.effect.DREAD_SPIKES)) then
		local params = {}
			params.chance = 100
			params.power = 100
			
		local enEffect
		if (mob:hasStatusEffect(tpz.effect.ICE_SPIKES)) then
			enEffect = tpz.mob.ae.ENBLIZZARD
		elseif (mob:hasStatusEffect(tpz.effect.SHOCK_SPIKES)) then
			enEffect = tpz.mob.ae.ENTHUNDER
		elseif (mob:hasStatusEffect(tpz.effect.DREAD_SPIKES)) then
			enEffect = tpz.mob.ae.ENDARK
		end

		return tpz.mob.onAddEffect(mob, target, damage, enEffect)
	else
		return 0
	end
end

function onMobDeath(mob, player, isKiller)
end
