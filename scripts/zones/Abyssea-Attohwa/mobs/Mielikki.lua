-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Mielikki
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    local tierAby = 2
    local tierMob = 1

    -- Load default T2 stat increases
    tpz.abyssea.updateBaseStats(mob, tierAby, tierMob)

	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 05/26/22 - Needs to be set up
	mob:addMod(tpz.mod.FIRERES, -50)
	mob:addMod(tpz.mod.ICERES, -50)
	mob:addMod(tpz.mod.THUNDERRES, 50)
	mob:addMod(tpz.mod.SILENCERES, 100)
	mob:addMod(tpz.mod.GRAVITYRES, 100)
	mob:addMod(tpz.mod.STUNRES, 90)
	mob:addStatusEffect(tpz.effect.STONESKIN, 10000, 0, 600, 0, 0, 4)
end

function onMobFight(mob, target)
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 286) then -- Addle
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(15)
    end
end

function onMobDeath(mob, player, isKiller)
end
