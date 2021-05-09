-----------------------------------
-- Area: Stellar Fulcrum
--  Mob: Kam'lanaut
-- Zilart Mission 8 BCNM Fight
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob) -- When mob spawns (either forced or time)
	mob:setMod(tpz.mod.PARALYZERES, 50) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 100) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 50) -- Resistance to Slow
    mob:setMod(tpz.mod.SLEEPRES, 50) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 50) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 50) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 50) -- Resistance to Poison
	mob:setMod(tpz.mod.ATT, 1200) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 200) -- Magic Attack (Compare to MDEF)
    mob:setMod(tpz.mod.ACC, 850) -- Accuracy (compare to EVA)
	mob:setMod(tpz.mod.MACC, 600) -- Magic ACC (Compare to MEVA)
	mob:setMod(tpz.mod.EVA, 800) -- Evasion (Compare to ACC)
	mob:setMod(tpz.mod.DEF, 1000) -- Defense (Compart to ATT)
	mob:setMod(tpz.mod.MEVA, 100) -- Magic Evasion (Compare to MACC)
	mob:setMod(tpz.mod.MDEF, 300) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.REGAIN, 150)
end

local skillToAbsorb =
{
    [823] = tpz.mod.FIRE_ABSORB,  -- fire_blade
    [824] = tpz.mod.ICE_ABSORB,   -- frost_blade
    [825] = tpz.mod.WIND_ABSORB,  -- wind_blade2
    [826] = tpz.mod.EARTH_ABSORB, -- earth_blade
    [827] = tpz.mod.LTNG_ABSORB,  -- lightning_blade
    [828] = tpz.mod.WATER_ABSORB, -- water_blade
}

function onMobEngaged(mob, target)
    mob:setLocalVar("nextEnSkill", os.time() + 10)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("nextEnSkill") then
        local skill = math.random(823, 828)
        mob:setLocalVar("currentTP", mob:getTP())
        mob:useMobAbility(skill)
        mob:setLocalVar("nextEnSkill", os.time() + 20)
    end
end

function onMobWeaponSkill(target, mob, skill)
    local skillId = skill:getID()
    local absorbId = skillToAbsorb[skillId]

    if absorbId then
        -- ----------------------------------------------------------------------
        -- when using en-spell weapon skill, absorb damage of that element type
        -- ----------------------------------------------------------------------

        -- remove previous absorb mod, if set
        local previousAbsorb = mob:getLocalVar("currentAbsorb")

        if previousAbsorb > 0 then
            mob:setMod(previousAbsorb, 0)
        end

        -- add new absorb mod
        mob:setLocalVar("currentAbsorb", absorbId)
        mob:setMod(absorbId, 100)

        -- return TP
        mob:setTP(mob:getLocalVar("currentTP"))
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.DESTROYER_OF_ANTIQUITY)
end
