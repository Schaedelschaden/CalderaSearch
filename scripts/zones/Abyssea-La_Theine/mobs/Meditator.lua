-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Meditator
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	-- Meditator receives 20-30 shadows from Occultation
	mob:addListener("EFFECT_GAIN", "OCCULTATION_GAIN", function(mob, effect)
		if effect:getType() == tpz.effect.BLINK then
			mob:setMod(tpz.mod.BLINK, math.random(20, 30))
		end
    end)
end

function onMobFight(mob)
	
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("OCCULTATION_GAIN")
end