-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Kadraeth the Hatespawn
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addListener("EFFECT_LOSE", "MAGIC_SHIELD_LOSE", function(mobArg, effect)
		if effect:getType() == tpz.effect.MAGIC_SHIELD then
			mobArg:AnimationSub(0)
		end
    end)
end

function onMobFight(mob, target)
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 252 then -- Stun
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(20)
    end
end

function onMobDespawn(mob)
    mob:removeListener("MAGIC_SHIELD_LOSE")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MAGIC_SHIELD_LOSE")
end
