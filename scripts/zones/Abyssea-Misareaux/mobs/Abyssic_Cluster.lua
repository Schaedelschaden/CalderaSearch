-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Abyssic Cluster
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.STUNRES, 85)
    mob:addMod(tpz.mod.FIRE_ABSORB, 100)
    mob:addMod(tpz.mod.FASTCAST, 35)

    mob:addListener("MAGIC_STATE_EXIT", "FIRE_V_USED", function(mob, spell, action)
        -- Restore 1 cluster lost from Self Destruct based on mob animation
		if
            spell:getID() == 148 and -- Fire V
            mob:AnimationSub() > 0   -- 3 clusters
        then
			mob:AnimationSub(mob:AnimationSub() - 1)
		end
    end)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
    mob:removeListener("FIRE_V_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("FIRE_V_USED")
end
