-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Ulhuadshi
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:setBehaviour(bit.band(mob:getBehaviour(), bit.bnot(tpz.behavior.NO_TURN)))
    mob:addMod(tpz.mod.SLOWRES, 85)
    mob:addMod(tpz.mod.GRAVITYRES, 85)
    mob:addMod(tpz.mod.STUNRES, 85)
    mob:addMod(tpz.mod.PARALYZERES, -25)
    mob:addMod(tpz.mod.POISONRES, -25)

    -- Absorbs all damage during and shortly after using TP moves
    mob:addListener("WEAPONSKILL_STATE_ENTER", "ULHUADSHI_MOBSKILL_START", function(mob, skill)
		mob:setMod(tpz.mod.PHYS_ABSORB, 100)
        mob:setMod(tpz.mod.MAGIC_ABSORB, 100)

        -- Absorb wears off after 5-10s even if the TP move was stunned
        mob:timer(math.random(5, 10) * 1000, function(mob)
            mob:setMod(tpz.mod.PHYS_ABSORB, 0)
            mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
        end)
    end)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("ULHUADSHI_MOBSKILL_START")
end
